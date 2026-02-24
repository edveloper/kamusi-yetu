-- 010_import_source_tracking.sql
-- Purpose:
-- Add source/license tracking fields to staging imports for legal attribution.

begin;

alter table if exists public.entry_import_staging
  add column if not exists source_name text,
  add column if not exists source_license text,
  add column if not exists source_url text,
  add column if not exists source_note text;

commit;
