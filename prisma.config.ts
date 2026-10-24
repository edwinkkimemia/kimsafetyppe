import "dotenv/config";
import { defineConfig } from "prisma/config";

// Migrations must use the direct (unpooled) Postgres host. Neon's Vercel
// integration exposes it as DATABASE_URL_UNPOOLED; DIRECT_URL is the Prisma
// convention used elsewhere in this repo.
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
  return /neon\.tech/i.test(pooled) ? pooled.replace(/-pooler(?=\.)/, "") : pooled;
}

export default defineConfig({
  schema: "prisma/schema.prisma",
  migrations: {
    path: "prisma/migrations",
    seed: "tsx prisma/seed.ts",
  },
  datasource: {
    url: resolveMigrationUrl(),
  },
});
