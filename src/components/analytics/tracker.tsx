"use client";

import { useEffect, useRef } from "react";
import { usePathname } from "next/navigation";
import { getSessionId, getVisitorId } from "@/lib/analytics-client";

/** Anonymous first-party pageview tracker — no cookies or IP addresses stored. */
export function AnalyticsTracker() {
  const pathname = usePathname();
  const lastPath = useRef("");

  useEffect(() => {
    if (!pathname || pathname.startsWith("/admin")) return;
    const path = `${pathname}${window.location.search || ""}`;
    if (lastPath.current === path) return;
    lastPath.current = path;

    const visitorId = getVisitorId();
    if (!visitorId) return;
    const payload = JSON.stringify({
      path,
      visitorId,
      sessionId: getSessionId(),
      referrer: document.referrer || null,
    });

    try {
      const blob = new Blob([payload], { type: "application/json" });
      if (navigator.sendBeacon && navigator.sendBeacon("/api/analytics/visit", blob)) return;
    } catch {
      /* fall through to fetch */
    }
    fetch("/api/analytics/visit", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: payload,
      keepalive: true,
    }).catch(() => {});
  }, [pathname]);

  return null;
}
