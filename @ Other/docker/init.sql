CREATE EXTENSION IF NOT EXISTS pg_stat_statements;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS pg_cron;
CREATE EXTENSION IF NOT EXISTS pgaudit;
CREATE EXTENSION IF NOT EXISTS http;

-- Create an event trigger function
CREATE OR REPLACE FUNCTION pgrst_watch() RETURNS event_trigger
  LANGUAGE plpgsql
  AS $$
BEGIN
  NOTIFY pgrst, 'reload schema';
END;
$$;

-- 
CREATE EVENT TRIGGER pgrst_watch
  ON ddl_command_end
  EXECUTE PROCEDURE pgrst_watch();

-- Rolni yaratish (agar yo‘q bo‘lsa)
CREATE ROLE anon NOLOGIN;
GRANT anon TO app;

-- Public schema’ga kirishga ruxsat
GRANT USAGE ON SCHEMA public TO anon;

-- Mavjud barcha jadvallar uchun to‘liq CRUD ruxsatlari
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO anon;

-- Agar sequence ishlatilsa (SERIAL/IDENTITY ustunlari uchun)
GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO anon;

-- Kelajakda yaratiladigan barcha jadvallar uchun default ruxsatlar
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO anon;

-- Kelajakda yaratiladigan sequence’lar uchun default ruxsatlar
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT USAGE, SELECT, UPDATE ON SEQUENCES TO anon;

CREATE ROLE web_anon NOLOGIN;

-- Agar ilgari ruxsat berilgan bo‘lsa, olib tashlaymiz
REVOKE ALL ON SCHEMA public FROM web_anon;
REVOKE ALL ON ALL TABLES IN SCHEMA public FROM web_anon;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA public FROM web_anon;

ALTER DEFAULT PRIVILEGES IN SCHEMA public REVOKE ALL ON TABLES FROM web_anon;