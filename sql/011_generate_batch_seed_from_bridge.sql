-- 011_generate_batch_seed_from_bridge.sql
-- Purpose:
-- Generate a starter CSV seed for a new language using your verified EN/SW bridge lexicon.
-- Workflow:
-- 1) Replace TARGET_LANGUAGE_CODE and BATCH_LABEL_HERE.
-- 2) Run query in Supabase SQL editor.
-- 3) Export result to CSV.
-- 4) Fill in `headword` and `primary_definition`.
-- 5) Import CSV to public.entry_import_staging.

with params as (
  select
    'BATCH_LABEL_HERE'::text as batch_label,
    'x-sheng'::varchar(10) as target_language_code,
    300::int as max_rows
),
base as (
  select
    e.id,
    e.headword as english_headword,
    e.swahili_translation,
    e.primary_definition,
    e.part_of_speech,
    e.category,
    row_number() over (order by e.headword asc) as row_no
  from public.entries e
  join public.languages l on l.id = e.language_id
  where lower(l.code) = 'en'
    and e.validation_status = 'verified'
    and nullif(trim(coalesce(e.headword, '')), '') is not null
    and nullif(trim(coalesce(e.swahili_translation, '')), '') is not null
)
select
  p.batch_label as batch_label,
  b.row_no as source_row_no,
  p.target_language_code as language_code,
  ''::text as headword,
  ''::text as primary_definition,
  b.english_headword as english_translation,
  b.swahili_translation as swahili_translation,
  b.part_of_speech as part_of_speech,
  null::text as dialect_variant,
  'both'::text as register,
  null::text as pronunciation_ipa,
  null::text as etymology,
  null::text as audio_url,
  b.category as category,
  null::uuid as created_by,
  'PanLex/Wiktionary/Community'::text as source_name,
  'CC0/CC BY-SA/Community'::text as source_license,
  null::text as source_url,
  null::text as source_note
from base b
cross join params p
where b.row_no <= p.max_rows
order by b.row_no;
