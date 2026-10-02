CREATE TABLE IF NOT EXISTS projects (
  id TEXT PRIMARY KEY,
  created_at TEXT NOT NULL,
  project_type TEXT NOT NULL,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  company TEXT NOT NULL,
  service TEXT NOT NULL,
  budget TEXT NOT NULL,
  timeline TEXT NOT NULL,
  details TEXT NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_projects_created_at ON projects(created_at);
CREATE INDEX IF NOT EXISTS idx_projects_email ON projects(email);

CREATE TABLE IF NOT EXISTS contacts (
  id TEXT PRIMARY KEY,
  created_at TEXT NOT NULL,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  company TEXT,
  service TEXT,
  message TEXT NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_contacts_created_at ON contacts(created_at);
CREATE INDEX IF NOT EXISTS idx_contacts_email ON contacts(email);

CREATE TABLE IF NOT EXISTS subscribers (
  id TEXT PRIMARY KEY,
  created_at TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE
);

CREATE INDEX IF NOT EXISTS idx_subscribers_created_at ON subscribers(created_at);