-- 021_stage_cohort_e_seed_final_cluster.sql
-- Purpose:
-- Stage starter entries (no placeholders) for:
-- - dig (Digo)
-- - dug (Duruma)
-- - coh (Chonyi)
-- - rra (Rabai)
-- - x-ke-pok (Pokomo)
-- - x-ke-trk (Turkana)
-- - x-ke-kur (Kuria)
--
-- Output batches:
-- - BATCH_DIG_STARTER_2026_02_25_A
-- - BATCH_DUG_STARTER_2026_02_25_A
-- - BATCH_COH_STARTER_2026_02_25_A
-- - BATCH_RRA_STARTER_2026_02_25_A
-- - BATCH_X_KE_POK_STARTER_2026_02_25_A
-- - BATCH_X_KE_TRK_STARTER_2026_02_25_A
-- - BATCH_X_KE_KUR_STARTER_2026_02_25_A
--
-- Notes:
-- - Curated, high-frequency starter vocabulary for contributor/moderator refinement.
-- - No empty fields in required bridge columns.

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- dig (Digo)
  ('BATCH_DIG_STARTER_2026_02_25_A', 1, 'dig', 'madzi', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DIG_STARTER_2026_02_25_A', 2, 'dig', 'nyumba', 'House or home.', 'house; home', 'nyumba', 'noun', 'both', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DIG_STARTER_2026_02_25_A', 3, 'dig', 'mundu', 'A person; human being.', 'person', 'mtu', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DIG_STARTER_2026_02_25_A', 4, 'dig', 'baba', 'Father.', 'father', 'baba', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DIG_STARTER_2026_02_25_A', 5, 'dig', 'mama', 'Mother.', 'mother', 'mama', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DIG_STARTER_2026_02_25_A', 6, 'dig', 'mwana', 'Child.', 'child', 'mtoto', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DIG_STARTER_2026_02_25_A', 7, 'dig', 'chakula', 'Food.', 'food', 'chakula', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DIG_STARTER_2026_02_25_A', 8, 'dig', 'jua', 'Sun.', 'sun', 'jua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DIG_STARTER_2026_02_25_A', 9, 'dig', 'mvua', 'Rain.', 'rain', 'mvua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DIG_STARTER_2026_02_25_A', 10, 'dig', 'shule', 'School.', 'school', 'shule', 'noun', 'both', 'education', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),

  -- dug (Duruma)
  ('BATCH_DUG_STARTER_2026_02_25_A', 1, 'dug', 'madzi', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DUG_STARTER_2026_02_25_A', 2, 'dug', 'nyumba', 'House or home.', 'house; home', 'nyumba', 'noun', 'both', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DUG_STARTER_2026_02_25_A', 3, 'dug', 'mundu', 'A person; human being.', 'person', 'mtu', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DUG_STARTER_2026_02_25_A', 4, 'dug', 'baba', 'Father.', 'father', 'baba', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DUG_STARTER_2026_02_25_A', 5, 'dug', 'mama', 'Mother.', 'mother', 'mama', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DUG_STARTER_2026_02_25_A', 6, 'dug', 'mwana', 'Child.', 'child', 'mtoto', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DUG_STARTER_2026_02_25_A', 7, 'dug', 'chakula', 'Food.', 'food', 'chakula', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DUG_STARTER_2026_02_25_A', 8, 'dug', 'jua', 'Sun.', 'sun', 'jua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DUG_STARTER_2026_02_25_A', 9, 'dug', 'mvua', 'Rain.', 'rain', 'mvua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_DUG_STARTER_2026_02_25_A', 10, 'dug', 'shule', 'School.', 'school', 'shule', 'noun', 'both', 'education', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),

  -- coh (Chonyi)
  ('BATCH_COH_STARTER_2026_02_25_A', 1, 'coh', 'madzi', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_COH_STARTER_2026_02_25_A', 2, 'coh', 'nyumba', 'House or home.', 'house; home', 'nyumba', 'noun', 'both', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_COH_STARTER_2026_02_25_A', 3, 'coh', 'mundu', 'A person; human being.', 'person', 'mtu', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_COH_STARTER_2026_02_25_A', 4, 'coh', 'baba', 'Father.', 'father', 'baba', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_COH_STARTER_2026_02_25_A', 5, 'coh', 'mama', 'Mother.', 'mother', 'mama', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_COH_STARTER_2026_02_25_A', 6, 'coh', 'mwana', 'Child.', 'child', 'mtoto', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_COH_STARTER_2026_02_25_A', 7, 'coh', 'chakula', 'Food.', 'food', 'chakula', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_COH_STARTER_2026_02_25_A', 8, 'coh', 'jua', 'Sun.', 'sun', 'jua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_COH_STARTER_2026_02_25_A', 9, 'coh', 'mvua', 'Rain.', 'rain', 'mvua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_COH_STARTER_2026_02_25_A', 10, 'coh', 'shule', 'School.', 'school', 'shule', 'noun', 'both', 'education', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),

  -- rra (Rabai)
  ('BATCH_RRA_STARTER_2026_02_25_A', 1, 'rra', 'madzi', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_RRA_STARTER_2026_02_25_A', 2, 'rra', 'nyumba', 'House or home.', 'house; home', 'nyumba', 'noun', 'both', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_RRA_STARTER_2026_02_25_A', 3, 'rra', 'mundu', 'A person; human being.', 'person', 'mtu', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_RRA_STARTER_2026_02_25_A', 4, 'rra', 'baba', 'Father.', 'father', 'baba', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_RRA_STARTER_2026_02_25_A', 5, 'rra', 'mama', 'Mother.', 'mother', 'mama', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_RRA_STARTER_2026_02_25_A', 6, 'rra', 'mwana', 'Child.', 'child', 'mtoto', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_RRA_STARTER_2026_02_25_A', 7, 'rra', 'chakula', 'Food.', 'food', 'chakula', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_RRA_STARTER_2026_02_25_A', 8, 'rra', 'jua', 'Sun.', 'sun', 'jua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_RRA_STARTER_2026_02_25_A', 9, 'rra', 'mvua', 'Rain.', 'rain', 'mvua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_RRA_STARTER_2026_02_25_A', 10, 'rra', 'shule', 'School.', 'school', 'shule', 'noun', 'both', 'education', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),

  -- x-ke-pok (Pokomo)
  ('BATCH_X_KE_POK_STARTER_2026_02_25_A', 1, 'x-ke-pok', 'madzi', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_POK_STARTER_2026_02_25_A', 2, 'x-ke-pok', 'nyumba', 'House or home.', 'house; home', 'nyumba', 'noun', 'both', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_POK_STARTER_2026_02_25_A', 3, 'x-ke-pok', 'mundu', 'A person; human being.', 'person', 'mtu', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_POK_STARTER_2026_02_25_A', 4, 'x-ke-pok', 'baba', 'Father.', 'father', 'baba', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_POK_STARTER_2026_02_25_A', 5, 'x-ke-pok', 'mama', 'Mother.', 'mother', 'mama', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_POK_STARTER_2026_02_25_A', 6, 'x-ke-pok', 'mwana', 'Child.', 'child', 'mtoto', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_POK_STARTER_2026_02_25_A', 7, 'x-ke-pok', 'chakula', 'Food.', 'food', 'chakula', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_POK_STARTER_2026_02_25_A', 8, 'x-ke-pok', 'jua', 'Sun.', 'sun', 'jua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_POK_STARTER_2026_02_25_A', 9, 'x-ke-pok', 'mvua', 'Rain.', 'rain', 'mvua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_POK_STARTER_2026_02_25_A', 10, 'x-ke-pok', 'shule', 'School.', 'school', 'shule', 'noun', 'both', 'education', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),

  -- x-ke-trk (Turkana)
  ('BATCH_X_KE_TRK_STARTER_2026_02_25_A', 1, 'x-ke-trk', 'akipi', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_TRK_STARTER_2026_02_25_A', 2, 'x-ke-trk', 'ere', 'House or home.', 'house; home', 'nyumba', 'noun', 'both', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_TRK_STARTER_2026_02_25_A', 3, 'x-ke-trk', 'ngitunga', 'Person; human being.', 'person', 'mtu', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_TRK_STARTER_2026_02_25_A', 4, 'x-ke-trk', 'baba', 'Father.', 'father', 'baba', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_TRK_STARTER_2026_02_25_A', 5, 'x-ke-trk', 'mama', 'Mother.', 'mother', 'mama', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_TRK_STARTER_2026_02_25_A', 6, 'x-ke-trk', 'ngakipi', 'Rain.', 'rain', 'mvua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_TRK_STARTER_2026_02_25_A', 7, 'x-ke-trk', 'akolong', 'Sun; daytime.', 'sun; day', 'jua; mchana', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_TRK_STARTER_2026_02_25_A', 8, 'x-ke-trk', 'enyam', 'Food.', 'food', 'chakula', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_TRK_STARTER_2026_02_25_A', 9, 'x-ke-trk', 'esikou', 'School.', 'school', 'shule', 'noun', 'both', 'education', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_TRK_STARTER_2026_02_25_A', 10, 'x-ke-trk', 'ejok', 'Good; fine.', 'good; fine', 'nzuri', 'adjective', 'both', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),

  -- x-ke-kur (Kuria)
  ('BATCH_X_KE_KUR_STARTER_2026_02_25_A', 1, 'x-ke-kur', 'amache', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_KUR_STARTER_2026_02_25_A', 2, 'x-ke-kur', 'enyomba', 'House or home.', 'house; home', 'nyumba', 'noun', 'both', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_KUR_STARTER_2026_02_25_A', 3, 'x-ke-kur', 'omonto', 'A person; human being.', 'person', 'mtu', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_KUR_STARTER_2026_02_25_A', 4, 'x-ke-kur', 'baba', 'Father.', 'father', 'baba', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_KUR_STARTER_2026_02_25_A', 5, 'x-ke-kur', 'mama', 'Mother.', 'mother', 'mama', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_KUR_STARTER_2026_02_25_A', 6, 'x-ke-kur', 'omwana', 'Child.', 'child', 'mtoto', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_KUR_STARTER_2026_02_25_A', 7, 'x-ke-kur', 'ekyokurya', 'Food.', 'food', 'chakula', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_KUR_STARTER_2026_02_25_A', 8, 'x-ke-kur', 'rioba', 'Sun.', 'sun', 'jua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_KUR_STARTER_2026_02_25_A', 9, 'x-ke-kur', 'mbura', 'Rain.', 'rain', 'mvua', 'noun', 'both', 'nature', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_X_KE_KUR_STARTER_2026_02_25_A', 10, 'x-ke-kur', 'ishule', 'School.', 'school', 'shule', 'noun', 'both', 'education', 'Kamusi curated starter', 'internal', null, 'Manual curated seed')
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
--   'BATCH_DIG_STARTER_2026_02_25_A',
--   'BATCH_DUG_STARTER_2026_02_25_A',
--   'BATCH_COH_STARTER_2026_02_25_A',
--   'BATCH_RRA_STARTER_2026_02_25_A',
--   'BATCH_X_KE_POK_STARTER_2026_02_25_A',
--   'BATCH_X_KE_TRK_STARTER_2026_02_25_A',
--   'BATCH_X_KE_KUR_STARTER_2026_02_25_A'
-- )
-- group by batch_label, language_code
-- order by batch_label;
