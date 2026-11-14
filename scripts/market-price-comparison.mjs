#!/usr/bin/env node
/**
 * Builds an individual product price comparison against Kenyan competitor
 * catalogues exposed via the public WooCommerce Store API.
 *
 * Usage:
 *   node scripts/market-price-comparison.mjs            # use cache if fresh
 *   node scripts/market-price-comparison.mjs --refresh  # re-fetch competitors
 *
 * Outputs:
 *   data/price-comparison.csv
 *   data/price-comparison.xlsx
 */
import fs from "fs";
import path from "path";
import XLSX from "xlsx";

const ROOT = process.cwd();
const CACHE = path.join(ROOT, "data", "market-cache");
const OUR_URL = "https://www.kimsafety.co.ke/api/catalog";
const REFRESH = process.argv.includes("--refresh");
const MIN_SCORE = 0.8;
const BAD_NAME = /price in kenya|price list|for sale|all products|product category|shop now/i;

const SOURCES = [
  { name: "Safety Hub", base: "https://www.safetyhub.co.ke" },
  { name: "Safeken", base: "https://safeken.co.ke" },
  { name: "Sidget Safety", base: "https://sidgetsafety.co.ke" },
];

const STOP = new Set(
  "the and for with of a an in on to by from price prices kenya nairobi new original quality best heavy duty industrial work working safety protective protection pair pairs piece pieces set sets pack packs size sizes standard approved certified high visibility hi vis pcs pce".split(
    " "
  )
);

const sleep = (ms) => new Promise((r) => setTimeout(r, ms));
const round50 = (n) => Math.max(10, Math.round(n / 50) * 50);

function tokens(name) {
  return String(name || "")
    .toLowerCase()
    .replace(/&/g, " and ")
    .replace(/[^a-z0-9]+/g, " ")
    .split(" ")
    .map((t) => (t.length > 3 && t.endsWith("s") ? t.slice(0, -1) : t))
    .filter((t) => t.length > 1 && !STOP.has(t));
}

function numericTokens(toks) {
  return toks.filter((t) => /^\d+[a-z]*$/.test(t) || /^\d+$/.test(t));
}

function unitOf(name) {
  const m = String(name || "")
    .toLowerCase()
    .match(/(\d+(?:\.\d+)?)\s*(pcs|pieces?|pairs?|boxes?|box|packs?|sets?|dozen|kg|g|litres?|liters?|l|ml|m|cm|mm)\b/);
  return m ? { qty: Number(m[1]), unit: m[2].replace(/s$/, "") } : null;
}

function matchScore(ourName, ourBrand, candidateName) {
  const a = tokens(ourName);
  const b = tokens(candidateName);
  if (a.length < 1 || b.length < 1) return 0;
  const setA = new Set(a);
  const setB = new Set(b);
  const common = [...setA].filter((t) => setB.has(t));
  if (common.length < 2 && !(common.length === 1 && (a.length <= 2 || b.length <= 2))) return 0;
  const containment = common.length / Math.min(setA.size, setB.size);
  const jaccard = common.length / new Set([...setA, ...setB]).size;
  let score = 0.6 * containment + 0.4 * jaccard;
  const brandTokens = tokens(ourBrand).filter((t) => !["kimsafety", "kim", "safety"].includes(t));
  if (brandTokens.some((t) => setB.has(t))) score += 0.05;
  const na = numericTokens(a);
  const nb = numericTokens(b);
  if (na.length && nb.length && na.join("|") !== nb.join("|")) score -= 0.2;
  return Math.max(0, score);
}

async function fetchJson(url) {
  const res = await fetch(url, {
    headers: { "User-Agent": "KimSafetyPriceResearch/1.0 (+https://kimsafety.co.ke)" },
  });
  if (!res.ok) throw new Error(`${url} -> ${res.status}`);
  return { res, json: await res.json() };
}

