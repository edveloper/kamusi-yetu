-- 006_import_staging_schema.sql
-- Purpose:
-- 1) Create staging + tracking tables for safe bulk lexicon imports.
-- 2) Enable dry-run validation before touching public.entries.
-- 3) Provide rollback traceability by job id.

begin;

create table if not exists public.entry_import_staging (
  id uuid primary key default gen_random_uuid(),
  batch_label text not null,
  source_row_no integer,
  language_code varchar(10) not null,
  headword text,
  primary_definition text,
  english_translation text,
  swahili_translation text,
  part_of_speech text,
  dialect_variant text,
  register text,
  pronunciation_ipa text,
  etymology text,
  audio_url text,
  category text,
  created_by uuid,
  status text not null default 'staged', -- staged|validated|rejected|imported
  validation_errors text[] not null default '{}',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint entry_import_staging_status_allowed
    check (status in ('staged', 'validated', 'rejected', 'imported'))
);

create index if not exists idx_entry_import_staging_batch
  on public.entry_import_staging(batch_label, status);

create table if not exists public.bulk_import_job_items (
  id uuid primary key default gen_random_uuid(),
  job_id uuid not null references public.bulk_edit_jobs(id) on delete cascade,
  staging_id uuid not null references public.entry_import_staging(id) on delete cascade,
  entry_id uuid not null references public.entries(id) on delete cascade,
  operation text not null default 'insert', -- currently insert-only
  created_at timestamptz not null default now(),
  constraint bulk_import_job_items_operation_allowed
    check (operation in ('insert'))
);

create index if not exists idx_bulk_import_job_items_job
  on public.bulk_import_job_items(job_id, operation);

commit;
