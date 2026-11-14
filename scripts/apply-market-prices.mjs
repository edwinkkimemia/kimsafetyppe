#!/usr/bin/env node
/**
 * Applies the "Recommended" sheet from data/price-comparison.xlsx:
 *  - updates static product prices in src/lib/data/products.ts
 *  - updates imported catalogue prices/bulk tiers in prisma/imported-products.json
 *  - writes a one-time Prisma migration for existing admin_products rows
 *
 * Products in the Review / No match sheets are left untouched.
 */
import fs from "fs";
import path from "path";
import XLSX from "xlsx";

const ROOT = process.cwd();
const wb = XLSX.readFile(path.join(ROOT, "data", "price-comparison.xlsx"));
const rows = XLSX.utils.sheet_to_json(wb.Sheets["Recommended"]).filter(
  (r) => Number.isFinite(Number(r.suggested_price)) && Number(r.suggested_price) > 0
);

const round = (n) => Math.max(1, Math.round(Number(n)));
const bulkFor = (price) => {
  const rates = [0, 0.05, 0.09, 0.13];
  return ["1 – 9", "10 – 49", "50 – 199", "200+"].map((qty, i) => ({
    qty,
    price: String(Math.round(price * (1 - rates[i])).toLocaleString("en-KE")),
    savings: i === 0 ? "Standard" : `${Math.round(rates[i] * 100)}% off`,
  }));
};

// ---- 1. static products ----
const productsFile = path.join(ROOT, "src", "lib", "data", "products.ts");
let productsSrc = fs.readFileSync(productsFile, "utf8");
let staticUpdated = 0;
const staticRows = rows.filter((r) => !String(r.sku).startsWith("KS-IMP-"));
for (const r of staticRows) {
  const sku = String(r.sku);
  const at = productsSrc.indexOf(`sku: "${sku}"`);
  if (at < 0) {
    console.warn(`[static] SKU not found: ${sku}`);
    continue;
  }
  const tail = productsSrc.slice(at);
  const m = tail.match(/price:\s*(\d+)/);
  if (!m || m.index == null) {
    console.warn(`[static] price field not found: ${sku}`);
    continue;
  }
  const absolute = at + m.index;
  productsSrc =
    productsSrc.slice(0, absolute) +
    `price: ${round(r.suggested_price)}` +
    productsSrc.slice(absolute + m[0].length);
  staticUpdated++;
}
fs.writeFileSync(productsFile, productsSrc);
console.log(`[static] updated ${staticUpdated} prices`);

// ---- 2. imported catalogue JSON ----
const importedFile = path.join(ROOT, "prisma", "imported-products.json");
const imported = JSON.parse(fs.readFileSync(importedFile, "utf8"));
const importedBySku = new Map(imported.products.map((p) => [p.sku, p]));
let importedUpdated = 0;
const audit = [];
for (const r of rows) {
  const price = round(r.suggested_price);
  audit.push({
    sku: r.sku,
    name: r.name,
    old_price: Number(r.current_price),
    new_price: price,
    change_pct: Number(r.change_pct),
    confidence: r.confidence,
    source: r.best_source,
    best_match: r.best_match,
  });
  const p = importedBySku.get(String(r.sku));
  if (!p) continue;
  p.price = price;
  p.bulk = bulkFor(price);
  importedUpdated++;
}
fs.writeFileSync(importedFile, JSON.stringify(imported, null, 2) + "\n");
fs.writeFileSync(path.join(ROOT, "data", "price-updates.json"), JSON.stringify(audit, null, 2));
console.log(`[imported] updated ${importedUpdated} catalogue prices + bulk tiers`);

// ---- 3. one-time SQL migration for existing admin_products rows ----
const iso = "to_char(now() at time zone 'utc', 'YYYY-MM-DD\"T\"HH24:MI:SS.MS\"Z\"')";
const statements = rows.map((r) => {
  const price = round(r.suggested_price);
  const bulk = JSON.stringify(bulkFor(price));
  return `UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(${price}), true),
  '{bulk}', $bulk$${bulk}$bulk$::jsonb, true
)::text,
updated_at = ${iso}
WHERE sku = '${String(r.sku).replace(/'/g, "''")}';`;
});

const migrationDir = path.join(ROOT, "prisma", "migrations", "20261110000000_market_price_update");
fs.mkdirSync(migrationDir, { recursive: true });
fs.writeFileSync(
  path.join(migrationDir, "migration.sql"),
  `-- Individual market-price corrections (Recommended sheet).\n-- One-time: safe to apply once; future admin edits are untouched.\n\n${statements.join(
    "\n\n"
  )}\n`
);

console.log(
  JSON.stringify(
    {
      recommended: rows.length,
      staticUpdated,
      importedUpdated,
      migration: "prisma/migrations/20261110000000_market_price_update/migration.sql",
      audit: "data/price-updates.json",
    },
    null,
    2
  )
);
