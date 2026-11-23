-- VGZ Sea Battle SQLite3 schema.
-- The server creates this automatically at first request; kept here for
-- manual deployments and backups.

CREATE TABLE IF NOT EXISTS users (
  id            INTEGER PRIMARY KEY AUTOINCREMENT,
  login         TEXT    NOT NULL UNIQUE COLLATE NOCASE,
  uid           TEXT    NOT NULL UNIQUE,
  data1         TEXT    NOT NULL DEFAULT '',
  password_hash TEXT,                       -- password_hash(), never plain text
  score         INTEGER NOT NULL DEFAULT 0,
  created_at    TEXT    NOT NULL DEFAULT (datetime('now')),
  updated_at    TEXT    NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS score_log (
  id         INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id    INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  score      INTEGER NOT NULL,
  created_at TEXT    NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_users_score ON users(score DESC);
