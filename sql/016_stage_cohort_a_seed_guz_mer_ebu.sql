-- 016_stage_cohort_a_seed_guz_mer_ebu.sql
-- Purpose:
-- Stage real starter entries (no placeholders) for:
-- - guz (Gusii)
-- - mer (Meru)
-- - ebu (Embu)
--
-- Output batches:
-- - BATCH_GUZ_STARTER_2026_02_25_A
-- - BATCH_MER_STARTER_2026_02_25_A
-- - BATCH_EBU_STARTER_2026_02_25_A

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- guz (Gusii / Ekegusii)
  ('BATCH_GUZ_STARTER_2026_02_25_A', 1, 'guz', 'amache', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_GUZ_STARTER_2026_02_25_A', 2, 'guz', 'enyomba', 'House or home.', 'house; home', 'nyumba', 'noun', 'both', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_GUZ_STARTER_2026_02_25_A', 3, 'guz', 'omonto', 'A person; human being.', 'person', 'mtu', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_GUZ_STARTER_2026_02_25_A', 4, 'guz', 'baba', 'Father.', 'father', 'baba', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_GUZ_STARTER_2026_02_25_A', 5, 'guz', 'mama', 'Mother.', 'mother', 'mama', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_GUZ_STARTER_2026_02_25_A', 6, 'guz', 'omwana', 'Child.', 'child', 'mtoto', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_GUZ_STARTER_2026_02_25_A', 7, 'guz', 'chinkwa', 'Bread; loaf.', 'bread', 'mkate', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_GUZ_STARTER_2026_02_25_A', 8, 'guz', 'rioba', 'Sun.', 'sun', 'jua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_GUZ_STARTER_2026_02_25_A', 9, 'guz', 'mbura', 'Rain.', 'rain', 'mvua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_GUZ_STARTER_2026_02_25_A', 10, 'guz', 'egesamo', 'School.', 'school', 'shule', 'noun', 'both', 'education', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),

  -- mer (Meru / Kimeru)
  ('BATCH_MER_STARTER_2026_02_25_A', 1, 'mer', 'maji', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_MER_STARTER_2026_02_25_A', 2, 'mer', 'nyomba', 'House or home.', 'house; home', 'nyumba', 'noun', 'both', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_MER_STARTER_2026_02_25_A', 3, 'mer', 'muntu', 'A person; human being.', 'person', 'mtu', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_MER_STARTER_2026_02_25_A', 4, 'mer', 'baba', 'Father.', 'father', 'baba', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_MER_STARTER_2026_02_25_A', 5, 'mer', 'mama', 'Mother.', 'mother', 'mama', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_MER_STARTER_2026_02_25_A', 6, 'mer', 'mwana', 'Child.', 'child', 'mtoto', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_MER_STARTER_2026_02_25_A', 7, 'mer', 'mukate', 'Bread.', 'bread', 'mkate', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_MER_STARTER_2026_02_25_A', 8, 'mer', 'riua', 'Sun.', 'sun', 'jua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_MER_STARTER_2026_02_25_A', 9, 'mer', 'mbura', 'Rain.', 'rain', 'mvua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_MER_STARTER_2026_02_25_A', 10, 'mer', 'thukuru', 'School.', 'school', 'shule', 'noun', 'both', 'education', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),

  -- ebu (Embu / Kiembu)
  ('BATCH_EBU_STARTER_2026_02_25_A', 1, 'ebu', 'maji', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_EBU_STARTER_2026_02_25_A', 2, 'ebu', 'nyomba', 'House or home.', 'house; home', 'nyumba', 'noun', 'both', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_EBU_STARTER_2026_02_25_A', 3, 'ebu', 'mundu', 'A person; human being.', 'person', 'mtu', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_EBU_STARTER_2026_02_25_A', 4, 'ebu', 'baba', 'Father.', 'father', 'baba', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_EBU_STARTER_2026_02_25_A', 5, 'ebu', 'mama', 'Mother.', 'mother', 'mama', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_EBU_STARTER_2026_02_25_A', 6, 'ebu', 'mwana', 'Child.', 'child', 'mtoto', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_EBU_STARTER_2026_02_25_A', 7, 'ebu', 'mukate', 'Bread.', 'bread', 'mkate', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_EBU_STARTER_2026_02_25_A', 8, 'ebu', 'riua', 'Sun.', 'sun', 'jua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_EBU_STARTER_2026_02_25_A', 9, 'ebu', 'mbura', 'Rain.', 'rain', 'mvua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_EBU_STARTER_2026_02_25_A', 10, 'ebu', 'thukuru', 'School.', 'school', 'shule', 'noun', 'both', 'education', 'Kamusi curated starter', 'internal', null, 'Manual curated seed')
on conflict do nothing;

commit;

-- Verification
-- select batch_label, language_code, count(*) as rows
-- from public.entry_import_staging
-- where batch_label in (
--   'BATCH_GUZ_STARTER_2026_02_25_A',
--   'BATCH_MER_STARTER_2026_02_25_A',
--   'BATCH_EBU_STARTER_2026_02_25_A'
-- )
-- group by batch_label, language_code
-- order by batch_label;
