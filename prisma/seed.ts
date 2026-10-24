import "dotenv/config";
import imported from "./imported-products.json";
import { getSetting, qr, qe, seedMarketing, seedUsers } from "../src/lib/db";

/**
 * Imports the supplier catalogue (KIMSAFETY_products.xlsx → imported-products.json)
 * as custom admin_products rows. Insert-only: existing rows are never touched so
 * admin edits survive future deploys, and deleted SKUs stay deleted.
 */
async function seedImportedProducts() {
  const deletedRaw = await getSetting("deleted_product_skus").catch(() => "");
  let deleted = new Set<string>();
  try {
    const arr = JSON.parse(deletedRaw);
    if (Array.isArray(arr)) deleted = new Set(arr.filter((v): v is string => typeof v === "string"));
  } catch {
    /* no deleted list */
  }

  const existingRows = await qr<{ sku: string }>("SELECT sku FROM admin_products");
  const existing = new Set(existingRows.map((r) => r.sku));

  let inserted = 0;
  let skipped = 0;
  let failed = 0;
  for (const product of imported.products) {
    if (deleted.has(product.sku) || existing.has(product.sku)) {
      skipped++;
      continue;
    }
    try {
      await qe(
        "INSERT INTO admin_products (sku, data, updated_at) VALUES (?, ?, ?) ON CONFLICT (sku) DO NOTHING",
        product.sku,
        JSON.stringify({ ...product, static: false }),
        new Date().toISOString()
      );
      inserted++;
    } catch (err) {
      failed++;
      console.warn(`[seed] import failed for ${product.sku}:`, (err as Error).message);
    }
  }
  console.log(
    `[seed] imported products: ${inserted} inserted, ${skipped} already present/deleted, ${failed} failed (${imported.products.length} total)`
  );
}

async function main() {
  await seedUsers();
  console.log("[seed] admin user ready");

  try {
    await seedMarketing();
  } catch (err) {
    console.warn("[seed] marketing seed failed:", (err as Error).message);
  }

  try {
    await seedImportedProducts();
  } catch (err) {
    console.warn("[seed] product import failed:", (err as Error).message);
  }
}

main()
  .then(() => process.exit(0))
  .catch((err) => {
    console.error("[seed] failed:", (err as Error).message);
    process.exit(1);
  });
