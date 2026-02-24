-- 004_bridge_autopopulate_backfill.sql
-- Purpose:
-- 1) Auto-populate bridge_lexicon from existing entries.
-- 2) Backfill missing SW on English entries.
-- 3) Backfill missing EN on Swahili entries.
--
-- Safety:
-- - Only updates rows that are missing the target bridge field.
-- - Uses normalized exact matching.
-- - Applies only when a mapping is unambiguous (single candidate).

begin;

-- Resolve EN and SW language ids dynamically.
with lang_ids as (
  select
    (
      select l.id
      from public.languages l
      where lower(l.code) = 'en'
      order by l.created_at asc
      limit 1
    ) as en_id,
    (
      select l.id
      from public.languages l
      where lower(l.code) = 'sw'
      order by l.created_at asc
      limit 1
    ) as sw_id
)
select
  case
    when en_id is null or sw_id is null then
      pg_sleep(0) -- no-op to keep SQL block valid
  end
from lang_ids;

-- ==========================================
-- A) AUTO-POPULATE BRIDGE LEXICON
-- ==========================================

-- A1) From entries that already have both english_translation + swahili_translation.
insert into public.bridge_lexicon (swahili_term, english_term, confidence, source)
select distinct
  trim(e.swahili_translation) as swahili_term,
  trim(e.english_translation) as english_term,
  0.82 as confidence,
  'derived' as source
from public.entries e
where nullif(trim(coalesce(e.swahili_translation, '')), '') is not null
  and nullif(trim(coalesce(e.english_translation, '')), '') is not null
on conflict (normalized_swahili, normalized_english) do nothing;

-- A2) From English entries with a Swahili translation.
with ids as (
  select
    (
      select l.id
      from public.languages l
      where lower(l.code) = 'en'
      order by l.created_at asc
      limit 1
    ) as en_id
)
insert into public.bridge_lexicon (swahili_term, english_term, confidence, source)
select distinct
  trim(e.swahili_translation) as swahili_term,
  trim(e.headword) as english_term,
  0.9 as confidence,
  'derived' as source
from public.entries e
cross join ids
where e.language_id = ids.en_id
  and nullif(trim(coalesce(e.swahili_translation, '')), '') is not null
  and nullif(trim(coalesce(e.headword, '')), '') is not null
on conflict (normalized_swahili, normalized_english) do nothing;

-- A3) From Swahili entries with an English translation.
with ids as (
  select
    (
      select l.id
      from public.languages l
      where lower(l.code) = 'sw'
      order by l.created_at asc
      limit 1
    ) as sw_id
)
insert into public.bridge_lexicon (swahili_term, english_term, confidence, source)
select distinct
  trim(e.headword) as swahili_term,
  trim(e.english_translation) as english_term,
  0.9 as confidence,
  'derived' as source
from public.entries e
cross join ids
where e.language_id = ids.sw_id
  and nullif(trim(coalesce(e.english_translation, '')), '') is not null
  and nullif(trim(coalesce(e.headword, '')), '') is not null
on conflict (normalized_swahili, normalized_english) do nothing;

-- ==========================================
-- B) BACKFILL SW ON ENGLISH ENTRIES
-- ==========================================
--
-- For EN entries missing swahili_translation:
-- headword (EN) -> bridge_lexicon.english_term -> swahili_term
-- Only apply if exactly one swahili candidate exists per row.

with ids as (
  select
    (
      select l.id
      from public.languages l
      where lower(l.code) = 'en'
      order by l.created_at asc
      limit 1
    ) as en_id
),
candidates as (
  select
    e.id as entry_id,
    b.swahili_term,
    row_number() over (
      partition by e.id
      order by b.confidence desc, b.updated_at desc, b.created_at desc
    ) as rn,
    count(*) over (partition by e.id) as cnt
  from public.entries e
  cross join ids
  join public.bridge_lexicon b
    on b.normalized_english = lower(trim(regexp_replace(e.headword, '\s+', ' ', 'g')))
  where e.language_id = ids.en_id
    and nullif(trim(coalesce(e.headword, '')), '') is not null
    and nullif(trim(coalesce(e.swahili_translation, '')), '') is null
)
update public.entries e
set swahili_translation = c.swahili_term,
    updated_at = now()
from candidates c
where e.id = c.entry_id
  and c.rn = 1
  and c.cnt = 1;

-- ==========================================
-- C) BACKFILL EN ON SWAHILI ENTRIES
-- ==========================================
--
-- For SW entries missing english_translation:
-- headword (SW) -> bridge_lexicon.swahili_term -> english_term
-- Only apply if exactly one english candidate exists per row.

with ids as (
  select
    (
      select l.id
      from public.languages l
      where lower(l.code) = 'sw'
      order by l.created_at asc
      limit 1
    ) as sw_id
),
candidates as (
  select
    e.id as entry_id,
    b.english_term,
    row_number() over (
      partition by e.id
      order by b.confidence desc, b.updated_at desc, b.created_at desc
    ) as rn,
    count(*) over (partition by e.id) as cnt
  from public.entries e
  cross join ids
  join public.bridge_lexicon b
    on b.normalized_swahili = lower(trim(regexp_replace(e.headword, '\s+', ' ', 'g')))
  where e.language_id = ids.sw_id
    and nullif(trim(coalesce(e.headword, '')), '') is not null
    and nullif(trim(coalesce(e.english_translation, '')), '') is null
)
update public.entries e
set english_translation = c.english_term,
    updated_at = now()
from candidates c
where e.id = c.entry_id
  and c.rn = 1
  and c.cnt = 1;

commit;

-- =========================
-- VERIFICATION QUERIES
-- =========================
--
-- 1) Remaining EN entries missing SW:
-- with en as (
--   select id
--   from public.languages
--   where lower(code) = 'en'
--   order by created_at asc
--   limit 1
-- )
-- select id, headword
-- from public.entries
-- where language_id = (select id from en)
--   and nullif(trim(coalesce(swahili_translation, '')), '') is null;
--
-- 2) Remaining SW entries missing EN:
-- with sw as (
--   select id
--   from public.languages
--   where lower(code) = 'sw'
--   order by created_at asc
--   limit 1
-- )
-- select id, headword
-- from public.entries
-- where language_id = (select id from sw)
--   and nullif(trim(coalesce(english_translation, '')), '') is null;