async function fetchWooSource(source) {
  const cacheFile = path.join(CACHE, `${source.name.replace(/[^a-z0-9]+/gi, "-").toLowerCase()}.json`);
  if (!REFRESH && fs.existsSync(cacheFile)) {
    const age = Date.now() - fs.statSync(cacheFile).mtimeMs;
    if (age < 24 * 3600_000) {
      console.log(`[cache] ${source.name}`);
      return JSON.parse(fs.readFileSync(cacheFile, "utf8"));
    }
  }

  const out = [];
  let page = 1;
  let totalPages = 1;
  do {
    const url = `${source.base}/wp-json/wc/store/v1/products?per_page=100&page=${page}`;
    const { res, json } = await fetchJson(url);
    const total = Number(res.headers.get("x-wp-totalpages") || 1);
    if (Number.isFinite(total) && total > 0) totalPages = total;
    if (!Array.isArray(json) || json.length === 0) break;
    for (const p of json) {
      const minor = Number(p.prices?.currency_minor_unit ?? 2);
      const scale = 10 ** minor;
      let price = Number(p.prices?.price || 0) / scale;
      if (!price && p.prices?.price_range) {
        price = Number(p.prices.price_range.min_amount || 0) / scale;
      }
      if (!price || price <= 0) continue;
      out.push({
        source: source.name,
        name: String(p.name || "").trim(),
        price,
        url: p.permalink || "",
        sku: p.sku || "",
        categories: Array.isArray(p.categories)
          ? p.categories.map((c) => c.name).filter(Boolean).join(", ")
          : "",
      });
    }
    console.log(`[fetch] ${source.name} page ${page}/${totalPages} (${json.length})`);
    page++;
    await sleep(200);
  } while (page <= totalPages);

  fs.writeFileSync(cacheFile, JSON.stringify(out, null, 2));
  return out;
}

