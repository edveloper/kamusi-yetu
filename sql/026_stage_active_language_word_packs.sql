-- 026_stage_active_language_word_packs.sql
-- Purpose:
-- Stage curated word-expansion packs for the five currently active indigenous languages:
-- - ki (Kikuyu)
-- - luo (Dholuo)
-- - kam (Kamba)
-- - luy (Luhya)
-- - kal (Kalenjin)
--
-- Notes:
-- - These are conservative, high-frequency additions meant to deepen the active lexicon.
-- - Rows that already exist in public.entries are skipped automatically.
-- - Counts staged may therefore be lower than the raw proposed row count.

begin;

with proposed(
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
) as (
  values
    -- Kikuyu
    ('BATCH_KI_WORDS_2026_02_25_A', 1, 'ki', 'guka', 'Grandfather; an elderly male ancestor in the family.', 'grandfather', 'babu', 'noun', 'both', 'family', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),
    ('BATCH_KI_WORDS_2026_02_25_A', 2, 'ki', 'ciana', 'Children; young members of a family or community.', 'children', 'watoto', 'noun', 'both', 'family', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),
    ('BATCH_KI_WORDS_2026_02_25_A', 3, 'ki', 'thayu', 'Peace, calmness, or social harmony.', 'peace', 'amani', 'noun', 'both', 'culture', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),
    ('BATCH_KI_WORDS_2026_02_25_A', 4, 'ki', 'mucii', 'Homestead; the family home compound.', 'homestead; home compound', 'boma; nyumbani', 'noun', 'both', 'home', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),
    ('BATCH_KI_WORDS_2026_02_25_A', 5, 'ki', 'rugano', 'Story, narrative, or account told to others.', 'story; narrative', 'hadithi', 'noun', 'both', 'culture', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),

    -- Dholuo
    ('BATCH_LUO_WORDS_2026_02_25_A', 1, 'luo', 'dala', 'Homestead; the extended family home compound.', 'homestead', 'boma', 'noun', 'both', 'home', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),
    ('BATCH_LUO_WORDS_2026_02_25_A', 2, 'luo', 'nyathi', 'Child; a young son or daughter.', 'child', 'mtoto', 'noun', 'both', 'family', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),
    ('BATCH_LUO_WORDS_2026_02_25_A', 3, 'luo', 'chiemo', 'Food, meal, or something prepared for eating.', 'food; meal', 'chakula', 'noun', 'both', 'food', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),
    ('BATCH_LUO_WORDS_2026_02_25_A', 4, 'luo', 'ber', 'Good, fine, beautiful, or proper.', 'good; beautiful; fine', 'nzuri; sawa', 'adjective', 'both', 'culture', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),
    ('BATCH_LUO_WORDS_2026_02_25_A', 5, 'luo', 'piny', 'The world, land, earth, or the broader environment.', 'world; earth; land', 'dunia; ardhi', 'noun', 'both', 'nature', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),

    -- Kamba
    ('BATCH_KAM_WORDS_2026_02_25_A', 1, 'kam', 'musyi', 'Home, household, or homestead.', 'home; homestead', 'nyumbani; boma', 'noun', 'both', 'home', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),
    ('BATCH_KAM_WORDS_2026_02_25_A', 2, 'kam', 'kyalo', 'Village, countryside, or a rural settlement.', 'village', 'kijiji', 'noun', 'both', 'community', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),
    ('BATCH_KAM_WORDS_2026_02_25_A', 3, 'kam', 'nzaa', 'Hunger; the feeling of needing food.', 'hunger', 'njaa', 'noun', 'both', 'health', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),
    ('BATCH_KAM_WORDS_2026_02_25_A', 4, 'kam', 'mwaki', 'Fire used for warmth, cooking, or burning.', 'fire', 'moto', 'noun', 'both', 'home', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),
    ('BATCH_KAM_WORDS_2026_02_25_A', 5, 'kam', 'Ngai', 'God; the supreme creator in religious usage.', 'God; creator', 'Mungu', 'noun', 'both', 'culture', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),

    -- Luhya
    ('BATCH_LUY_WORDS_2026_02_25_A', 1, 'luy', 'omundu', 'A person or human being.', 'person', 'mtu', 'noun', 'both', 'family', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),
    ('BATCH_LUY_WORDS_2026_02_25_A', 2, 'luy', 'omwana', 'Child; a young son or daughter.', 'child', 'mtoto', 'noun', 'both', 'family', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),
    ('BATCH_LUY_WORDS_2026_02_25_A', 3, 'luy', 'likhono', 'Hand; the part of the body used for holding and touching.', 'hand', 'mkono', 'noun', 'both', 'body', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),
    ('BATCH_LUY_WORDS_2026_02_25_A', 4, 'luy', 'likhoni', 'Tooth; one of the hard structures in the mouth used for biting.', 'tooth', 'jino', 'noun', 'both', 'body', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),
    ('BATCH_LUY_WORDS_2026_02_25_A', 5, 'luy', 'obusuma', 'A thick maize meal commonly eaten as a staple food.', 'ugali', 'ugali', 'noun', 'both', 'food', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),

    -- Kalenjin
    ('BATCH_KAL_WORDS_2026_02_25_A', 1, 'kal', 'boiyot', 'Cattle or livestock kept by a household.', 'cattle; livestock', 'ngombe; mifugo', 'noun', 'both', 'agriculture', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),
    ('BATCH_KAL_WORDS_2026_02_25_A', 2, 'kal', 'lagok', 'Child; a young person in the family.', 'child', 'mtoto', 'noun', 'both', 'family', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),
    ('BATCH_KAL_WORDS_2026_02_25_A', 3, 'kal', 'muren', 'Girl; a female child or young woman.', 'girl', 'msichana', 'noun', 'both', 'family', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),
    ('BATCH_KAL_WORDS_2026_02_25_A', 4, 'kal', 'kipsinende', 'Love, affection, or deep care for another person.', 'love; affection', 'upendo', 'noun', 'both', 'culture', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion'),
    ('BATCH_KAL_WORDS_2026_02_25_A', 5, 'kal', 'ngwony', 'Bird; a flying animal with feathers.', 'bird', 'ndege', 'noun', 'both', 'nature', 'Kamusi curated word pack', 'community-curated', null, 'Curated active-language word expansion')
),
filtered as (
  select p.*
  from proposed p
  join public.languages l
    on lower(l.code) = lower(p.language_code)
  where not exists (
    select 1
    from public.entries e
    where e.language_id = l.id
      and e.normalized_headword = lower(trim(regexp_replace(p.headword, '\s+', ' ', 'g')))
  )
)
insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
select
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
from filtered
on conflict (batch_label, language_code, source_row_no) do update
set
  headword = excluded.headword,
  primary_definition = excluded.primary_definition,
  english_translation = excluded.english_translation,
  swahili_translation = excluded.swahili_translation,
  part_of_speech = excluded.part_of_speech,
  register = excluded.register,
  category = excluded.category,
  source_name = excluded.source_name,
  source_license = excluded.source_license,
  source_url = excluded.source_url,
  source_note = excluded.source_note,
  updated_at = now();

commit;

-- Verification:
-- select batch_label, language_code, count(*) as rows
-- from public.entry_import_staging
-- where batch_label in (
--   'BATCH_KI_WORDS_2026_02_25_A',
--   'BATCH_LUO_WORDS_2026_02_25_A',
--   'BATCH_KAM_WORDS_2026_02_25_A',
--   'BATCH_LUY_WORDS_2026_02_25_A',
--   'BATCH_KAL_WORDS_2026_02_25_A'
-- )
-- group by batch_label, language_code
-- order by batch_label;
