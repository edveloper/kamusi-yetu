-- 054_stage_kalenjin_subgroup_wave1_kipsigis_nandi.sql
-- Purpose:
-- Stage the first Kalenjin subgroup starter wave using Kipsigis and Nandi.
--
-- Covered in this wave:
-- - sgc (Kipsigis)
-- - niq (Nandi)
--
-- Target per language:
-- - 10 starter words
-- - 5 starter phrases
--
-- Notes:
-- - Kipsigis has stronger public phrase coverage.
-- - Nandi is sourced from lighter introductory material and should be
--   treated as more review-heavy after import.

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- sgc (Kipsigis) words
  ('BATCH_SGC_STARTER_2026_02_26_A', 1, 'sgc', 'koron', 'Tomorrow.', 'tomorrow', 'kesho', 'noun', 'both', 'time', 'Common Kipsigis words and phrases', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-kalenjin-words-and-their-meaning', 'Curated Kalenjin subgroup Wave 1 Kipsigis starter seed'),
  ('BATCH_SGC_STARTER_2026_02_26_A', 2, 'sgc', 'teputyet', 'Question.', 'question', 'swali', 'noun', 'both', 'education', 'Common Kipsigis words and phrases', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-kalenjin-words-and-their-meaning', 'Curated Kalenjin subgroup Wave 1 Kipsigis starter seed'),
  ('BATCH_SGC_STARTER_2026_02_26_A', 3, 'sgc', 'kamuktaindet', 'God; the Creator.', 'God', 'Mungu', 'noun', 'both', 'culture', 'Common Kipsigis words and phrases', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-kalenjin-words-and-their-meaning', 'Curated Kalenjin subgroup Wave 1 Kipsigis starter seed'),
  ('BATCH_SGC_STARTER_2026_02_26_A', 4, 'sgc', 'cheko', 'Milk.', 'milk', 'maziwa', 'noun', 'both', 'food', 'Common Kipsigis words and phrases', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-kalenjin-words-and-their-meaning', 'Curated Kalenjin subgroup Wave 1 Kipsigis starter seed'),
  ('BATCH_SGC_STARTER_2026_02_26_A', 5, 'sgc', 'sukul', 'School.', 'school', 'shule', 'noun', 'both', 'education', 'Common Kipsigis words and phrases', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-kalenjin-words-and-their-meaning', 'Curated Kalenjin subgroup Wave 1 Kipsigis starter seed'),
  ('BATCH_SGC_STARTER_2026_02_26_A', 6, 'sgc', 'kanisa', 'Church.', 'church', 'kanisa', 'noun', 'both', 'culture', 'Common Kipsigis words and phrases', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-kalenjin-words-and-their-meaning', 'Curated Kalenjin subgroup Wave 1 Kipsigis starter seed'),
  ('BATCH_SGC_STARTER_2026_02_26_A', 7, 'sgc', 'simet', 'Phone or telephone.', 'phone', 'simu', 'noun', 'both', 'technology', 'Common Kipsigis words and phrases', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-kalenjin-words-and-their-meaning', 'Curated Kalenjin subgroup Wave 1 Kipsigis starter seed'),
  ('BATCH_SGC_STARTER_2026_02_26_A', 8, 'sgc', 'konyit', 'Guest of honour or important guest.', 'guest of honour', 'mgeni wa heshima', 'noun', 'both', 'culture', 'Common Kipsigis words and phrases', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-kalenjin-words-and-their-meaning', 'Curated Kalenjin subgroup Wave 1 Kipsigis starter seed'),
  ('BATCH_SGC_STARTER_2026_02_26_A', 9, 'sgc', 'nego', 'Sheep.', 'sheep', 'kondoo', 'noun', 'both', 'nature', 'Common Kipsigis words and phrases', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-kalenjin-words-and-their-meaning', 'Curated Kalenjin subgroup Wave 1 Kipsigis starter seed'),
  ('BATCH_SGC_STARTER_2026_02_26_A', 10, 'sgc', 'roponi', 'Rain; rainy condition.', 'rain', 'mvua', 'noun', 'both', 'weather', 'Common Kipsigis words and phrases', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-kalenjin-words-and-their-meaning', 'Curated Kalenjin subgroup Wave 1 Kipsigis starter seed'),

  -- sgc (Kipsigis) phrases
  ('BATCH_SGC_STARTER_2026_02_26_A', 11, 'sgc', 'Kongoi', 'An expression of thanks.', 'Thank you.', 'Asante.', 'phrase', 'both', 'culture', 'Common Kipsigis words and phrases', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-kalenjin-words-and-their-meaning', 'Curated Kalenjin subgroup Wave 1 Kipsigis starter seed'),
  ('BATCH_SGC_STARTER_2026_02_26_A', 12, 'sgc', 'Mutyo', 'An apology or expression of sympathy.', 'I am sorry.', 'Samahani.', 'phrase', 'both', 'culture', 'Common Kipsigis words and phrases', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-kalenjin-words-and-their-meaning', 'Curated Kalenjin subgroup Wave 1 Kipsigis starter seed'),
  ('BATCH_SGC_STARTER_2026_02_26_A', 13, 'sgc', 'Itakaat', 'A welcoming response after being thanked.', 'You are welcome.', 'Karibu.', 'phrase', 'both', 'culture', 'Common Kipsigis words and phrases', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-kalenjin-words-and-their-meaning', 'Curated Kalenjin subgroup Wave 1 Kipsigis starter seed'),
  ('BATCH_SGC_STARTER_2026_02_26_A', 14, 'sgc', 'Toreton', 'A phrase used when asking for assistance.', 'Help me.', 'Nisaidie.', 'phrase', 'both', 'culture', 'Common Kipsigis words and phrases', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-kalenjin-words-and-their-meaning', 'Curated Kalenjin subgroup Wave 1 Kipsigis starter seed'),
  ('BATCH_SGC_STARTER_2026_02_26_A', 15, 'sgc', 'Amoche awo gaa', 'A phrase indicating the speaker wants to go home.', 'I want to go home.', 'Nataka kwenda nyumbani.', 'phrase', 'both', 'culture', 'Common Kipsigis words and phrases', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-kalenjin-words-and-their-meaning', 'Curated Kalenjin subgroup Wave 1 Kipsigis starter seed'),

  -- niq (Nandi) words
  ('BATCH_NIQ_STARTER_2026_02_26_A', 1, 'niq', 'chebo', 'Child.', 'child', 'mtoto', 'noun', 'both', 'family', 'Introductory Nandi guide', 'reference-web', 'https://worldschoolbooks.com/nandi-language/', 'Curated Kalenjin subgroup Wave 1 Nandi starter seed'),
  ('BATCH_NIQ_STARTER_2026_02_26_A', 2, 'niq', 'ama', 'Mother.', 'mother', 'mama', 'noun', 'both', 'family', 'Introductory Nandi guide', 'reference-web', 'https://worldschoolbooks.com/nandi-language/', 'Curated Kalenjin subgroup Wave 1 Nandi starter seed'),
  ('BATCH_NIQ_STARTER_2026_02_26_A', 3, 'niq', 'aba', 'Father.', 'father', 'baba', 'noun', 'both', 'family', 'Introductory Nandi guide', 'reference-web', 'https://worldschoolbooks.com/nandi-language/', 'Curated Kalenjin subgroup Wave 1 Nandi starter seed'),
  ('BATCH_NIQ_STARTER_2026_02_26_A', 4, 'niq', 'mai', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Introductory Nandi guide', 'reference-web', 'https://worldschoolbooks.com/nandi-language/', 'Curated Kalenjin subgroup Wave 1 Nandi starter seed'),
  ('BATCH_NIQ_STARTER_2026_02_26_A', 5, 'niq', 'chum', 'Food.', 'food', 'chakula', 'noun', 'both', 'food', 'Introductory Nandi guide', 'reference-web', 'https://worldschoolbooks.com/nandi-language/', 'Curated Kalenjin subgroup Wave 1 Nandi starter seed'),
  ('BATCH_NIQ_STARTER_2026_02_26_A', 6, 'niq', 'kok', 'Friend.', 'friend', 'rafiki', 'noun', 'both', 'family', 'Introductory Nandi guide', 'reference-web', 'https://worldschoolbooks.com/nandi-language/', 'Curated Kalenjin subgroup Wave 1 Nandi starter seed'),
  ('BATCH_NIQ_STARTER_2026_02_26_A', 7, 'niq', 'oruok', 'Health or wellbeing in greeting context.', 'wellbeing', 'hali; afya', 'noun', 'both', 'health', 'Introductory Nandi guide', 'reference-web', 'https://worldschoolbooks.com/nandi-language/', 'Curated Kalenjin subgroup Wave 1 Nandi starter seed'),
  ('BATCH_NIQ_STARTER_2026_02_26_A', 8, 'niq', 'kabuya', 'Morning.', 'morning', 'asubuhi', 'noun', 'both', 'time', 'Nandi greetings lesson', 'reference-web', 'https://www.youtube.com/watch?v=nD7K4ddoDQM', 'Curated Kalenjin subgroup Wave 1 Nandi starter seed'),
  ('BATCH_NIQ_STARTER_2026_02_26_A', 9, 'niq', 'mising', 'Afternoon.', 'afternoon', 'mchana', 'noun', 'both', 'time', 'Nandi greetings lesson', 'reference-web', 'https://www.youtube.com/watch?v=nD7K4ddoDQM', 'Curated Kalenjin subgroup Wave 1 Nandi starter seed'),
  ('BATCH_NIQ_STARTER_2026_02_26_A', 10, 'niq', 'kainenyu', 'Name; used when introducing oneself.', 'name', 'jina', 'noun', 'both', 'culture', 'Nandi greetings lesson', 'reference-web', 'https://www.youtube.com/watch?v=nD7K4ddoDQM', 'Curated Kalenjin subgroup Wave 1 Nandi starter seed'),

  -- niq (Nandi) phrases
  ('BATCH_NIQ_STARTER_2026_02_26_A', 11, 'niq', 'Kabi kabuya', 'A morning greeting.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'culture', 'Introductory Nandi guide', 'reference-web', 'https://worldschoolbooks.com/nandi-language/', 'Curated Kalenjin subgroup Wave 1 Nandi starter seed'),
  ('BATCH_NIQ_STARTER_2026_02_26_A', 12, 'niq', 'Ite na oruok?', 'A common greeting asking how someone is.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'culture', 'Introductory Nandi guide', 'reference-web', 'https://worldschoolbooks.com/nandi-language/', 'Curated Kalenjin subgroup Wave 1 Nandi starter seed'),
  ('BATCH_NIQ_STARTER_2026_02_26_A', 13, 'niq', 'Ne kai', 'A response meaning the speaker is fine.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'culture', 'Introductory Nandi guide', 'reference-web', 'https://worldschoolbooks.com/nandi-language/', 'Curated Kalenjin subgroup Wave 1 Nandi starter seed'),
  ('BATCH_NIQ_STARTER_2026_02_26_A', 14, 'niq', 'Kuyat', 'An expression of thanks.', 'Thank you.', 'Asante.', 'phrase', 'both', 'culture', 'Introductory Nandi guide', 'reference-web', 'https://worldschoolbooks.com/nandi-language/', 'Curated Kalenjin subgroup Wave 1 Nandi starter seed'),
  ('BATCH_NIQ_STARTER_2026_02_26_A', 15, 'niq', 'Tuiyut chum', 'A phrase inviting others to eat.', 'Let us eat.', 'Tule.', 'phrase', 'both', 'food', 'Introductory Nandi guide', 'reference-web', 'https://worldschoolbooks.com/nandi-language/', 'Curated Kalenjin subgroup Wave 1 Nandi starter seed')
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
--   'BATCH_SGC_STARTER_2026_02_26_A',
--   'BATCH_NIQ_STARTER_2026_02_26_A'
-- )
-- group by batch_label, language_code
-- order by batch_label;
