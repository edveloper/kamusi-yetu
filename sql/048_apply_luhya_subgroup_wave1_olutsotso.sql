-- 048_apply_luhya_subgroup_wave1_olutsotso.sql
-- Purpose:
-- Apply the validated first Luhya subgroup starter wave for Olutsotso.

begin;

with job as (
  insert into public.bulk_edit_jobs (
    initiated_by,
    job_type,
    status,
    dry_run,
    source_ref,
    summary,
    started_at
  )
  values (
    null,
    'translation_import',
    'running',
    false,
    'entry_import_staging:BATCH_LTO_STARTER_2026_02_26_A',
    jsonb_build_object('batch_label', 'BATCH_LTO_STARTER_2026_02_26_A'),
    now()
  )
  returning id
)
select id as job_id from job;

create temporary table _eligible_import_rows on commit drop as
select
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
join public.languages l
  on lower(l.code) = lower(s.language_code)
where s.batch_label = 'BATCH_LTO_STARTER_2026_02_26_A'
  and s.status = 'validated';

create temporary table _import_job on commit drop as
select id as job_id
from public.bulk_edit_jobs
where job_type = 'translation_import'
  and source_ref = 'entry_import_staging:BATCH_LTO_STARTER_2026_02_26_A'
order by created_at desc
limit 1;

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
cross join _import_job j;

update public.entry_import_staging s
set
  status = 'imported',
  updated_at = now()
from _eligible_import_rows e
where s.id = e.staging_id;

update public.bulk_edit_jobs b
set
  status = 'completed',
  completed_at = now(),
  summary = coalesce(b.summary, '{}'::jsonb) || jsonb_build_object(
    'inserted_rows',
    (select count(*) from _eligible_import_rows)
  )
where b.id = (select job_id from _import_job);

commit;

-- Verification:
-- select source_ref, summary
-- from public.bulk_edit_jobs
-- where source_ref = 'entry_import_staging:BATCH_LTO_STARTER_2026_02_26_A'
-- order by created_at desc
-- limit 1;
