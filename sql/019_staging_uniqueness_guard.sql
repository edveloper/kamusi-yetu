-- 019_staging_uniqueness_guard.sql
-- Purpose:
-- Prevent accidental duplicate seed rows in entry_import_staging when scripts are re-run.
--
-- Enforces uniqueness on:
-- (batch_label, language_code, source_row_no)

begin;

-- Safety pre-check (optional manual run first):
-- If this returns rows, clean them before creating the index.
-- select batch_label, language_code, source_row_no, count(*) as dupes
-- from public.entry_import_staging
-- group by batch_label, language_code, source_row_no
-- having count(*) > 1;

create unique index if not exists ux_entry_import_staging_batch_lang_row
  on public.entry_import_staging (batch_label, language_code, source_row_no);

commit;
