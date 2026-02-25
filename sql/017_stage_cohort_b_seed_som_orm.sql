-- 017_stage_cohort_b_seed_som_orm.sql
-- Purpose:
-- Stage real starter entries (no placeholders) for:
-- - som (Somali)
-- - orm (Borana Oromo)
--
-- Output batches:
-- - BATCH_SOM_STARTER_2026_02_25_A
-- - BATCH_ORM_STARTER_2026_02_25_A

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- som (Somali)
  ('BATCH_SOM_STARTER_2026_02_25_A', 1, 'som', 'biyo', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SOM_STARTER_2026_02_25_A', 2, 'som', 'guri', 'House or home.', 'house; home', 'nyumba', 'noun', 'both', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SOM_STARTER_2026_02_25_A', 3, 'som', 'qof', 'A person; human being.', 'person', 'mtu', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SOM_STARTER_2026_02_25_A', 4, 'som', 'aabe', 'Father.', 'father', 'baba', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SOM_STARTER_2026_02_25_A', 5, 'som', 'hooyo', 'Mother.', 'mother', 'mama', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SOM_STARTER_2026_02_25_A', 6, 'som', 'cunug', 'Child.', 'child', 'mtoto', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SOM_STARTER_2026_02_25_A', 7, 'som', 'cunto', 'Food.', 'food', 'chakula', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SOM_STARTER_2026_02_25_A', 8, 'som', 'qorrax', 'Sun.', 'sun', 'jua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SOM_STARTER_2026_02_25_A', 9, 'som', 'roob', 'Rain.', 'rain', 'mvua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SOM_STARTER_2026_02_25_A', 10, 'som', 'dugsi', 'School.', 'school', 'shule', 'noun', 'both', 'education', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),

  -- orm (Borana Oromo)
  ('BATCH_ORM_STARTER_2026_02_25_A', 1, 'orm', 'bishaan', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_ORM_STARTER_2026_02_25_A', 2, 'orm', 'mana', 'House or home.', 'house; home', 'nyumba', 'noun', 'both', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_ORM_STARTER_2026_02_25_A', 3, 'orm', 'nama', 'A person; human being.', 'person', 'mtu', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_ORM_STARTER_2026_02_25_A', 4, 'orm', 'abbaa', 'Father.', 'father', 'baba', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_ORM_STARTER_2026_02_25_A', 5, 'orm', 'haadha', 'Mother.', 'mother', 'mama', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_ORM_STARTER_2026_02_25_A', 6, 'orm', 'ijoollee', 'Children.', 'children', 'watoto', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_ORM_STARTER_2026_02_25_A', 7, 'orm', 'nyaata', 'Food.', 'food', 'chakula', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_ORM_STARTER_2026_02_25_A', 8, 'orm', 'aduu', 'Sun.', 'sun', 'jua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_ORM_STARTER_2026_02_25_A', 9, 'orm', 'roobaa', 'Rain.', 'rain', 'mvua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_ORM_STARTER_2026_02_25_A', 10, 'orm', 'mana barumsaa', 'School.', 'school', 'shule', 'noun', 'both', 'education', 'Kamusi curated starter', 'internal', null, 'Manual curated seed')
on conflict do nothing;

commit;

-- Verification:
-- select batch_label, language_code, count(*) as rows
-- from public.entry_import_staging
-- where batch_label in ('BATCH_SOM_STARTER_2026_02_25_A', 'BATCH_ORM_STARTER_2026_02_25_A')
-- group by batch_label, language_code
-- order by batch_label;
