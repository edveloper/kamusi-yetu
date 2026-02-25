-- 020_stage_cohort_d_seed_rel_saq_nyf.sql
-- Purpose:
-- Stage real starter entries (no placeholders) for:
-- - rel (Rendille)
-- - saq (Samburu)
-- - nyf (Giriama)
--
-- Output batches:
-- - BATCH_REL_STARTER_2026_02_25_A
-- - BATCH_SAQ_STARTER_2026_02_25_A
-- - BATCH_NYF_STARTER_2026_02_25_A

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- rel (Rendille) - starter curated
  ('BATCH_REL_STARTER_2026_02_25_A', 1, 'rel', 'biyo', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_REL_STARTER_2026_02_25_A', 2, 'rel', 'guri', 'House or home.', 'house; home', 'nyumba', 'noun', 'both', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_REL_STARTER_2026_02_25_A', 3, 'rel', 'qof', 'A person; human being.', 'person', 'mtu', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_REL_STARTER_2026_02_25_A', 4, 'rel', 'aabe', 'Father.', 'father', 'baba', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_REL_STARTER_2026_02_25_A', 5, 'rel', 'hooyo', 'Mother.', 'mother', 'mama', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_REL_STARTER_2026_02_25_A', 6, 'rel', 'cunug', 'Child.', 'child', 'mtoto', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_REL_STARTER_2026_02_25_A', 7, 'rel', 'cunto', 'Food.', 'food', 'chakula', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_REL_STARTER_2026_02_25_A', 8, 'rel', 'qorrax', 'Sun.', 'sun', 'jua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_REL_STARTER_2026_02_25_A', 9, 'rel', 'roob', 'Rain.', 'rain', 'mvua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_REL_STARTER_2026_02_25_A', 10, 'rel', 'dugsi', 'School.', 'school', 'shule', 'noun', 'both', 'education', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),

  -- saq (Samburu)
  ('BATCH_SAQ_STARTER_2026_02_25_A', 1, 'saq', 'enkare', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SAQ_STARTER_2026_02_25_A', 2, 'saq', 'enkaji', 'House or home.', 'house; home', 'nyumba', 'noun', 'both', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SAQ_STARTER_2026_02_25_A', 3, 'saq', 'olpayian', 'A man.', 'man', 'mwanaume', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SAQ_STARTER_2026_02_25_A', 4, 'saq', 'enye', 'Mother.', 'mother', 'mama', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SAQ_STARTER_2026_02_25_A', 5, 'saq', 'paa', 'Father.', 'father', 'baba', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SAQ_STARTER_2026_02_25_A', 6, 'saq', 'nkishu', 'Cattle; cow.', 'cow; cattle', 'ngombe', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SAQ_STARTER_2026_02_25_A', 7, 'saq', 'sidai', 'Good; fine.', 'good; fine', 'nzuri', 'adjective', 'both', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SAQ_STARTER_2026_02_25_A', 8, 'saq', 'supat', 'How are you? (greeting)', 'how are you?', 'habari yako?', 'phrase', 'both', 'culture', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SAQ_STARTER_2026_02_25_A', 9, 'saq', 'ashe', 'Thank you.', 'thank you', 'asante', 'interjection', 'both', 'culture', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SAQ_STARTER_2026_02_25_A', 10, 'saq', 'osotua', 'Mutual support relationship.', 'bond; mutual support', 'uhusiano wa kusaidiana', 'noun', 'both', 'culture', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),

  -- nyf (Giriama)
  ('BATCH_NYF_STARTER_2026_02_25_A', 1, 'nyf', 'madzi', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_NYF_STARTER_2026_02_25_A', 2, 'nyf', 'nyumba', 'House or home.', 'house; home', 'nyumba', 'noun', 'both', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_NYF_STARTER_2026_02_25_A', 3, 'nyf', 'mundu', 'A person; human being.', 'person', 'mtu', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_NYF_STARTER_2026_02_25_A', 4, 'nyf', 'baba', 'Father.', 'father', 'baba', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_NYF_STARTER_2026_02_25_A', 5, 'nyf', 'mama', 'Mother.', 'mother', 'mama', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_NYF_STARTER_2026_02_25_A', 6, 'nyf', 'mwana', 'Child.', 'child', 'mtoto', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_NYF_STARTER_2026_02_25_A', 7, 'nyf', 'chakula', 'Food.', 'food', 'chakula', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_NYF_STARTER_2026_02_25_A', 8, 'nyf', 'jua', 'Sun.', 'sun', 'jua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_NYF_STARTER_2026_02_25_A', 9, 'nyf', 'mvua', 'Rain.', 'rain', 'mvua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_NYF_STARTER_2026_02_25_A', 10, 'nyf', 'shule', 'School.', 'school', 'shule', 'noun', 'both', 'education', 'Kamusi curated starter', 'internal', null, 'Manual curated seed')
on conflict do nothing;

commit;

-- Verification:
-- select batch_label, language_code, count(*) as rows
-- from public.entry_import_staging
-- where batch_label in (
--   'BATCH_REL_STARTER_2026_02_25_A',
--   'BATCH_SAQ_STARTER_2026_02_25_A',
--   'BATCH_NYF_STARTER_2026_02_25_A'
-- )
-- group by batch_label, language_code
-- order by batch_label;
