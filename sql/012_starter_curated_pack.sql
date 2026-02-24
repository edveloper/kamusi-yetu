-- 012_starter_curated_pack.sql
-- Purpose:
-- Create a 30-concept starter pack per language in entry_import_staging.
-- - For existing native languages (ki, luo, kam, luy, kal), auto-fills headword/definition
--   from already verified entries when bridge matches are available.
-- - For new languages, inserts curated bridge concepts with empty headword/definition ready for curation.
--
-- Safe to re-run: dedup guard on (batch_label, language_code, source_row_no).

begin;

with target_languages as (
  select id, code
  from public.languages
  where code in (
    -- existing native languages
    'ki','luo','kam','luy','kal',
    -- newly onboarded
    'x-sheng','x-ke-hin','guz','mer','ebu','mas','x-ke-trk',
    'som','orm','x-ke-pok','dav','tvs','saq','rel','x-ke-kur',
    'nyf','dig','dug','coh','rra'
  )
),
concepts as (
  -- Canonical 30 bridgeable concepts from verified EN entries.
  select *
  from (
    select 'water' as en_word, 'maji' as sw_word, 'noun' as pos, 'nature' as category, 1 as ord union all
    select 'food', 'chakula', 'noun', 'food', 2 union all
    select 'house', 'nyumba', 'noun', 'home', 3 union all
    select 'book', 'kitabu', 'noun', 'education', 4 union all
    select 'person', 'mtu', 'noun', 'family', 5 union all
    select 'man', 'mwanaume', 'noun', 'family', 6 union all
    select 'woman', 'mwanamke', 'noun', 'family', 7 union all
    select 'boy', 'mvulana', 'noun', 'family', 8 union all
    select 'girl', 'msichana', 'noun', 'family', 9 union all
    select 'friend', 'rafiki', 'noun', 'family', 10 union all
    select 'teacher', 'mwalimu', 'noun', 'education', 11 union all
    select 'school', 'shule', 'noun', 'education', 12 union all
    select 'church', 'kanisa', 'noun', 'culture', 13 union all
    select 'money', 'pesa', 'noun', 'business', 14 union all
    select 'work', 'kazi', 'noun', 'business', 15 union all
    select 'day', 'siku', 'noun', 'home', 16 union all
    select 'night', 'usiku', 'noun', 'home', 17 union all
    select 'year', 'mwaka', 'noun', 'home', 18 union all
    select 'time', 'wakati', 'noun', 'home', 19 union all
    select 'hand', 'mkono', 'noun', 'health', 20 union all
    select 'eye', 'jicho', 'noun', 'health', 21 union all
    select 'head', 'kichwa', 'noun', 'health', 22 union all
    select 'heart', 'moyo', 'noun', 'health', 23 union all
    select 'sun', 'jua', 'noun', 'nature', 24 union all
    select 'rain', 'mvua', 'noun', 'nature', 25 union all
    select 'tree', 'mti', 'noun', 'nature', 26 union all
    select 'car', 'gari', 'noun', 'business', 27 union all
    select 'road', 'barabara', 'noun', 'business', 28 union all
    select 'eat', 'kula', 'verb', 'food', 29 union all
    select 'drink', 'kunywa', 'verb', 'food', 30
  ) s
),
native_matches as (
  -- Try to map concepts to already verified entries for existing native languages.
  select
    l.code as language_code,
    c.ord,
    e.headword as native_headword,
    e.primary_definition as native_definition,
    row_number() over (
      partition by l.code, c.ord
      order by
        case when lower(trim(coalesce(e.english_translation, ''))) = lower(c.en_word) then 0 else 1 end,
        case when lower(trim(coalesce(e.swahili_translation, ''))) = lower(c.sw_word) then 0 else 1 end,
        e.created_at asc
    ) as rn
  from target_languages l
  join concepts c on true
  join public.entries e
    on e.language_id = l.id
   and e.validation_status = 'verified'
   and (
      lower(trim(coalesce(e.english_translation, ''))) = lower(c.en_word)
      or lower(trim(coalesce(e.swahili_translation, ''))) = lower(c.sw_word)
   )
  where l.code in ('ki','luo','kam','luy','kal')
),
rows_to_stage as (
  select
    ('BATCH_CURATED_' || upper(replace(l.code, '-', '_')) || '_2026_02_24_A')::text as batch_label,
    c.ord::int as source_row_no,
    l.code as language_code,
    case
      when l.code in ('ki','luo','kam','luy','kal') then nm.native_headword
      else ''
    end as headword,
    case
      when l.code in ('ki','luo','kam','luy','kal') then coalesce(nm.native_definition, '')
      else ''
    end as primary_definition,
    c.en_word as english_translation,
    c.sw_word as swahili_translation,
    c.pos as part_of_speech,
    null::text as dialect_variant,
    'both'::text as register,
    null::text as pronunciation_ipa,
    null::text as etymology,
    null::text as audio_url,
    c.category as category,
    null::uuid as created_by,
    'Kamusi curated starter pack'::text as source_name,
    'internal'::text as source_license,
    null::text as source_url,
    case
      when l.code in ('ki','luo','kam','luy','kal')
        then 'Auto-filled from verified native entry where available'
      else 'Concept seeded; fill headword + definition before apply'
    end as source_note
  from target_languages l
  join concepts c on true
  left join native_matches nm
    on nm.language_code = l.code
   and nm.ord = c.ord
   and nm.rn = 1
)
insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, dialect_variant,
  register, pronunciation_ipa, etymology, audio_url, category, created_by,
  source_name, source_license, source_url, source_note
)
select
  r.batch_label, r.source_row_no, r.language_code, r.headword, r.primary_definition,
  r.english_translation, r.swahili_translation, r.part_of_speech, r.dialect_variant,
  r.register, r.pronunciation_ipa, r.etymology, r.audio_url, r.category, r.created_by,
  r.source_name, r.source_license, r.source_url, r.source_note
from rows_to_stage r
where not exists (
  select 1
  from public.entry_import_staging s
  where s.batch_label = r.batch_label
    and s.language_code = r.language_code
    and s.source_row_no = r.source_row_no
);

commit;

-- Verification:
-- select batch_label, language_code, count(*) as rows
-- from public.entry_import_staging
-- where batch_label like 'BATCH_CURATED_%_2026_02_24_A'
-- group by batch_label, language_code
-- order by language_code, batch_label;
