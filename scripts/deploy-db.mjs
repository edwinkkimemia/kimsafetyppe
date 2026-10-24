#!/usr/bin/env node
/**
 * Ensure the database schema is up to date before deploying.
 *
 * The KimSafety Postgres database was originally built from raw SQL (the
 * SQLite -> Postgres migration script + the DDL previously embedded in
 * src/lib/db.ts), so it has tables but no Prisma `_prisma_migrations` history.
 * Running `prisma migrate deploy` on such a database fails with P3005
 * ("database schema is not empty") — which is exactly what would happen on
 * Vercel, where the `upload_files` table is missing.
 *
 * This script adopts an existing database for Prisma:
 *   1. If a non-empty Prisma migration history exists → just run `migrate deploy`.
 *   2. Otherwise, record the migrations whose effects are already present in the
 *      database as "applied" (`prisma migrate resolve --applied`), then run
 *      `prisma migrate deploy` to apply whatever is still missing (e.g.
 *      upload_files, reviews, newsletter_subscribers).
 *
 * Safe and idempotent on any database: fresh, already Prisma-managed, or
 * built from raw SQL. Reads DIRECT_URL / DATABASE_URL_UNPOOLED (direct) or
 * DATABASE_URL (pooled) from the environment (`.env` is loaded via dotenv).
 */

import "dotenv/config";
import { execSync } from "node:child_process";
import pg from "pg";

// Migrations must run against the *direct* Postgres host. Neon's Vercel
// integration exposes it as DATABASE_URL_UNPOOLED (Prisma docs call it
// DIRECT_URL); older integrations/CI setups use DIRECT_URL.
function resolveMigrationUrl() {
  const direct =
    process.env.DIRECT_URL ??
    process.env.DATABASE_URL_UNPOOLED ??
    process.env.DATABASE_POSTGRES_URL_NON_POOLING ??
    process.env.POSTGRES_URL_NON_POOLING;
  if (direct) return direct;
  const pooled =
    process.env.DATABASE_URL ??
    process.env.DATABASE_POSTGRES_URL ??
    process.env.POSTGRES_URL ??
    process.env.DATABASE_POSTGRES_PRISMA_URL ??
    process.env.POSTGRES_PRISMA_URL;
  if (!pooled) return undefined;
  // Neon pooled hosts look like ep-xxx-pooler.region.aws.neon.tech; the direct
  // host is the same name without the "-pooler" suffix.
  if (/neon\.tech/i.test(pooled)) return pooled.replace(/-pooler(?=\.)/, "");
  return pooled;
}

// Used by vercel.json's buildCommand: on a real Vercel build the sensitive DB
// env vars are available and migrations run; in `vercel build` (prebuilt CI)
// or preview builds they are not, so skip instead of failing the build.
const ifPossible = process.argv.includes("--if-possible");
const shouldSeed = process.argv.includes("--seed");
const vercelEnv = process.env.VERCEL_ENV;
if (ifPossible && vercelEnv && vercelEnv !== "production") {
  console.log(`deploy-db: skipping migrations for VERCEL_ENV=${vercelEnv}`);
  process.exit(0);
}

const url = resolveMigrationUrl();
if (!url) {
  if (ifPossible) {
    console.warn("deploy-db: no database URL available in this build context — skipping migrations");
    process.exit(0);
  }
  console.error(
    "deploy-db: DIRECT_URL, DATABASE_URL_UNPOOLED, DATABASE_POSTGRES_URL_NON_POOLING or DATABASE_URL environment variable is required"
  );
  process.exit(1);
}
if (!/^postgres(ql)?:\/\//i.test(url)) {
  if (ifPossible) {
    console.warn("deploy-db: database URL is a [SENSITIVE] placeholder in this build context — skipping migrations");
    process.exit(0);
  }
  console.error(
    "deploy-db: the resolved database URL is a placeholder, not a postgres:// URL.\n" +
      "deploy-db: Vercel hides 'sensitive' env vars from `vercel pull`/CI.\n" +
      "deploy-db: set the Neon direct URL as a GitHub Actions secret named DIRECT_URL (or DATABASE_URL_UNPOOLED), or re-add the env vars in Vercel as non-sensitive."
  );
  process.exit(1);
}

// Migration folder name → key table whose presence means the migration's
// effects are already in the database. `null` = never applied to the app DB
// (Prisma starter `User`/`Post` models), so always baseline it to avoid
// creating unused starter tables.
const MIGRATIONS = [
  ["20260808042311_init", null],
  ["20260808070000_app_schema", "users"],
  ["20260809000000_upload_files", "upload_files"],
  ["20260810000000_reviews", "reviews"],
  ["20260812000000_newsletter_subscribers", "newsletter_subscribers"],
];

const host = new URL(url).hostname;
const ssl =
  /sslmode=require|sslmode=verify-full/.test(url) || !["localhost", "127.0.0.1", "::1"].includes(host)
    ? { rejectUnauthorized: false }
    : false;

// Use the shell so `npx` resolves correctly on both Windows (npx.cmd) and CI.
// Args come from the hardcoded MIGRATIONS list, so no injection risk.
function runPrisma(args) {
  execSync(`npx prisma ${args.join(" ")}`, { stdio: "inherit" });
}

// Bootstrap the superadmin + marketing defaults on a fresh database. Runs on
// Vercel-side production builds (where the real sensitive env vars exist) when
// `--seed` is passed; skipped in CI/preview where ADMIN_PASSWORD is a
// `[SENSITIVE]` placeholder.
function runSeed() {
  if (!shouldSeed) return;
  const password = process.env.ADMIN_PASSWORD;
  if (!password || password === "[SENSITIVE]") {
    console.warn("deploy-db: ADMIN_PASSWORD not available in this build context — skipping seed");
    return;
  }
  console.log("deploy-db: seeding admin user and marketing defaults…");
  execSync("npx tsx prisma/seed.ts", { stdio: "inherit" });
}

async function tableExists(client, table) {
  const res = await client.query("SELECT to_regclass($1) AS t", [`public.${table}`]);
  return !!res.rows[0].t;
}

async function main() {
  const client = new pg.Client({ connectionString: url, ssl });
  await client.connect();

  // Does a Prisma migration history already exist (and record any migrations)?
  const history = await client.query("SELECT to_regclass('public._prisma_migrations') AS t");
  let historyCount = 0;
  if (history.rows[0].t) {
    const c = await client.query("SELECT COUNT(*)::int AS c FROM _prisma_migrations");
    historyCount = c.rows[0].c;
  }

  if (history.rows[0].t && historyCount > 0) {
    console.log("deploy-db: Prisma migration history present — running `prisma migrate deploy`.");
    await client.end();
    runPrisma(["migrate", "deploy"]);
    runSeed();
    return;
  }

  console.log("deploy-db: no Prisma migration history — adopting existing database for Prisma.");
  for (const [name, keyTable] of MIGRATIONS) {
    if (keyTable === null || (await tableExists(client, keyTable))) {
      console.log(`deploy-db:   baselining ${name} (${keyTable ? `table "${keyTable}" exists` : "starter models"})`);
      runPrisma(["migrate", "resolve", "--applied", name]);
    } else {
      console.log(`deploy-db:   ${name} missing (no "${keyTable}" table) — will be applied below`);
    }
  }
  await client.end();

  console.log("deploy-db: applying remaining migrations…");
  runPrisma(["migrate", "deploy"]);
  runSeed();
  console.log("deploy-db: database is up to date.");
}

main().catch((err) => {
  console.error("deploy-db failed:", err.message);
  process.exit(1);
});
