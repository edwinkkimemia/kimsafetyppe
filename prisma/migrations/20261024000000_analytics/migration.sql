-- First-party, anonymous storefront analytics for the superadmin dashboard.
-- No IP addresses are stored; visitor_id is a random browser-scoped UUID.

CREATE TABLE IF NOT EXISTS analytics_visits (
  id TEXT PRIMARY KEY,
  visitor_id TEXT NOT NULL,
  session_id TEXT NOT NULL,
  path TEXT NOT NULL,
  referrer TEXT,
  user_agent TEXT,
  device TEXT,
  country TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS analytics_visits_created_at_idx ON analytics_visits (created_at);
CREATE INDEX IF NOT EXISTS analytics_visits_visitor_idx ON analytics_visits (visitor_id, created_at);
CREATE INDEX IF NOT EXISTS analytics_visits_path_idx ON analytics_visits (path);

CREATE TABLE IF NOT EXISTS analytics_searches (
  id TEXT PRIMARY KEY,
  visitor_id TEXT,
  query TEXT NOT NULL,
  results_count INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS analytics_searches_created_at_idx ON analytics_searches (created_at);
CREATE INDEX IF NOT EXISTS analytics_searches_query_idx ON analytics_searches (query);
