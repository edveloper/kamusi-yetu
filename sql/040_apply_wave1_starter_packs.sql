-- 040_apply_wave1_starter_packs.sql
-- Purpose:
-- Apply the validated Wave 1 starter packs in one run.
--
-- Covered:
-- - BATCH_PKO_STARTER_2026_02_26_A
-- - BATCH_SXB_STARTER_2026_02_26_A
-- - BATCH_ORC_STARTER_2026_02_26_A

begin;

create temporary table _target_wave1_batches (
  batch_label text primary key
) on commit drop;

insert into _target_wave1_batches (batch_label)
values
  ('BATCH_PKO_STARTER_2026_02_26_A'),
  ('BATCH_SXB_STARTER_2026_02_26_A'),
  ('BATCH_ORC_STARTER_2026_02_26_A');

create temporary table _import_jobs on commit drop as
with inserted as (
  insert into public.bulk_edit_jobs (
    initiated_by,
    job_type,
    status,
    dry_run,
    source_ref,
    summary,
    started_at
  )
  select
    null,
    'translation_import',
    'running',
    false,
    'entry_import_staging:' || tb.batch_label,
    jsonb_build_object('batch_label', tb.batch_label),
    now()
  from _target_wave1_batches tb
  where exists (
    select 1
    from public.entry_import_staging s
    where s.batch_label = tb.batch_label
      and s.status = 'validated'
  )
  returning id, source_ref
)
select
  id as job_id,
  replace(source_ref, 'entry_import_staging:', '') as batch_label
from inserted;

create temporary table _eligible_import_rows on commit drop as
select
  s.batch_label,
  s.id as staging_id,
  gen_random_uuid() as entry_id,
  l.id as language_id,
  trim(s.headword) as headword,
  lower(trim(regexp_replace(s.headword, '\s+', ' ', 'g'))) as normalized_headword,
  trim(s.primary_definition) as primary_definition,
  nullif(trim(coalesce(s.english_translation, '')), '') as english_translation,
  nullif(trim(coalesce(s.swahili_translation, '')), '') as swahili_translation,
  nullif(trim(coalesce(s.part_of_speech, '')), '') as part_of_speech,
  nullif(trim(coalesce(s.dialect_variant, '')), '') as dialect_variant,
  coalesce(nullif(trim(coalesce(s.register, '')), ''), 'both') as register,
  nullif(trim(coalesce(s.pronunciation_ipa, '')), '') as pronunciation_ipa,
  nullif(trim(coalesce(s.etymology, '')), '') as etymology,
  nullif(trim(coalesce(s.audio_url, '')), '') as audio_url,
  nullif(trim(coalesce(s.category, '')), '') as category,
  s.created_by
from public.entry_import_staging s
join _target_wave1_batches tb on tb.batch_label = s.batch_label
join public.languages l
  on lower(l.code) = lower(s.language_code)
where s.status = 'validated';

insert into public.entries (
  id,
  language_id,
  headword,
  normalized_headword,
  primary_definition,
  english_translation,
  swahili_translation,
  part_of_speech,
  dialect_variant,
  register,
  pronunciation_ipa,
  etymology,
  audio_url,
  category,
  validation_status,
  trust_score,
  created_by
)
select
  e.entry_id,
  e.language_id,
  e.headword,
  e.normalized_headword,
  e.primary_definition,
  e.english_translation,
  e.swahili_translation,
  e.part_of_speech,
  e.dialect_variant,
  e.register,
  e.pronunciation_ipa,
  e.etymology,
  e.audio_url,
  e.category,
  'pending',
  0,
  e.created_by
from _eligible_import_rows e;

insert into public.bulk_import_job_items (job_id, staging_id, entry_id, operation)
select
  j.job_id,
  e.staging_id,
  e.entry_id,
  'insert'
from _eligible_import_rows e
join _import_jobs j
  on j.batch_label = e.batch_label;

update public.entry_import_staging s
set
  status = 'imported',
  updated_at = now()
from _eligible_import_rows e
where s.id = e.staging_id;

with batch_counts as (
  select batch_label, count(*) as inserted_rows
  from _eligible_import_rows
  group by batch_label
)
update public.bulk_edit_jobs b
set
  status = 'completed',
  completed_at = now(),
  summary = coalesce(b.summary, '{}'::jsonb) || jsonb_build_object(
    'inserted_rows',
    bc.inserted_rows
  )
from _import_jobs j
join batch_counts bc on bc.batch_label = j.batch_label
where b.id = j.job_id;

commit;

-- Verification:
-- select source_ref, summary
-- from public.bulk_edit_jobs
-- where source_ref in (
--   'entry_import_staging:BATCH_PKO_STARTER_2026_02_26_A',
--   'entry_import_staging:BATCH_SXB_STARTER_2026_02_26_A',
--   'entry_import_staging:BATCH_ORC_STARTER_2026_02_26_A'
-- )
-- order by created_at desc;
