import { NextResponse } from "next/server";
import { logAnalyticsSearch } from "@/lib/analytics";
import { rateLimit } from "@/lib/rate-limit";

export const dynamic = "force-dynamic";

export async function POST(req: Request) {
  try {
    if (!rateLimit(req, "analytics-search", 90, 60_000).ok) {
      return new NextResponse(null, { status: 204 });
    }
    const body = (await req.json().catch(() => ({}))) as {
      query?: string;
      resultsCount?: number;
      visitorId?: string;
    };
    const query = typeof body.query === "string" ? body.query.trim().slice(0, 120) : "";
    if (!query) return new NextResponse(null, { status: 204 });
    const resultsCount = Number.isFinite(Number(body.resultsCount))
      ? Math.max(0, Math.floor(Number(body.resultsCount)))
      : 0;
    const visitorId = typeof body.visitorId === "string" ? body.visitorId.slice(0, 80) : null;
    await logAnalyticsSearch({ query, resultsCount, visitorId });
  } catch (err) {
    console.error("[analytics/search]", (err as Error).message);
  }
  return new NextResponse(null, { status: 204 });
}
