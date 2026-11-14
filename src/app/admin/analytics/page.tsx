"use client";

import { useState } from "react";
import Link from "next/link";
import { Activity, Eye, Search, Users } from "lucide-react";
import { AdminCard, useFetch } from "@/components/admin/ui";
import type { AnalyticsData } from "@/lib/analytics";

const fmt = (n: number) => n.toLocaleString("en-KE");
const dayLabel = (day: string) =>
  new Date(`${day}T00:00:00`).toLocaleDateString("en-KE", { month: "short", day: "numeric" });

function StatCard({
  icon: Icon,
  label,
  value,
  sub,
  tone,
}: {
  icon: typeof Users;
  label: string;
  value: string;
  sub: string;
  tone: string;
}) {
  return (
    <div className="rounded-2xl border border-line bg-white p-5 shadow-card">
      <Icon className={`mb-3 h-5 w-5 ${tone}`} />
      <p className="text-[11px] font-bold uppercase tracking-wider text-gray-400">{label}</p>
      <p className="font-display text-2xl font-extrabold text-navy-900">{value}</p>
      <p className="mt-1 text-[11px] text-gray-400">{sub}</p>
    </div>
  );
}

function BarList({
  rows,
  empty,
}: {
  rows: { label: string; value: number; detail?: string }[];
  empty: string;
}) {
  const total = rows.reduce((n, r) => n + r.value, 0);
  if (rows.length === 0) return <p className="py-6 text-center text-xs text-gray-400">{empty}</p>;
  return (
    <ul className="space-y-3">
      {rows.map((r) => (
        <li key={r.label}>
          <div className="flex items-baseline justify-between gap-3 text-xs">
            <span className="min-w-0 truncate font-semibold text-navy-900">{r.label}</span>
            <span className="shrink-0 text-gray-500">
              {fmt(r.value)}
              {total > 0 ? ` · ${Math.round((r.value / total) * 100)}%` : ""}
            </span>
          </div>
          <div className="mt-1 h-1.5 overflow-hidden rounded-full bg-surface">
            <div
              className="h-full rounded-full bg-safety-500"
              style={{ width: `${total > 0 ? Math.max(2, (r.value / total) * 100) : 0}%` }}
            />
          </div>
        </li>
      ))}
    </ul>
  );
}

