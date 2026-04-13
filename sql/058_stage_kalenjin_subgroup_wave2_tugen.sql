-- 058_stage_kalenjin_subgroup_wave2_tugen.sql
-- Purpose:
-- Stage the second Kalenjin subgroup starter wave using Tugen.
--
-- Covered in this wave:
-- - tuy (Tugen)
--
-- Target:
-- - 10 starter words
-- - 5 starter phrases
--
-- Notes:
-- - Tugen has a defensible public phrase surface through Omniglot and
--   Lughayangu, which is enough for a reviewable starter pack.

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- tuy (Tugen) words
  ('BATCH_TUY_STARTER_2026_02_27_A', 1, 'tuy', 'oloo', 'A locative expression meaning there.', 'there', 'pale', 'adverb', 'both', 'daily-life', 'Lughayangu Tugen dictionary', 'reference-web', 'https://lughayangu.com/tugen/oloo', 'Curated Kalenjin subgroup Wave 2 Tugen starter seed'),
  ('BATCH_TUY_STARTER_2026_02_27_A', 2, 'tuy', 'siba', 'To sleep.', 'sleep', 'lala', 'verb', 'both', 'daily-life', 'Lughayangu Tugen dictionary', 'reference-web', 'https://lughayangu.com/tugen/siba', 'Curated Kalenjin subgroup Wave 2 Tugen starter seed'),
  ('BATCH_TUY_STARTER_2026_02_27_A', 3, 'tuy', 'anan', 'Or; an alternative connector.', 'or', 'au', 'conjunction', 'both', 'daily-life', 'Lughayangu Tugen dictionary', 'reference-web', 'https://lughayangu.com/tugen/anan', 'Curated Kalenjin subgroup Wave 2 Tugen starter seed'),
  ('BATCH_TUY_STARTER_2026_02_27_A', 4, 'tuy', 'angi', 'And; a linking word.', 'and', 'na', 'conjunction', 'both', 'daily-life', 'Lughayangu Tugen dictionary', 'reference-web', 'https://lughayangu.com/tugen/angi', 'Curated Kalenjin subgroup Wave 2 Tugen starter seed'),
  ('BATCH_TUY_STARTER_2026_02_27_A', 5, 'tuy', 'tugul', 'All; everything in a set.', 'all', 'yote', 'determiner', 'both', 'daily-life', 'Lughayangu Tugen dictionary', 'reference-web', 'https://lughayangu.com/tugen/tugul', 'Curated Kalenjin subgroup Wave 2 Tugen starter seed'),
  ('BATCH_TUY_STARTER_2026_02_27_A', 6, 'tuy', 'tui', 'Black; dark in colour.', 'black', 'nyeusi', 'adjective', 'both', 'daily-life', 'Lughayangu Tugen dictionary', 'reference-web', 'https://lughayangu.com/tugen/tui', 'Curated Kalenjin subgroup Wave 2 Tugen starter seed'),
  ('BATCH_TUY_STARTER_2026_02_27_A', 7, 'tuy', 'cheeko', 'Milk.', 'milk', 'maziwa', 'noun', 'both', 'food', 'Lughayangu Tugen dictionary', 'reference-web', 'https://lughayangu.com/tugen/cheeko', 'Curated Kalenjin subgroup Wave 2 Tugen starter seed'),
  ('BATCH_TUY_STARTER_2026_02_27_A', 8, 'tuy', 'moita', 'Calf; a young cow.', 'calf', 'ndama', 'noun', 'both', 'nature', 'Lughayangu Tugen dictionary', 'reference-web', 'https://lughayangu.com/tugen/moita', 'Curated Kalenjin subgroup Wave 2 Tugen starter seed'),
  ('BATCH_TUY_STARTER_2026_02_27_A', 9, 'tuy', 'ropta', 'Rain.', 'rain', 'mvua', 'noun', 'both', 'weather', 'Lughayangu Tugen dictionary', 'reference-web', 'https://lughayangu.com/tugen/ropta', 'Curated Kalenjin subgroup Wave 2 Tugen starter seed'),
  ('BATCH_TUY_STARTER_2026_02_27_A', 10, 'tuy', 'tisap', 'Seven.', 'seven', 'saba', 'numeral', 'both', 'numbers', 'Lughayangu Tugen dictionary', 'reference-web', 'https://lughayangu.com/tugen/tisap', 'Curated Kalenjin subgroup Wave 2 Tugen starter seed'),

  -- tuy (Tugen) phrases
  ('BATCH_TUY_STARTER_2026_02_27_A', 11, 'tuy', 'Chamngee', 'A general greeting.', 'Hello.', 'Habari.', 'phrase', 'both', 'greetings', 'Common Tugen phrases', 'reference-web', 'https://www.omniglot.com/language/phrases/tugen.htm', 'Curated Kalenjin subgroup Wave 2 Tugen starter seed'),
  ('BATCH_TUY_STARTER_2026_02_27_A', 12, 'tuy', 'Iyamune?', 'A greeting that asks how someone is doing.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Common Tugen phrases', 'reference-web', 'https://www.omniglot.com/language/phrases/tugen.htm', 'Curated Kalenjin subgroup Wave 2 Tugen starter seed'),
  ('BATCH_TUY_STARTER_2026_02_27_A', 13, 'tuy', 'Achamegee', 'A response meaning the speaker is fine.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'greetings', 'Common Tugen phrases', 'reference-web', 'https://www.omniglot.com/language/phrases/tugen.htm', 'Curated Kalenjin subgroup Wave 2 Tugen starter seed'),
  ('BATCH_TUY_STARTER_2026_02_27_A', 14, 'tuy', 'Kongoi', 'An expression of thanks.', 'Thank you.', 'Asante.', 'phrase', 'both', 'greetings', 'Common Tugen phrases', 'reference-web', 'https://lughayangu.com/post/common-tugen-phrases', 'Curated Kalenjin subgroup Wave 2 Tugen starter seed'),
  ('BATCH_TUY_STARTER_2026_02_27_A', 15, 'tuy', 'Tareto', 'A direct request for help.', 'Help me.', 'Nisaidie.', 'phrase', 'both', 'health', 'Common Tugen phrases', 'reference-web', 'https://lughayangu.com/post/common-tugen-phrases', 'Curated Kalenjin subgroup Wave 2 Tugen starter seed')
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
-- where batch_label = 'BATCH_TUY_STARTER_2026_02_27_A'
-- group by batch_label, language_code;
