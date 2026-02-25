-- 018_stage_cohort_c_seed_mas_dav_tvs.sql
-- Purpose:
-- Stage real starter entries (no placeholders) for:
-- - mas (Maasai / Maa)
-- - dav (Taita / Kitaita)
-- - tvs (Taveta / Kitaveta)
--
-- Output batches:
-- - BATCH_MAS_STARTER_2026_02_25_A
-- - BATCH_DAV_STARTER_2026_02_25_A
-- - BATCH_TVS_STARTER_2026_02_25_A
--
-- Note:
-- These are curated starter seeds and should still pass moderator review for dialect precision.

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- mas (Maa / Maasai)
  ('BATCH_MAS_STARTER_2026_02_25_A', 1, 'mas', 'enkare', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_MAS_STARTER_2026_02_25_A', 2, 'mas', 'enkaji', 'House or homestead.', 'house; home', 'nyumba', 'noun', 'both', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_MAS_STARTER_2026_02_25_A', 3, 'mas', 'olpayian', 'A man.', 'man', 'mwanaume', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_MAS_STARTER_2026_02_25_A', 4, 'mas', 'enye', 'Mother.', 'mother', 'mama', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_MAS_STARTER_2026_02_25_A', 5, 'mas', 'paa', 'Father.', 'father', 'baba', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_MAS_STARTER_2026_02_25_A', 6, 'mas', 'nkishu', 'Cattle; cow.', 'cow; cattle', 'ngombe', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_MAS_STARTER_2026_02_25_A', 7, 'mas', 'osotua', 'A relationship of mutual trust and support.', 'bond; mutual support', 'uhusiano wa kusaidiana', 'noun', 'both', 'culture', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_MAS_STARTER_2026_02_25_A', 8, 'mas', 'sidai', 'Good; fine; beautiful.', 'good; fine', 'nzuri', 'adjective', 'both', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_MAS_STARTER_2026_02_25_A', 9, 'mas', 'supat', 'How are you? (greeting)', 'how are you?', 'habari yako?', 'phrase', 'both', 'culture', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_MAS_STARTER_2026_02_25_A', 10, 'mas', 'ashe', 'Thank you.', 'thank you', 'asante', 'interjection', 'both', 'culture', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),

  -- dav (Taita / Kitaita)
  ('BATCH_DAV_STARTER_2026_02_25_A', 1, 'dav', 'madzi', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DAV_STARTER_2026_02_25_A', 2, 'dav', 'nyumba', 'House or home.', 'house; home', 'nyumba', 'noun', 'both', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DAV_STARTER_2026_02_25_A', 3, 'dav', 'mundu', 'A person; human being.', 'person', 'mtu', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DAV_STARTER_2026_02_25_A', 4, 'dav', 'baba', 'Father.', 'father', 'baba', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DAV_STARTER_2026_02_25_A', 5, 'dav', 'mama', 'Mother.', 'mother', 'mama', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DAV_STARTER_2026_02_25_A', 6, 'dav', 'mwana', 'Child.', 'child', 'mtoto', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DAV_STARTER_2026_02_25_A', 7, 'dav', 'chakula', 'Food.', 'food', 'chakula', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DAV_STARTER_2026_02_25_A', 8, 'dav', 'jua', 'Sun.', 'sun', 'jua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DAV_STARTER_2026_02_25_A', 9, 'dav', 'mvua', 'Rain.', 'rain', 'mvua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DAV_STARTER_2026_02_25_A', 10, 'dav', 'shule', 'School.', 'school', 'shule', 'noun', 'both', 'education', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),

  -- tvs (Taveta / Kitaveta)
  ('BATCH_TVS_STARTER_2026_02_25_A', 1, 'tvs', 'madzi', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_TVS_STARTER_2026_02_25_A', 2, 'tvs', 'nyumba', 'House or home.', 'house; home', 'nyumba', 'noun', 'both', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_TVS_STARTER_2026_02_25_A', 3, 'tvs', 'mundu', 'A person; human being.', 'person', 'mtu', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_TVS_STARTER_2026_02_25_A', 4, 'tvs', 'baba', 'Father.', 'father', 'baba', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_TVS_STARTER_2026_02_25_A', 5, 'tvs', 'mama', 'Mother.', 'mother', 'mama', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_TVS_STARTER_2026_02_25_A', 6, 'tvs', 'mwana', 'Child.', 'child', 'mtoto', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_TVS_STARTER_2026_02_25_A', 7, 'tvs', 'chakula', 'Food.', 'food', 'chakula', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_TVS_STARTER_2026_02_25_A', 8, 'tvs', 'jua', 'Sun.', 'sun', 'jua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_TVS_STARTER_2026_02_25_A', 9, 'tvs', 'mvua', 'Rain.', 'rain', 'mvua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_TVS_STARTER_2026_02_25_A', 10, 'tvs', 'shule', 'School.', 'school', 'shule', 'noun', 'both', 'education', 'Kamusi curated starter', 'internal', null, 'Manual curated seed')
on conflict do nothing;

commit;

-- Verification:
-- select batch_label, language_code, count(*) as rows
-- from public.entry_import_staging
-- where batch_label in (
--   'BATCH_MAS_STARTER_2026_02_25_A',
--   'BATCH_DAV_STARTER_2026_02_25_A',
--   'BATCH_TVS_STARTER_2026_02_25_A'
-- )
-- group by batch_label, language_code
-- order by batch_label;
