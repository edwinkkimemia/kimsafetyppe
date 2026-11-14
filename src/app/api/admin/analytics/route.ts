import { NextResponse } from "next/server";
import { requireSuperAdmin } from "@/lib/api-helpers";
import { getAnalytics } from "@/lib/analytics";

export const dynamic = "force-dynamic";

export async function GET(req: Request) {
  const denied = await requireSuperAdmin();
  if (denied) return denied;
  const raw = Number(new URL(req.url).searchParams.get("days"));
  const days = raw === 7 || raw === 90 ? raw : 30;
  try {
    return NextResponse.json({ analytics: await getAnalytics(days) }, { headers: { "Cache-Control": "no-store" } });
  } catch (err) {
    console.error("[admin/analytics]", (err as Error).message);
    return NextResponse.json(
      { error: "Analytics is unavailable. Run the deploy to apply the analytics migration." },
      { status: 500 }
    );
  }
}
