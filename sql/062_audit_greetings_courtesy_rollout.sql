-- 062_audit_greetings_courtesy_rollout.sql
-- Purpose:
-- Audit current greetings/courtesy coverage across all active languages before
-- staging the broader rollout.
--
-- Why this exists:
-- - We want to run greetings/courtesy across all live languages before moving
--   to the next uniform pack domain.
-- - We do not want to guess phrases just to hit a numeric target.
-- - This query makes the gap explicit language by language.
--
-- Suggested target:
-- - 10 to 15 greetings/courtesy entries per live language
--
-- Suggested next use:
-- 1) Run this query
-- 2) Identify the languages still below target
-- 3) Build sourced rollout waves until every live language reaches the target

with live_languages as (
  select id, code, name, native_name
  from public.languages
  where is_active = true
),
greeting_entries as (
  select
    e.id,
    e.language_id,
    e.headword,
    e.part_of_speech,
    e.category,
    e.english_translation,
    e.swahili_translation
  from public.entries e
  where e.validation_status = 'verified'
    and (
      lower(coalesce(e.category, '')) = 'greetings'
      or lower(coalesce(e.part_of_speech, '')) = 'phrase'
         and (
           lower(coalesce(e.english_translation, '')) like '%hello%'
           or lower(coalesce(e.english_translation, '')) like '%good morning%'
           or lower(coalesce(e.english_translation, '')) like '%good afternoon%'
           or lower(coalesce(e.english_translation, '')) like '%good evening%'
           or lower(coalesce(e.english_translation, '')) like '%how are you%'
           or lower(coalesce(e.english_translation, '')) like '%i am fine%'
           or lower(coalesce(e.english_translation, '')) like '%thank you%'
           or lower(coalesce(e.english_translation, '')) like '%you are welcome%'
           or lower(coalesce(e.english_translation, '')) like '%sorry%'
           or lower(coalesce(e.english_translation, '')) like '%goodbye%'
           or lower(coalesce(e.english_translation, '')) like '%see you%'
           or lower(coalesce(e.english_translation, '')) like '%nice to meet you%'
         )
    )
),
example_counts as (
  select entry_id, count(*) as example_rows
  from public.entry_usage_examples
  group by entry_id
),
language_rollout as (
  select
    l.code,
    l.name,
    l.native_name,
    count(g.id) as greetings_entries,
    count(*) filter (where lower(coalesce(g.part_of_speech, '')) = 'phrase') as greeting_phrases,
    count(*) filter (where coalesce(ec.example_rows, 0) > 0) as greetings_with_examples
  from live_languages l
  left join greeting_entries g
    on g.language_id = l.id
  left join example_counts ec
    on ec.entry_id = g.id
  group by l.code, l.name, l.native_name
)
select
  code,
  name,
  native_name,
  greetings_entries,
  greeting_phrases,
  greetings_with_examples,
  greatest(0, 10 - greetings_entries) as rows_needed_to_reach_10,
  greatest(0, 15 - greetings_entries) as rows_needed_to_reach_15
from language_rollout
order by greetings_entries asc, name asc;