export default function AdminAnalyticsPage() {
  const [days, setDays] = useState(30);
  const { data, loading, error } = useFetch<{ analytics: AnalyticsData; error?: string }>(
    `/api/admin/analytics?days=${days}`
  );
  const a = data?.analytics;

  return (
    <div className="space-y-6">
      <div className="flex flex-wrap items-end justify-between gap-4">
        <div>
          <h1 className="font-display text-2xl font-extrabold text-navy-900">Analytics</h1>
          <p className="text-sm text-gray-500">
            Anonymous first-party traffic and search insights — no cookies or IP addresses stored.
          </p>
        </div>
        <div className="flex items-center gap-1 rounded-xl border border-line bg-white p-1">
          {[7, 30, 90].map((d) => (
            <button
              key={d}
              onClick={() => setDays(d)}
              className={`rounded-lg px-3 py-1.5 text-xs font-bold transition-colors ${
                days === d ? "bg-navy-900 text-white" : "text-gray-500 hover:text-navy-900"
              }`}
            >
              {d}d
            </button>
          ))}
        </div>
      </div>

      {loading ? (
        <p className="py-20 text-center text-sm text-gray-400">Loading analytics…</p>
      ) : error || !a ? (
        <AdminCard title="Analytics unavailable">
          <p className="py-6 text-center text-sm text-gray-500">
            {error ?? data?.error ?? "Could not load analytics."}
          </p>
        </AdminCard>
      ) : (
        <>
          <div className="grid grid-cols-2 gap-3 lg:grid-cols-4">
            <StatCard
              icon={Users}
              label="Visitors · 24h"
              value={fmt(a.summary.visitors24h)}
              sub={`${fmt(a.summary.visitors7d)} in 7 days · ${fmt(a.summary.visitors30d)} in 30 days`}
              tone="text-navy-800"
            />
            <StatCard
              icon={Eye}
              label="Pageviews · 24h"
              value={fmt(a.summary.views24h)}
              sub={`${fmt(a.summary.views7d)} in 7 days · ${fmt(a.summary.views30d)} in 30 days`}
              tone="text-safety-500"
            />
            <StatCard
              icon={Activity}
              label="Online now"
              value={fmt(a.summary.onlineNow)}
              sub="Unique visitors in the last 5 minutes"
              tone="text-emerald-600"
            />
            <StatCard
              icon={Search}
              label="Searches · 24h"
              value={fmt(a.summary.searches24h)}
              sub={`${fmt(a.summary.searches7d)} in 7 days · ${fmt(a.summary.searches30d)} in 30 days`}
              tone="text-amber-600"
            />
          </div>

          <AdminCard title={`Traffic — last ${days} days`} subtitle="Pageviews per day (hover a bar for unique visitors)">
            <TrafficBars series={a.series} />
          </AdminCard>

          <div className="grid grid-cols-1 gap-6 lg:grid-cols-2">
            <AdminCard title="Top pages" subtitle={`Most viewed paths · last ${days} days`}>
              {a.topPages.length === 0 ? (
                <p className="py-6 text-center text-xs text-gray-400">No pageviews recorded yet.</p>
              ) : (
                <div className="overflow-x-auto">
                  <table className="w-full text-sm">
                    <thead>
                      <tr className="border-b border-line text-left text-[10px] font-bold uppercase tracking-wider text-gray-400">
                        <th className="pb-2">Path</th>
                        <th className="pb-2 text-right">Views</th>
                        <th className="pb-2 text-right">Visitors</th>
                      </tr>
                    </thead>
                    <tbody>
                      {a.topPages.map((p) => (
                        <tr key={p.path} className="border-b border-line/60 last:border-0">
                          <td className="max-w-[220px] truncate py-2">
                            <Link href={p.path} className="font-semibold text-navy-900 hover:text-safety-600">
                              {p.path}
                            </Link>
                          </td>
                          <td className="py-2 text-right font-bold text-navy-900">{fmt(p.views)}</td>
                          <td className="py-2 text-right text-gray-500">{fmt(p.visitors)}</td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              )}
            </AdminCard>

            <AdminCard title="Top product pages" subtitle={`Most viewed products · last ${days} days`}>
              {a.topProducts.length === 0 ? (
                <p className="py-6 text-center text-xs text-gray-400">No product views recorded yet.</p>
              ) : (
                <ul className="divide-y divide-line">
                  {a.topProducts.map((p) => (
                    <li key={p.path} className="flex items-center justify-between gap-3 py-2.5 text-sm">
                      <Link href={p.path} className="min-w-0 truncate font-semibold text-navy-900 hover:text-safety-600">
                        {decodeURIComponent(p.path.replace(/^\/product\//, ""))}
                      </Link>
                      <span className="shrink-0 text-xs font-bold text-gray-500">{fmt(p.views)} views</span>
                    </li>
                  ))}
                </ul>
              )}
            </AdminCard>

            <AdminCard title="Traffic sources" subtitle="Referrer hostname — direct/internal traffic is excluded">
              <BarList rows={a.sources} empty="No external referrers yet." />
            </AdminCard>
            <AdminCard title="Devices" subtitle="Detected from the browser user agent">
              <BarList rows={a.devices} empty="No device data yet." />
            </AdminCard>
          </div>

          <div className="grid grid-cols-1 gap-6 lg:grid-cols-2">
            <AdminCard title="Top searches" subtitle={`Most requested terms · last ${days} days`}>
              {a.topSearches.length === 0 ? (
                <p className="py-6 text-center text-xs text-gray-400">No searches recorded yet.</p>
              ) : (
                <div className="overflow-x-auto">
                  <table className="w-full text-sm">
                    <thead>
                      <tr className="border-b border-line text-left text-[10px] font-bold uppercase tracking-wider text-gray-400">
                        <th className="pb-2">Search term</th>
                        <th className="pb-2 text-right">Searches</th>
                        <th className="pb-2 text-right">Avg results</th>
                      </tr>
                    </thead>
                    <tbody>
                      {a.topSearches.map((s) => (
                        <tr key={s.query} className="border-b border-line/60 last:border-0">
                          <td className="py-2 font-semibold text-navy-900">{s.query}</td>
                          <td className="py-2 text-right font-bold text-navy-900">{fmt(s.searches)}</td>
                          <td className="py-2 text-right text-gray-500">{fmt(s.avgResults)}</td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              )}
            </AdminCard>

            <AdminCard title="Searches with no results" subtitle="Terms to add products or synonyms for">
              {a.zeroResultSearches.length === 0 ? (
                <p className="py-6 text-center text-xs text-gray-400">
                  No zero-result searches — every term matched something.
                </p>
              ) : (
                <ul className="divide-y divide-line">
                  {a.zeroResultSearches.map((s) => (
                    <li key={s.query} className="flex items-center justify-between gap-3 py-2.5 text-sm">
                      <span className="min-w-0 truncate font-semibold text-navy-900">{s.query}</span>
                      <span className="shrink-0 text-xs font-bold text-danger">{fmt(s.searches)} searches</span>
                    </li>
                  ))}
                </ul>
              )}
            </AdminCard>
          </div>

          <AdminCard title="Countries" subtitle="Derived from Vercel edge geolocation">
            <BarList rows={a.countries} empty="No country data yet." />
          </AdminCard>

          <AdminCard title="Recent searches" subtitle="Newest first">
            {a.recentSearches.length === 0 ? (
              <p className="py-6 text-center text-xs text-gray-400">No searches recorded yet.</p>
            ) : (
              <ul className="divide-y divide-line">
                {a.recentSearches.map((s, i) => (
                  <li
                    key={`${s.createdAt}-${i}`}
                    className="flex flex-wrap items-center justify-between gap-2 py-2.5 text-sm"
                  >
                    <span className="font-semibold text-navy-900">{s.query}</span>
                    <span className="text-xs text-gray-400">
                      {s.resultsCount === 0 ? "No results" : `${fmt(s.resultsCount)} results`} ·{" "}
                      {new Date(s.createdAt).toLocaleString("en-KE", {
                        day: "numeric",
                        month: "short",
                        hour: "2-digit",
                        minute: "2-digit",
                      })}
                    </span>
                  </li>
                ))}
              </ul>
            )}
          </AdminCard>
        </>
      )}
    </div>
  );
}

function TrafficBars({ series }: { series: AnalyticsData["series"] }) {
  const max = Math.max(1, ...series.map((p) => p.views));
  if (series.length === 0) return <p className="py-10 text-center text-xs text-gray-400">No traffic yet.</p>;
  return (
    <div>
      <div className="flex h-44 items-end gap-1">
        {series.map((p) => (
          <div key={p.day} className="group relative flex h-full flex-1 items-end">
            <div
              className="w-full rounded-t bg-safety-500/80 transition-colors group-hover:bg-safety-500"
              style={{ height: `${Math.max(2, (p.views / max) * 100)}%` }}
              title={`${p.day}: ${fmt(p.views)} views · ${fmt(p.visitors)} visitors`}
            />
          </div>
        ))}
      </div>
      <div className="mt-2 flex justify-between text-[10px] text-gray-400">
        <span>{dayLabel(series[0].day)}</span>
        <span>{dayLabel(series[Math.floor(series.length / 2)].day)}</span>
        <span>{dayLabel(series[series.length - 1].day)}</span>
      </div>
    </div>
  );
}
