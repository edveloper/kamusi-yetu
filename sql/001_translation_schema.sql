-- 001_translation_schema.sql
-- Purpose: Add translation graph, quality tracking, and bulk-update safety rails.
-- Safe to run multiple times where possible.

begin;

-- 1) Ensure entries has bridge columns (already used by app, but guarded here)
alter table if exists public.entries
  add column if not exists english_translation text,
  add column if not exists swahili_translation text;

-- 2) Canonical policy check: at least one bridge translation
-- Add as NOT VALID first to avoid breaking old rows immediately.
do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'entries_bridge_translation_required'
  ) then
    alter table public.entries
      add constraint entries_bridge_translation_required
      check (
        nullif(trim(coalesce(english_translation, '')), '') is not null
        or nullif(trim(coalesce(swahili_translation, '')), '') is not null
      ) not valid;
  end if;
end $$;

-- 3) Translation edges table for direct language-to-language mappings
create table if not exists public.entry_translations (
  id uuid primary key default gen_random_uuid(),
  source_entry_id uuid not null references public.entries(id) on delete cascade,
  target_entry_id uuid not null references public.entries(id) on delete cascade,
  source_language_id uuid not null references public.languages(id),
  target_language_id uuid not null references public.languages(id),
  method text not null default 'manual', -- manual|pivot_en|pivot_sw|ml
  confidence numeric(5,4) not null default 0.5000,
  provenance text,
  reviewed_status text not null default 'pending', -- pending|verified|rejected
  reviewed_by uuid,
  reviewed_at timestamptz,
  created_by uuid,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint entry_translations_no_self_edge check (source_entry_id <> target_entry_id),
  constraint entry_translations_confidence_range check (confidence >= 0 and confidence <= 1)
);

create unique index if not exists uq_entry_translations_pair
  on public.entry_translations(source_entry_id, target_entry_id);

create index if not exists idx_entry_translations_source_lang
  on public.entry_translations(source_language_id, reviewed_status, confidence desc);

create index if not exists idx_entry_translations_target_lang
  on public.entry_translations(target_language_id, reviewed_status, confidence desc);

-- 4) Translation feedback loop
create table if not exists public.translation_feedback (
  id uuid primary key default gen_random_uuid(),
  translation_id uuid not null references public.entry_translations(id) on delete cascade,
  user_id uuid,
  verdict text not null, -- correct|partially_correct|incorrect
  note text,
  created_at timestamptz not null default now(),
  constraint translation_feedback_verdict_allowed
    check (verdict in ('correct', 'partially_correct', 'incorrect'))
);

create index if not exists idx_translation_feedback_translation
  on public.translation_feedback(translation_id, created_at desc);

-- 5) Bulk operation tracking + rollback support
create table if not exists public.bulk_edit_jobs (
  id uuid primary key default gen_random_uuid(),
  initiated_by uuid,
  job_type text not null, -- backfill_bridge|normalize_definition|translation_import
  status text not null default 'queued', -- queued|running|completed|failed|rolled_back
  dry_run boolean not null default true,
  source_ref text, -- csv path/import ref/reason
  summary jsonb,
  error_log text,
  created_at timestamptz not null default now(),
  started_at timestamptz,
  completed_at timestamptz,
  constraint bulk_edit_jobs_status_allowed
    check (status in ('queued', 'running', 'completed', 'failed', 'rolled_back'))
);

create table if not exists public.bulk_edit_job_items (
  id uuid primary key default gen_random_uuid(),
  job_id uuid not null references public.bulk_edit_jobs(id) on delete cascade,
  entry_id uuid not null references public.entries(id) on delete cascade,
  old_row jsonb not null,
  new_row jsonb not null,
  applied boolean not null default false,
  applied_at timestamptz,
  error text
);

create index if not exists idx_bulk_edit_job_items_job
  on public.bulk_edit_job_items(job_id, applied);

-- 6) Utility trigger for updated_at on entry_translations
create or replace function public.set_updated_at_now()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists trg_entry_translations_updated_at on public.entry_translations;
create trigger trg_entry_translations_updated_at
before update on public.entry_translations
for each row execute function public.set_updated_at_now();

commit;

-- Post-migration note:
-- Once backfill is done, enforce fully with:
-- alter table public.entries validate constraint entries_bridge_translation_required;
