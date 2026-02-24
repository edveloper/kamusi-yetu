-- 009_import_rollback_job.sql
-- Purpose:
-- Roll back one import job produced by 008_import_apply_batch.sql.
--
-- IMPORTANT:
-- Replace JOB_ID_HERE with the actual job id you want to roll back.

begin;

with target as (
  select 'JOB_ID_HERE'::uuid as job_id
),
affected as (
  select
    bi.staging_id,
    bi.entry_id
  from public.bulk_import_job_items bi
  where bi.job_id = (select job_id from target)
    and bi.operation = 'insert'
)
delete from public.entries e
using affected a
where e.id = a.entry_id;

-- Put staging rows back to validated for correction/reimport.
with target as (
  select 'JOB_ID_HERE'::uuid as job_id
)
update public.entry_import_staging s
set status = 'validated',
    updated_at = now()
where s.id in (
  select bi.staging_id
  from public.bulk_import_job_items bi
  where bi.job_id = (select job_id from target)
);

update public.bulk_edit_jobs
set
  status = 'rolled_back',
  completed_at = now(),
  summary = coalesce(summary, '{}'::jsonb) || jsonb_build_object('rolled_back', true)
where id = 'JOB_ID_HERE'::uuid;

commit;
