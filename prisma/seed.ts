import "dotenv/config";
import { seedMarketing, seedUsers } from "../src/lib/db";

async function main() {
  await seedUsers();
  console.log("[seed] admin user ready");

  try {
    await seedMarketing();
  } catch (err) {
    console.warn("[seed] marketing seed failed:", (err as Error).message);
  }
}

main()
  .then(() => process.exit(0))
  .catch((err) => {
    console.error("[seed] failed:", (err as Error).message);
    process.exit(1);
  });
