-- 115_language_coverage_view.sql
-- One view with everything the Coverage page reports, per language.
--
-- WHY
-- The page currently downloads every verified entry to the browser and tallies
-- them in JavaScript. That is roughly 2MB of JSON on each visit, it gets slower
-- as the corpus grows, and the same pattern already produced wrong per-language
-- counts elsewhere when it silently hit the 1,000-row response cap.
--
-- Counting belongs in the database. This also means the honest numbers, the
-- quarantined and awaiting-curation columns, are reported per language rather
-- than only in the site-wide total, so a language page cannot flatter itself.
--
-- DEPLOY ORDER: run before deploying the Coverage page.

begin;

drop view if exists public.language_coverage;

create view public.language_coverage as
select
  l.id                       as language_id,
  l.code                     as language_code,
  l.name                     as language_name,
  l.native_name              as native_name,
  l.role                     as language_role,

  -- What the public can actually see.
  count(*) filter (
    where e.validation_status = 'verified' and not e.needs_orthography_review
  )                          as public_entries,

  count(*) filter (
    where e.validation_status = 'verified' and not e.needs_orthography_review
      and lower(coalesce(e.part_of_speech, '')) = 'phrase'
  )                          as phrase_entries,

  -- The honest columns, per language rather than only in the site total.
  count(*) filter (where e.validation_status = 'seeded')        as awaiting_curation,
  count(*) filter (where e.needs_orthography_review)            as awaiting_orthography,
  count(*) filter (where e.validation_status = 'pending')        as awaiting_review,

  -- Concept coverage, which is the meaningful completeness measure.
  count(distinct e.concept_id) filter (
    where e.validation_status = 'verified' and not e.needs_orthography_review
      and e.concept_id is not null
  )                          as concepts_covered,
  (select count(*) from public.concepts) as concepts_total,

  -- Voice.
  count(distinct r.entry_id) filter (
    where r.validation_status = 'verified' and not r.is_withdrawn
  )                          as entries_with_audio,
  count(distinct r.id) filter (
    where r.validation_status = 'verified' and not r.is_withdrawn
  )                          as verified_recordings,
  count(distinct r.speaker_id) filter (where not r.is_withdrawn) as distinct_speakers,

  -- Who is credentialed to review this language.
  (select count(*) from public.user_credentials c
    where c.language_id = l.id and c.status = 'verified')        as verified_speakers,

  max(e.created_at)          as last_entry_at

from public.languages l
left join public.entries e    on e.language_id = l.id
left join public.recordings r on r.entry_id = e.id
where l.is_active
group by l.id, l.code, l.name, l.native_name, l.role;

comment on view public.language_coverage is
  'Everything the Coverage page reports, per language, counted in the database. Includes the unflattering columns deliberately.';

commit;

-- select language_name, public_entries, concepts_covered, verified_recordings,
--        awaiting_curation, awaiting_orthography
--   from public.language_coverage
--  where language_role <> 'bridge'
--  order by public_entries desc;
