-- Custom SQL migration file, put your code below! --
-- pg_search is optional. Some managed Postgres providers, including Neon, no
-- longer allow installing it, so do not block unrelated schema migrations.
DO $$
BEGIN
  CREATE EXTENSION IF NOT EXISTS pg_search;
EXCEPTION
  WHEN insufficient_privilege OR feature_not_supported THEN
    RAISE NOTICE 'Skipping optional pg_search extension: %', SQLERRM;
END $$;
