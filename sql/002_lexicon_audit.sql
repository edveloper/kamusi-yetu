-- 002_lexicon_audit.sql
-- Purpose: Identify rows needing bridge translations and prepare bulk backfill.

-- A) Coverage overview
select
  count(*) as total_entries,
  count(*) filter (
    where nullif(trim(coalesce(english_translation, '')), '') is not null
       or nullif(trim(coalesce(swahili_translation, '')), '') is not null
  ) as with_bridge_translation,
  count(*) filter (
    where nullif(trim(coalesce(english_translation, '')), '') is null
      and nullif(trim(coalesce(swahili_translation, '')), '') is null
  ) as missing_bridge_translation
from public.entries;

-- B) Breakdown by language
select
  l.id as language_id,
  l.name as language,
  count(e.id) as total_entries,
  count(e.id) filter (
    where nullif(trim(coalesce(e.english_translation, '')), '') is not null
       or nullif(trim(coalesce(e.swahili_translation, '')), '') is not null
  ) as with_bridge_translation,
  count(e.id) filter (
    where nullif(trim(coalesce(e.english_translation, '')), '') is null
      and nullif(trim(coalesce(e.swahili_translation, '')), '') is null
  ) as missing_bridge_translation
from public.languages l
left join public.entries e on e.language_id = l.id
group by l.id, l.name
order by missing_bridge_translation desc, total_entries desc;

-- C) High-priority candidates: verified entries missing both bridge fields
select
  e.id,
  e.headword,
  l.name as language,
  e.primary_definition,
  e.validation_status,
  e.created_at
from public.entries e
join public.languages l on l.id = e.language_id
where e.validation_status = 'verified'
  and nullif(trim(coalesce(e.english_translation, '')), '') is null
  and nullif(trim(coalesce(e.swahili_translation, '')), '') is null
order by e.created_at asc;

-- D) Potential vernacular-in-definition heuristic (starter signal)
-- Flags entries where primary_definition is short and bridge fields are empty.
select
  e.id,
  e.headword,
  l.name as language,
  e.primary_definition,
  char_length(coalesce(e.primary_definition, '')) as definition_len
from public.entries e
join public.languages l on l.id = e.language_id
where nullif(trim(coalesce(e.english_translation, '')), '') is null
  and nullif(trim(coalesce(e.swahili_translation, '')), '') is null
  and char_length(coalesce(e.primary_definition, '')) <= 60
order by definition_len asc, e.created_at asc;

-- E) Export payload for bulk backfill queue (safe select for CSV)
select
  e.id as entry_id,
  l.name as source_language,
  e.headword,
  e.primary_definition,
  e.english_translation,
  e.swahili_translation,
  e.validation_status,
  e.created_at
from public.entries e
join public.languages l on l.id = e.language_id
where nullif(trim(coalesce(e.english_translation, '')), '') is null
  and nullif(trim(coalesce(e.swahili_translation, '')), '') is null
order by e.validation_status desc, e.created_at asc;

-- F) Dry-run helper: rows that would fail policy if enforced today
select id, headword, language_id
from public.entries
where nullif(trim(coalesce(english_translation, '')), '') is null
  and nullif(trim(coalesce(swahili_translation, '')), '') is null;

-- G) After backfill, run:
-- alter table public.entries validate constraint entries_bridge_translation_required;
