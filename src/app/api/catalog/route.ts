import { NextResponse } from "next/server";
import { liveCatalog, liveGetBySlug } from "@/lib/catalog";

export const dynamic = "force-dynamic";

export async function GET(req: Request) {
  const { searchParams } = new URL(req.url);
  const slug = searchParams.get("slug");
  try {
    if (slug) {
      const product = await liveGetBySlug(slug);
      return NextResponse.json(
        { products: product ? [product] : [] },
        // Short edge cache + stale-while-revalidate so 20 concurrent product
        // grids don't all hit Postgres at the same ms (was no-store → 53300).
        { headers: { "Cache-Control": "no-store, max-age=0" } }
      );
    }
    const products = await liveCatalog();
    return NextResponse.json(
      { products },
      { headers: { "Cache-Control": "no-store, max-age=0" } }
    );
  } catch (err) {
    console.error("[api/catalog] error:", (err as Error).message);
    // liveCatalog already falls back to static catalog; this is last resort.
    try {
      const { products } = await import("@/lib/data/products");
      return NextResponse.json(
        { products },
        { headers: { "Cache-Control": "no-store, max-age=0" } }
      );
    } catch {
      return NextResponse.json({ products: [] }, { headers: { "Cache-Control": "no-store" } });
    }
  }
}
