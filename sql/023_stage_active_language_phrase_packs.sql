-- 023_stage_active_language_phrase_packs.sql
-- Purpose:
-- Stage curated phrase packs for the five currently active indigenous languages:
-- - ki (Kikuyu)
-- - luo (Dholuo)
-- - kam (Kamba)
-- - luy (Luhya)
-- - kal (Kalenjin)
--
-- Notes:
-- - These are high-frequency greetings and conversational expressions.
-- - All rows include bridge fields and explanatory definitions.
-- - Usage examples can be added later through moderator completion flows.

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- Kikuyu
  ('BATCH_KI_PHRASES_2026_02_25_A', 1, 'ki', 'Ũhana atĩa?', 'A common conversational greeting used to ask how someone is doing.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_KI_PHRASES_2026_02_25_A', 2, 'ki', 'Ndĩ mwega.', 'A response meaning the speaker is well or doing fine.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_KI_PHRASES_2026_02_25_A', 3, 'ki', 'Wĩtagwo atĩa?', 'A polite question used when asking another person for their name.', 'What is your name?', 'Unaitwa nani?', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_KI_PHRASES_2026_02_25_A', 4, 'ki', 'Njĩtagwo...', 'A self-introduction phrase used before saying one''s name.', 'My name is...', 'Ninaitwa...', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_KI_PHRASES_2026_02_25_A', 5, 'ki', 'Tigoi na wega.', 'A farewell expression wishing someone well as they leave.', 'Go well; goodbye.', 'Kwa heri; uende salama.', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_KI_PHRASES_2026_02_25_A', 6, 'ki', 'Ndiranyita.', 'An expression used when the speaker has not understood what was said.', 'I do not understand.', 'Sielewi.', 'phrase', 'both', 'education', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),

  -- Dholuo
  ('BATCH_LUO_PHRASES_2026_02_25_A', 1, 'luo', 'Nade?', 'A common greeting used to ask how someone is doing.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_LUO_PHRASES_2026_02_25_A', 2, 'luo', 'Adhi maber.', 'A response meaning the speaker is well or doing okay.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_LUO_PHRASES_2026_02_25_A', 3, 'luo', 'Nyingi nga?', 'A phrase used when asking another person to tell you their name.', 'What is your name?', 'Jina lako ni nani?', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_LUO_PHRASES_2026_02_25_A', 4, 'luo', 'Nyinga...', 'A self-introduction phrase used before saying one''s own name.', 'My name is...', 'Jina langu ni...', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_LUO_PHRASES_2026_02_25_A', 5, 'luo', 'Erokamano ahinya.', 'A stronger expression of gratitude used to say thank you very much.', 'Thank you very much.', 'Asante sana.', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_LUO_PHRASES_2026_02_25_A', 6, 'luo', 'Bed maber.', 'A farewell or goodwill expression wishing another person well.', 'Stay well; have a good day.', 'Uwe salama; uwe na siku njema.', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),

  -- Kamba
  ('BATCH_KAM_PHRASES_2026_02_25_A', 1, 'kam', 'Waamûka atia?', 'A morning greeting used to ask how someone has woken up.', 'How have you woken up?; good morning.', 'Umeamkaje?; habari ya asubuhi.', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_KAM_PHRASES_2026_02_25_A', 2, 'kam', 'Naamûka nesa.', 'A response meaning the speaker has woken up well.', 'I have woken up well.', 'Nimeamka salama.', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_KAM_PHRASES_2026_02_25_A', 3, 'kam', 'Wîîw’a atia?', 'A conversational greeting used to ask how someone is feeling.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_KAM_PHRASES_2026_02_25_A', 4, 'kam', 'Nîîw’a nesa.', 'A response meaning the speaker is doing well.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_KAM_PHRASES_2026_02_25_A', 5, 'kam', 'Nûseo kûkomana naku.', 'A phrase used when meeting someone and expressing pleasure at the meeting.', 'Nice to meet you.', 'Nimefurahi kukutana nawe.', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_KAM_PHRASES_2026_02_25_A', 6, 'kam', 'Twonane yîîngî.', 'A farewell expression meaning the speakers will meet again later.', 'See you later.', 'Tutaonana baadaye.', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),

  -- Luhya
  ('BATCH_LUY_PHRASES_2026_02_25_A', 1, 'luy', 'Bushire.', 'A greeting used in the morning.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_LUY_PHRASES_2026_02_25_A', 2, 'luy', 'Keshitare.', 'A greeting used in the afternoon.', 'Good afternoon.', 'Habari ya mchana.', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_LUY_PHRASES_2026_02_25_A', 3, 'luy', 'Bwakhera.', 'A greeting used later in the day or in the evening.', 'Good evening.', 'Habari ya jioni.', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_LUY_PHRASES_2026_02_25_A', 4, 'luy', 'Oriena?', 'A conversational phrase used when asking how someone is doing.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_LUY_PHRASES_2026_02_25_A', 5, 'luy', 'Endiomulamu.', 'A reply meaning that the speaker is fine or in good health.', 'I am fine.', 'Niko salama.', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_LUY_PHRASES_2026_02_25_A', 6, 'luy', 'Mulembe muno.', 'A stronger peace greeting or response emphasizing that all is well.', 'Very peaceful; very fine.', 'Ni salama sana; niko vizuri sana.', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),

  -- Kalenjin
  ('BATCH_KAL_PHRASES_2026_02_25_A', 1, 'kal', 'Chamgei.', 'A common greeting used when meeting someone.', 'Hello.', 'Hujambo; salamu.', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_KAL_PHRASES_2026_02_25_A', 2, 'kal', 'Yamonei?', 'A conversational phrase used to ask how someone is doing.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_KAL_PHRASES_2026_02_25_A', 3, 'kal', 'Achamgei.', 'A response meaning that the speaker is doing well.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_KAL_PHRASES_2026_02_25_A', 4, 'kal', 'Kongoi mising.', 'A stronger expression of gratitude used to thank someone warmly.', 'Thank you very much.', 'Asante sana.', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_KAL_PHRASES_2026_02_25_A', 5, 'kal', 'Betut nemie.', 'A goodwill expression wishing another person a good day.', 'Have a good day.', 'Uwe na siku njema.', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed'),
  ('BATCH_KAL_PHRASES_2026_02_25_A', 6, 'kal', 'Siketuyen.', 'A farewell expression meaning people will meet again later.', 'See you again.', 'Tutaonana tena.', 'phrase', 'both', 'culture', 'Kamusi curated phrase pack', 'community-curated', null, 'Curated active-language phrase seed')
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
--   'BATCH_KI_PHRASES_2026_02_25_A',
--   'BATCH_LUO_PHRASES_2026_02_25_A',
--   'BATCH_KAM_PHRASES_2026_02_25_A',
--   'BATCH_LUY_PHRASES_2026_02_25_A',
--   'BATCH_KAL_PHRASES_2026_02_25_A'
-- )
-- group by batch_label, language_code
-- order by batch_label;
