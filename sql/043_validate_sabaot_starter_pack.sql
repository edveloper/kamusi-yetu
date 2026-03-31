-- 043_validate_sabaot_starter_pack.sql
-- Purpose:
-- Validate the Sabaot starter pack batch.

begin;

with params as (
  select 'BATCH_SPY_STARTER_2026_02_26_A'::text as batch_label
),
base as (
  select
    s.id,
    s.batch_label,
    s.language_code,
    s.headword,
    s.primary_definition,
    s.english_translation,
    s.swahili_translation,
    l.id as language_id,
    lower(coalesce(l.code, '')) as resolved_code,
    lower(trim(regexp_replace(coalesce(s.headword, ''), '\s+', ' ', 'g'))) as normalized_headword
  from public.entry_import_staging s
  left join public.languages l
    on lower(l.code) = lower(s.language_code)
  where s.batch_label = (select batch_label from params)
),
dupes_in_batch as (
  select
    b.id,
    count(*) over (
      partition by lower(b.language_code), b.normalized_headword
    ) as dup_count
  from base b
),
dupes_existing as (
  select
    b.id,
    exists (
      select 1
      from public.entries e
      where e.language_id = b.language_id
        and e.normalized_headword = b.normalized_headword
    ) as exists_in_entries
  from base b
),
evaluated as (
  select
    b.id,
    array_remove(array[
      case when b.language_id is null then 'UNKNOWN_LANGUAGE_CODE' end,
      case when nullif(trim(coalesce(b.headword, '')), '') is null then 'MISSING_HEADWORD' end,
      case when nullif(trim(coalesce(b.primary_definition, '')), '') is null then 'MISSING_DEFINITION' end,
      case
        when b.resolved_code = 'en'
          and nullif(trim(coalesce(b.swahili_translation, '')), '') is null
        then 'EN_REQUIRES_SWAHILI_TRANSLATION'
      end,
      case
        when b.resolved_code = 'sw'
          and nullif(trim(coalesce(b.english_translation, '')), '') is null
        then 'SW_REQUIRES_ENGLISH_TRANSLATION'
      end,
      case
        when b.resolved_code not in ('en', 'sw')
          and nullif(trim(coalesce(b.english_translation, '')), '') is null
          and nullif(trim(coalesce(b.swahili_translation, '')), '') is null
        then 'MISSING_BRIDGE_TRANSLATION'
      end,
      case when db.dup_count > 1 then 'DUPLICATE_IN_BATCH' end,
      case when de.exists_in_entries then 'DUPLICATE_IN_ENTRIES' end
    ], null) as errors
  from base b
  join dupes_in_batch db on db.id = b.id
  join dupes_existing de on de.id = b.id
)
update public.entry_import_staging s
set
  validation_errors = e.errors,
  status = case when coalesce(array_length(e.errors, 1), 0) = 0 then 'validated' else 'rejected' end,
  updated_at = now()
from evaluated e
where s.id = e.id;

commit;

-- Verification summary:
-- select
--   status,
--   count(*) as rows
-- from public.entry_import_staging
-- where batch_label = 'BATCH_SPY_STARTER_2026_02_26_A'
-- group by status
-- order by status;
