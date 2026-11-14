import { NextResponse } from "next/server";
import { liveCatalog, liveGetBySlug } from "@/lib/catalog";

export const dynamic = "force-dynamic";

const normalCache = { "Cache-Control": "public, s-maxage=30, stale-while-revalidate=60" };
const freshCache = { "Cache-Control": "no-store, max-age=0" };

export async function GET(req: Request) {
  const { searchParams } = new URL(req.url);
  const slug = searchParams.get("slug");
  // Admin-triggered refreshes pass fresh=1 to bypass both the CDN and the
  // per-Lambda admin-product cache. Normal traffic uses the 30s CDN response
  // so Neon compute is not kept awake by every pageview.
  const fresh = searchParams.get("fresh") === "1";
  try {
    if (slug) {
      const product = fresh
        ? (await liveCatalog(true)).find((p) => p.slug === slug || p.sku === slug || p.id === slug)
        : await liveGetBySlug(slug);
      return NextResponse.json(
        { products: product ? [product] : [] },
        { headers: fresh ? freshCache : normalCache }
      );
    }
    const products = await liveCatalog(fresh);
    return NextResponse.json({ products }, { headers: fresh ? freshCache : normalCache });
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