async function main() {
  fs.mkdirSync(CACHE, { recursive: true });

  let live;
  const liveCache = path.join(CACHE, "live-catalog.json");
  if (!REFRESH && fs.existsSync(liveCache)) {
    live = JSON.parse(fs.readFileSync(liveCache, "utf8"));
  } else {
    const { json } = await fetchJson(OUR_URL);
    live = json.products || [];
    fs.writeFileSync(liveCache, JSON.stringify(live, null, 2));
  }
  if (!Array.isArray(live) || live.length === 0) throw new Error("Live catalog is empty");

  const competitorLists = [];
  for (const source of SOURCES) competitorLists.push(await fetchWooSource(source));
  const competitors = competitorLists.flat();
  console.log(`[data] ours=${live.length} competitors=${competitors.length}`);

  const rows = [];
  const matchRows = [];
  for (const p of live) {
    const price = Number(p.price) || 0;
    if (price <= 0) continue;
    const ourUnit = unitOf(p.name);
    const candidates = competitors
      .filter((c) => !BAD_NAME.test(c.name))
      .map((c) => {
        const cu = unitOf(c.name);
        const quantityMismatch =
          Boolean(ourUnit) !== Boolean(cu) ||
          (ourUnit && cu && (ourUnit.unit !== cu.unit || ourUnit.qty !== cu.qty));
        return {
          ...c,
          quantityMismatch,
          score: Math.max(0, matchScore(p.name, p.brand, c.name) - (quantityMismatch ? 0.08 : 0)),
        };
      })
      .filter((c) => c.score >= MIN_SCORE)
      .sort((a, b) => b.score - a.score)
      .slice(0, 5);

    if (candidates.length === 0) {
      rows.push({
        sku: p.sku,
        name: p.name,
        brand: p.brand,
        category: p.categoryName,
        current_price: price,
        matches: 0,
        market_low: "",
        market_median: "",
        market_high: "",
        suggested_price: price,
        change_pct: 0,
        confidence: "none",
        best_match: "",
        best_source: "",
        best_url: "",
        note: "No close competitor match",
      });
      continue;
    }

    const prices = candidates.map((c) => c.price).sort((a, b) => a - b);
    const median = prices[Math.floor(prices.length / 2)];
    const isRange = /price range|^from /i.test(p.priceNote || "");
    const target = isRange ? prices[0] : median;
    const rawSuggested = round50(target);
    const ratio = rawSuggested / price;
    const quantityMismatch = candidates.some((c) => c.quantityMismatch);
    const sane = ratio >= 0.5 && ratio <= 2.2;
    const confidence =
      quantityMismatch || !sane
        ? "low"
        : candidates.length >= 2 && candidates[0].score >= 0.85
          ? "high"
          : "medium";
    const suggested = confidence === "low" ? price : rawSuggested;
    const change = price > 0 ? ((suggested - price) / price) * 100 : 0;
    const best = candidates[0];

    for (const c of candidates) {
      matchRows.push({
        our_sku: p.sku,
        our_name: p.name,
        our_price: price,
        competitor: c.source,
        competitor_name: c.name,
        competitor_price: c.price,
        score: Number(c.score.toFixed(3)),
        url: c.url,
      });
    }

    rows.push({
      sku: p.sku,
      name: p.name,
      brand: p.brand,
      category: p.categoryName,
      current_price: price,
      matches: candidates.length,
      market_low: prices[0],
      market_median: median,
      market_high: prices[prices.length - 1],
      suggested_price: suggested,
      change_pct: Number(change.toFixed(1)),
      confidence,
      best_match: best.name,
      best_source: best.source,
      best_url: best.url,
      note: [
        isRange ? "Range/from product — suggested uses market low" : "",
        quantityMismatch ? "Possible pack/quantity mismatch" : "",
        !sane ? `Outlier ratio ${ratio.toFixed(2)}x — review manually` : "",
      ]
        .filter(Boolean)
        .join("; "),
    });
  }

  const matched = rows.filter((r) => r.matches > 0);
  const increases = matched.filter((r) => r.suggested_price > r.current_price);
  const decreases = matched.filter((r) => r.suggested_price < r.current_price);
  const avgIncrease = increases.length
    ? increases.reduce((n, r) => n + r.change_pct, 0) / increases.length
    : 0;

  const csvHeaders = Object.keys(rows[0] || {});
  const csv = [
    csvHeaders.join(","),
    ...rows.map((r) =>
      csvHeaders
        .map((h) => {
          const v = String(r[h] ?? "");
          return /[",\n]/.test(v) ? `"${v.replace(/"/g, '""')}"` : v;
        })
        .join(",")
    ),
  ].join("\n");
  fs.writeFileSync(path.join(ROOT, "data", "price-comparison.csv"), csv);

  const recommended = rows.filter(
    (r) => (r.confidence === "high" || r.confidence === "medium") && r.suggested_price !== r.current_price
  );
  const review = rows.filter(
    (r) => r.matches > 0 && !recommended.includes(r)
  );
  const noMatch = rows.filter((r) => r.matches === 0);

  const wb = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(wb, XLSX.utils.json_to_sheet(recommended), "Recommended");
  XLSX.utils.book_append_sheet(wb, XLSX.utils.json_to_sheet(review), "Review");
  XLSX.utils.book_append_sheet(wb, XLSX.utils.json_to_sheet(noMatch), "No match");
  XLSX.utils.book_append_sheet(wb, XLSX.utils.json_to_sheet(rows), "All");
  XLSX.utils.book_append_sheet(wb, XLSX.utils.json_to_sheet(matchRows), "Matches");
  const summary = [
    { metric: "Our products compared", value: rows.length },
    { metric: "Matched to competitor", value: matched.length },
    { metric: "Recommended (high/medium confidence)", value: recommended.length },
    { metric: "Needs manual review", value: review.length },
    { metric: "No match", value: noMatch.length },
    { metric: "Suggested increases", value: increases.length },
    { metric: "Suggested decreases", value: decreases.length },
    { metric: "Average increase %", value: Number(avgIncrease.toFixed(1)) },
  ];
  XLSX.utils.book_append_sheet(wb, XLSX.utils.json_to_sheet(summary), "Summary");
  XLSX.writeFile(wb, path.join(ROOT, "data", "price-comparison.xlsx"));

  console.log(
    JSON.stringify(
      {
        compared: rows.length,
        matched: matched.length,
        recommended: recommended.length,
        review: review.length,
        unmatched: noMatch.length,
        increases: increases.length,
        decreases: decreases.length,
        avgIncrease: Number(avgIncrease.toFixed(1)),
        csv: "data/price-comparison.csv",
        xlsx: "data/price-comparison.xlsx",
      },
      null,
      2
    )
  );
}

main().catch((err) => {
  console.error("market-price-comparison failed:", err.message);
  process.exit(1);
});
