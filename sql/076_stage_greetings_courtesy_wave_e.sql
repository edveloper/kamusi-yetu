-- 076_stage_greetings_courtesy_wave_e.sql
-- Purpose:
-- Stage the fifth greetings/courtesy wave for the remaining near-completion
-- languages that still have sourceable additions.
--
-- Covered in this wave:
-- - mas (Maasai / Maa)
-- - orc (Orma, Oromo-aligned)
-- - sgc (Kipsigis)
-- - niq (Nandi)
-- - spy (Sabaot)
-- - x-sheng (Sheng)
--
-- Notes:
-- - This wave intentionally leaves `saq` for the next pass; it needs a
--   dedicated sourcing sweep rather than Maa backfill by assumption.
-- - `x-sheng` remains review-heavy because slang shifts faster than the other
--   languages in this rollout.

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- mas (Maasai / Maa)
  ('BATCH_MAS_GREETINGS_WAVE_E_2026_02_27_A', 1, 'mas', 'Kaing''ua ai', 'A welcoming phrase used when receiving someone.', 'Welcome.', 'Karibu.', 'phrase', 'both', 'courtesy', 'Learn Maasai: Common phrases and their meaning', 'reference-web', 'https://lughayangu.com/post/learn-maasai-common-maasai-phrases-and-their-meaning', 'Greetings/courtesy Wave E'),

  -- orc (Orma, Oromo-aligned)
  ('BATCH_ORC_GREETINGS_WAVE_E_2026_02_27_A', 1, 'orc', 'Nagaan jiraadhu', 'A courteous blessing wishing another person to remain in peace.', 'Stay in peace.', 'Baki kwa amani.', 'phrase', 'both', 'courtesy', 'Useful phrases in Oromo', 'reference-web', 'https://www.omniglot.com/language/phrases/oromo.htm', 'Greetings/courtesy Wave E; Oromo-aligned'),

  -- sgc (Kipsigis)
  ('BATCH_SGC_GREETINGS_WAVE_E_2026_02_27_A', 1, 'sgc', 'Tuga', 'A farewell used when parting.', 'Goodbye.', 'Kwa heri.', 'phrase', 'both', 'courtesy', 'Common Kipsigis words and their meaning', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-kalenjin-words-and-their-meaning', 'Greetings/courtesy Wave E'),
  ('BATCH_SGC_GREETINGS_WAVE_E_2026_02_27_A', 2, 'sgc', 'Chamgei mising', 'A response to a greeting.', 'Hello to you too.', 'Habari kwako pia.', 'phrase', 'both', 'greetings', 'Common Kipsigis words and their meaning', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-kalenjin-words-and-their-meaning', 'Greetings/courtesy Wave E'),

  -- niq (Nandi)
  ('BATCH_NIQ_GREETINGS_WAVE_E_2026_02_27_A', 1, 'niq', 'Chamgei', 'A general greeting used to say hello.', 'Hello.', 'Habari.', 'phrase', 'both', 'greetings', 'Introductory Nandi guide', 'reference-web', 'https://worldschoolbooks.com/nandi-language/', 'Greetings/courtesy Wave E'),
  ('BATCH_NIQ_GREETINGS_WAVE_E_2026_02_27_A', 2, 'niq', 'Chamgei mising', 'A response to a greeting.', 'Hello to you too.', 'Habari kwako pia.', 'phrase', 'both', 'greetings', 'Introductory Nandi guide', 'reference-web', 'https://worldschoolbooks.com/nandi-language/', 'Greetings/courtesy Wave E'),
  ('BATCH_NIQ_GREETINGS_WAVE_E_2026_02_27_A', 3, 'niq', 'Mising''', 'A greeting used in the afternoon.', 'Good afternoon.', 'Habari ya mchana.', 'phrase', 'both', 'greetings', 'Nandi greetings lesson', 'reference-web', 'https://www.youtube.com/watch?v=nD7K4ddoDQM', 'Greetings/courtesy Wave E'),
  ('BATCH_NIQ_GREETINGS_WAVE_E_2026_02_27_A', 4, 'niq', 'Koskolin', 'A greeting used in the evening or at night.', 'Good evening.; Good night.', 'Habari ya jioni.; Usiku mwema.', 'phrase', 'both', 'greetings', 'Nandi greetings lesson', 'reference-web', 'https://www.youtube.com/watch?v=nD7K4ddoDQM', 'Greetings/courtesy Wave E'),
  ('BATCH_NIQ_GREETINGS_WAVE_E_2026_02_27_A', 5, 'niq', 'Tuga', 'A farewell used when parting.', 'Goodbye.', 'Kwa heri.', 'phrase', 'both', 'courtesy', 'Introductory Nandi guide', 'reference-web', 'https://worldschoolbooks.com/nandi-language/', 'Greetings/courtesy Wave E'),
  ('BATCH_NIQ_GREETINGS_WAVE_E_2026_02_27_A', 6, 'niq', 'Iitak aat', 'A welcoming response after thanks or arrival.', 'You are welcome.', 'Karibu.', 'phrase', 'both', 'courtesy', 'Introductory Nandi guide', 'reference-web', 'https://worldschoolbooks.com/nandi-language/', 'Greetings/courtesy Wave E'),

  -- spy (Sabaot)
  ('BATCH_SPY_GREETINGS_WAVE_E_2026_02_27_A', 1, 'spy', 'Raam banee pekoo', 'A morning greeting used early in the day.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/raam-banee-pekoo', 'Greetings/courtesy Wave E'),
  ('BATCH_SPY_GREETINGS_WAVE_E_2026_02_27_A', 2, 'spy', 'Raam banee oinet', 'A daytime greeting used later in the day.', 'Good afternoon.', 'Habari ya mchana.', 'phrase', 'both', 'greetings', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/raam-banee-oinet', 'Greetings/courtesy Wave E'),
  ('BATCH_SPY_GREETINGS_WAVE_E_2026_02_27_A', 3, 'spy', 'Raam banee kokwet', 'An evening greeting.', 'Good evening.', 'Habari ya jioni.', 'phrase', 'both', 'greetings', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/raam-banee-kokwet', 'Greetings/courtesy Wave E'),
  ('BATCH_SPY_GREETINGS_WAVE_E_2026_02_27_A', 4, 'spy', 'Raam banee kewet', 'A night blessing or late greeting.', 'Good night.', 'Usiku mwema.', 'phrase', 'both', 'courtesy', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/raam-banee-kewet', 'Greetings/courtesy Wave E'),
  ('BATCH_SPY_GREETINGS_WAVE_E_2026_02_27_A', 5, 'spy', 'Keretyee', 'A farewell used when parting.', 'Goodbye.', 'Kwa heri.', 'phrase', 'both', 'courtesy', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/keretyee', 'Greetings/courtesy Wave E'),
  ('BATCH_SPY_GREETINGS_WAVE_E_2026_02_27_A', 6, 'spy', 'Makeetyet', 'A welcoming response after thanks or arrival.', 'You are welcome.', 'Karibu.', 'phrase', 'both', 'courtesy', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/makeetyet', 'Greetings/courtesy Wave E'),

  -- x-sheng (Sheng)
  ('BATCH_SHENG_GREETINGS_WAVE_E_2026_02_27_A', 1, 'x-sheng', 'sasa?', 'A common casual greeting in Sheng.', 'What''s up?; Hello.', 'Sasa?; Habari?', 'phrase', 'informal', 'greetings', 'A Tourist''s Guide to Kenyan Slang, Sayings, and Street Lingo', 'reference-web', 'https://visitkenyaguide.com/speak-like-a-local-kenyan-slang-and-phrases-for-tourists/', 'Greetings/courtesy Wave E; review-heavy slang'),
  ('BATCH_SHENG_GREETINGS_WAVE_E_2026_02_27_A', 2, 'x-sheng', 'uko aje?', 'A casual greeting asking how someone is.', 'How are you?', 'Uko aje?; Habari yako?', 'phrase', 'informal', 'greetings', 'A Tourist''s Guide to Kenyan Slang, Sayings, and Street Lingo', 'reference-web', 'https://visitkenyaguide.com/speak-like-a-local-kenyan-slang-and-phrases-for-tourists/', 'Greetings/courtesy Wave E; review-heavy slang'),
  ('BATCH_SHENG_GREETINGS_WAVE_E_2026_02_27_A', 3, 'x-sheng', 'poa', 'A casual positive response to a greeting.', 'Cool.; I am fine.', 'Poa.; Niko sawa.', 'phrase', 'informal', 'greetings', 'A Tourist''s Guide to Kenyan Slang, Sayings, and Street Lingo', 'reference-web', 'https://visitkenyaguide.com/speak-like-a-local-kenyan-slang-and-phrases-for-tourists/', 'Greetings/courtesy Wave E; review-heavy slang'),
  ('BATCH_SHENG_GREETINGS_WAVE_E_2026_02_27_A', 4, 'x-sheng', 'rada?', 'A casual street greeting asking what is happening.', 'What''s the plan?; What''s up?', 'Vipi?; Kunaendaje?', 'phrase', 'informal', 'greetings', 'A Tourist''s Guide to Kenyan Slang, Sayings, and Street Lingo', 'reference-web', 'https://visitkenyaguide.com/speak-like-a-local-kenyan-slang-and-phrases-for-tourists/', 'Greetings/courtesy Wave E; review-heavy slang'),
  ('BATCH_SHENG_GREETINGS_WAVE_E_2026_02_27_A', 5, 'x-sheng', 'noma', 'An emphatic positive reaction in casual urban speech.', 'Cool.; Awesome.', 'Poa sana.; Kali.', 'phrase', 'informal', 'courtesy', 'A Tourist''s Guide to Kenyan Slang, Sayings, and Street Lingo', 'reference-web', 'https://visitkenyaguide.com/speak-like-a-local-kenyan-slang-and-phrases-for-tourists/', 'Greetings/courtesy Wave E; review-heavy slang')
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
--   'BATCH_MAS_GREETINGS_WAVE_E_2026_02_27_A',
--   'BATCH_ORC_GREETINGS_WAVE_E_2026_02_27_A',
--   'BATCH_SGC_GREETINGS_WAVE_E_2026_02_27_A',
--   'BATCH_NIQ_GREETINGS_WAVE_E_2026_02_27_A',
--   'BATCH_SPY_GREETINGS_WAVE_E_2026_02_27_A',
--   'BATCH_SHENG_GREETINGS_WAVE_E_2026_02_27_A'
-- )
-- group by batch_label, language_code
-- order by batch_label;
