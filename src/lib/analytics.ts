import { randomUUID } from "crypto";
import { q1, qr, qe } from "@/lib/db";

export type AnalyticsSummary = {
  visitors24h: number;
  views24h: number;
  visitors7d: number;
  views7d: number;
  visitors30d: number;
  views30d: number;
  onlineNow: number;
  searches24h: number;
  searches7d: number;
  searches30d: number;
};

export type AnalyticsPoint = { day: string; visitors: number; views: number; searches: number };
export type AnalyticsRow = { label: string; value: number; detail?: string };

export type AnalyticsData = {
  days: number;
  summary: AnalyticsSummary;
  series: AnalyticsPoint[];
  topPages: { path: string; views: number; visitors: number }[];
  topProducts: { path: string; views: number }[];
  sources: AnalyticsRow[];
  devices: AnalyticsRow[];
  countries: AnalyticsRow[];
  topSearches: { query: string; searches: number; avgResults: number }[];
  zeroResultSearches: { query: string; searches: number }[];
  recentSearches: { query: string; resultsCount: number; createdAt: string }[];
};

const DAY = "(?::int * interval '1 day')";

export async function logAnalyticsVisit(input: {
  visitorId: string;
  sessionId: string;
  path: string;
  referrer?: string | null;
  userAgent?: string | null;
  device?: string | null;
  country?: string | null;
}): Promise<void> {
  await qe(
    `INSERT INTO analytics_visits (id, visitor_id, session_id, path, referrer, user_agent, device, country, created_at)
     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
    randomUUID(),
    input.visitorId,
    input.sessionId,
    input.path,
    input.referrer ?? null,
    input.userAgent ? input.userAgent.slice(0, 400) : null,
    input.device ?? null,
    input.country ?? null,
    new Date().toISOString()
  );
}

export async function logAnalyticsSearch(input: {
  visitorId?: string | null;
  query: string;
  resultsCount: number;
}): Promise<void> {
  await qe(
    "INSERT INTO analytics_searches (id, visitor_id, query, results_count, created_at) VALUES (?, ?, ?, ?, ?)",
    randomUUID(),
    input.visitorId ?? null,
    input.query,
    Math.max(0, Math.floor(input.resultsCount)),
    new Date().toISOString()
  );
}

export async function getAnalytics(days: number): Promise<AnalyticsData> {
  const window = Math.min(Math.max(Math.floor(days), 1), 365);

  const summary = await q1<{
    visitors24h: number;
    views24h: number;
    visitors7d: number;
    views7d: number;
    visitors30d: number;
    views30d: number;
    onlineNow: number;
    searches24h: number;
    searches7d: number;
    searches30d: number;
  }>(
    `SELECT
       (SELECT COUNT(DISTINCT visitor_id)::int FROM analytics_visits WHERE created_at >= now() - interval '24 hours') AS "visitors24h",
       (SELECT COUNT(*)::int FROM analytics_visits WHERE created_at >= now() - interval '24 hours') AS "views24h",
       (SELECT COUNT(DISTINCT visitor_id)::int FROM analytics_visits WHERE created_at >= now() - interval '7 days') AS "visitors7d",
       (SELECT COUNT(*)::int FROM analytics_visits WHERE created_at >= now() - interval '7 days') AS "views7d",
       (SELECT COUNT(DISTINCT visitor_id)::int FROM analytics_visits WHERE created_at >= now() - interval '30 days') AS "visitors30d",
       (SELECT COUNT(*)::int FROM analytics_visits WHERE created_at >= now() - interval '30 days') AS "views30d",
       (SELECT COUNT(DISTINCT visitor_id)::int FROM analytics_visits WHERE created_at >= now() - interval '5 minutes') AS "onlineNow",
       (SELECT COUNT(*)::int FROM analytics_searches WHERE created_at >= now() - interval '24 hours') AS "searches24h",
       (SELECT COUNT(*)::int FROM analytics_searches WHERE created_at >= now() - interval '7 days') AS "searches7d",
       (SELECT COUNT(*)::int FROM analytics_searches WHERE created_at >= now() - interval '30 days') AS "searches30d"`
  );

  const visitSeries = await qr<{ day: string; views: number; visitors: number }>(
    `SELECT to_char(created_at AT TIME ZONE 'Africa/Nairobi', 'YYYY-MM-DD') AS day,
            COUNT(*)::int AS views,
            COUNT(DISTINCT visitor_id)::int AS visitors
     FROM analytics_visits
     WHERE created_at >= now() - ${DAY}
     GROUP BY 1 ORDER BY 1`,
    window
  );

  const searchSeries = await qr<{ day: string; searches: number }>(
    `SELECT to_char(created_at AT TIME ZONE 'Africa/Nairobi', 'YYYY-MM-DD') AS day,
            COUNT(*)::int AS searches
     FROM analytics_searches
     WHERE created_at >= now() - ${DAY}
     GROUP BY 1 ORDER BY 1`,
    window
  );

  const visitByDay = new Map(visitSeries.map((r) => [r.day, r]));
  const searchByDay = new Map(searchSeries.map((r) => [r.day, r.searches]));
  const fmt = new Intl.DateTimeFormat("en-CA", {
    timeZone: "Africa/Nairobi",
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
  });
  const series: AnalyticsPoint[] = [];
  for (let i = window - 1; i >= 0; i--) {
    const day = fmt.format(new Date(Date.now() - i * 86_400_000));
    const v = visitByDay.get(day);
    series.push({ day, visitors: v?.visitors ?? 0, views: v?.views ?? 0, searches: searchByDay.get(day) ?? 0 });
  }

  const [topPages, topProducts, sources, devices, countries, topSearches, zeroResultSearches, recentSearches] =
    await Promise.all([
      qr<{ path: string; views: number; visitors: number }>(
        `SELECT path, COUNT(*)::int AS views, COUNT(DISTINCT visitor_id)::int AS visitors
         FROM analytics_visits
         WHERE created_at >= now() - ${DAY}
         GROUP BY path ORDER BY views DESC LIMIT 15`,
        window
      ),
      qr<{ path: string; views: number }>(
        `SELECT path, COUNT(*)::int AS views
         FROM analytics_visits
         WHERE created_at >= now() - ${DAY} AND path LIKE '/product/%'
         GROUP BY path ORDER BY views DESC LIMIT 10`,
        window
      ),
      qr<{ label: string; value: number }>(
        `SELECT COALESCE(NULLIF(referrer, ''), 'Direct') AS label, COUNT(*)::int AS value
         FROM analytics_visits
         WHERE created_at >= now() - ${DAY}
         GROUP BY label ORDER BY value DESC LIMIT 8`,
        window
      ),
      qr<{ label: string; value: number }>(
        `SELECT COALESCE(NULLIF(device, ''), 'Unknown') AS label, COUNT(*)::int AS value
         FROM analytics_visits
         WHERE created_at >= now() - ${DAY}
         GROUP BY label ORDER BY value DESC LIMIT 6`,
        window
      ),
      qr<{ label: string; value: number }>(
        `SELECT COALESCE(NULLIF(country, ''), 'Unknown') AS label, COUNT(*)::int AS value
         FROM analytics_visits
         WHERE created_at >= now() - ${DAY}
         GROUP BY label ORDER BY value DESC LIMIT 8`,
        window
      ),
      qr<{ query: string; searches: number; avgResults: number }>(
        `SELECT lower(trim(query)) AS query, COUNT(*)::int AS searches, ROUND(AVG(results_count))::int AS "avgResults"
         FROM analytics_searches
         WHERE created_at >= now() - ${DAY}
         GROUP BY lower(trim(query))
         ORDER BY searches DESC LIMIT 15`,
        window
      ),
      qr<{ query: string; searches: number }>(
        `SELECT lower(trim(query)) AS query, COUNT(*)::int AS searches
         FROM analytics_searches
         WHERE created_at >= now() - ${DAY} AND results_count = 0
         GROUP BY lower(trim(query))
         ORDER BY searches DESC LIMIT 12`,
        window
      ),
      qr<{ query: string; resultsCount: number; createdAt: string }>(
        `SELECT query, results_count AS "resultsCount", created_at AS "createdAt"
         FROM analytics_searches
         ORDER BY created_at DESC LIMIT 20`
      ),
    ]);

  return {
    days: window,
    summary: summary ?? {
      visitors24h: 0,
      views24h: 0,
      visitors7d: 0,
      views7d: 0,
      visitors30d: 0,
      views30d: 0,
      onlineNow: 0,
      searches24h: 0,
      searches7d: 0,
      searches30d: 0,
    },
    series,
    topPages,
    topProducts,
    sources: sources.map((r) => ({ label: r.label, value: r.value })),
    devices: devices.map((r) => ({ label: r.label, value: r.value })),
    countries: countries.map((r) => ({ label: r.label, value: r.value })),
    topSearches,
    zeroResultSearches,
    recentSearches,
  };
}
