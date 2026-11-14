import { NextResponse } from "next/server";
import { logAnalyticsVisit } from "@/lib/analytics";
import { rateLimit } from "@/lib/rate-limit";

export const dynamic = "force-dynamic";

const BOT_RE = /bot|crawl|spider|slurp|bingpreview|facebookexternalhit|headless|lighthouse/i;

function deviceFor(ua: string): "mobile" | "tablet" | "desktop" {
  if (/ipad|tablet|playbook|silk/i.test(ua)) return "tablet";
  if (/mobile|iphone|ipod|android/i.test(ua)) return "mobile";
  return "desktop";
}

export async function POST(req: Request) {
  try {
    if (!rateLimit(req, "analytics-visit", 120, 60_000).ok) {
      return new NextResponse(null, { status: 204 });
    }
    const ua = req.headers.get("user-agent") || "";
    if (BOT_RE.test(ua)) return new NextResponse(null, { status: 204 });

    let body: { path?: string; visitorId?: string; sessionId?: string; referrer?: string | null };
    try {
      body = await req.json();
    } catch {
      return new NextResponse(null, { status: 204 });
    }

    // Store the pathname only — query strings are logged separately as searches.
    let path = "";
    try {
      path = new URL(String(body.path || ""), "https://kimsafety.local").pathname.slice(0, 240);
    } catch {
      return new NextResponse(null, { status: 204 });
    }
    if (!path.startsWith("/") || /^\/(admin|api|_next|images|uploads)/.test(path)) {
      return new NextResponse(null, { status: 204 });
    }

    const visitorId =
      typeof body.visitorId === "string" && /^[A-Za-z0-9-]{8,80}$/.test(body.visitorId) ? body.visitorId : null;
    if (!visitorId) return new NextResponse(null, { status: 204 });
    const sessionId =
      typeof body.sessionId === "string" && body.sessionId.length <= 80 ? body.sessionId : visitorId;

    let referrer: string | null = null;
    if (typeof body.referrer === "string" && body.referrer) {
      try {
        const host = new URL(body.referrer).hostname.replace(/^www\./, "").toLowerCase();
        const ownHost = (req.headers.get("host") || "").replace(/^www\./, "").split(":")[0].toLowerCase();
        if (host && host !== ownHost && !host.endsWith(".kimsafety.co.ke")) {
          referrer = host.slice(0, 120);
        }
      } catch {
        /* ignore malformed referrer */
      }
    }

    const country = req.headers.get("x-vercel-ip-country") || null;
    await logAnalyticsVisit({
      visitorId,
      sessionId,
      path,
      referrer,
      userAgent: ua,
      device: deviceFor(ua),
      country,
    });
  } catch (err) {
    console.error("[analytics/visit]", (err as Error).message);
  }
  return new NextResponse(null, { status: 204 });
}
