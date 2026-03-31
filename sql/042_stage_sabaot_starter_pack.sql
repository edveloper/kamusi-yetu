-- 042_stage_sabaot_starter_pack.sql
-- Purpose:
-- Stage a starter pack for Sabaot (`spy`) using currently sourceable lexical material.
--
-- Target:
-- - 10 starter words
-- - 5 starter phrases
--
-- Notes:
-- - This pack is staged only and must still be validated and applied.
-- - Okiek (`oki`) is intentionally excluded from this file because the current
--   public lexical surface is still too thin for a clean 10+5 starter pack.

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- Sabaot words
  ('BATCH_SPY_STARTER_2026_02_26_A', 1, 'spy', 'Chiito', 'Man.', 'man', 'mwanaume', 'noun', 'both', 'family', 'Lughayangu Sabaot entries', 'reference-web', 'https://lughayangu.com/sabaot/chiito', 'Curated Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 2, 'spy', 'Cheptoo', 'Girl.', 'girl', 'msichana', 'noun', 'both', 'family', 'Lughayangu Sabaot entries', 'reference-web', 'https://lughayangu.com/sabaot/cheptoo', 'Curated Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 3, 'spy', 'Senge', 'Aunt; specifically the father''s sister.', 'aunt', 'shangazi', 'noun', 'both', 'family', 'Lughayangu Sabaot entries', 'reference-web', 'https://lughayangu.com/sabaot/senge', 'Curated Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 4, 'spy', 'Cheeko', 'Milk.', 'milk', 'maziwa', 'noun', 'both', 'food', 'Lughayangu Sabaot entries', 'reference-web', 'https://lughayangu.com/sabaot/cheeko', 'Curated Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 5, 'spy', 'Chekoo', 'Milk.', 'milk', 'maziwa', 'noun', 'both', 'food', 'Lughayangu Sabaot entries', 'reference-web', 'https://lughayangu.com/sabaot/chekoo', 'Curated Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 6, 'spy', 'Sreet', 'Clothes or garments.', 'clothes', 'nguo', 'noun', 'both', 'home', 'Lughayangu Sabaot entries', 'reference-web', 'https://lughayangu.com/sabaot/sreet', 'Curated Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 7, 'spy', 'Kootoo', 'House or home.', 'house; home', 'nyumba', 'noun', 'both', 'home', 'Lughayangu Sabaot entries', 'reference-web', 'https://lughayangu.com/sabaot/kootoo', 'Curated Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 8, 'spy', 'Miandaa', 'Sickness or illness.', 'sickness; illness', 'ugonjwa', 'noun', 'both', 'health', 'Lughayangu Sabaot entries', 'reference-web', 'https://lughayangu.com/sabaot/miandaa', 'Curated Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 9, 'spy', 'Koreet', 'Country.', 'country', 'nchi', 'noun', 'both', 'community', 'Lughayangu Sabaot entries', 'reference-web', 'https://lughayangu.com/sabaot/koreet', 'Curated Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 10, 'spy', 'Muut', 'Five (5).', 'five', 'tano', 'numeral', 'both', 'education', 'Lughayangu Sabaot entries', 'reference-web', 'https://lughayangu.com/sabaot/muut', 'Curated Sabaot starter seed'),

  -- Sabaot phrases
  ('BATCH_SPY_STARTER_2026_02_26_A', 11, 'spy', 'Ké chemné?', 'A normal greeting used at any time of day to ask how someone is doing.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'culture', 'Lughayangu Sabaot entries', 'reference-web', 'https://lughayangu.com/sabaot/ke-chemne', 'Curated Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 12, 'spy', 'Chemune', 'A greeting asking how someone is.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'culture', 'Lughayangu Sabaot entries', 'reference-web', 'https://lughayangu.com/sabaot/chemune', 'Curated Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 13, 'spy', 'Kongoi', 'An expression of thanks.', 'Thank you.', 'Asante.', 'phrase', 'both', 'culture', 'Lughayangu Sabaot entries', 'reference-web', 'https://lughayangu.com/sabaot/kongoi', 'Curated Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 14, 'spy', 'Mache kuwo', 'A phrase meaning that he wants to go.', 'He wants to go.', 'Anataka kwenda.', 'phrase', 'both', 'culture', 'Lughayangu Sabaot entries', 'reference-web', 'https://lughayangu.com/sabaot/mache', 'Curated Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 15, 'spy', 'Ilaac ceepkoot.', 'An instruction telling someone to put on a face mask.', 'Put on a face mask.', 'Vaa barakoa.', 'phrase', 'both', 'health', 'Lughayangu Sabaot entries', 'reference-web', 'https://lughayangu.com/sabaot/ceepkoot', 'Curated Sabaot starter seed')
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
-- where batch_label = 'BATCH_SPY_STARTER_2026_02_26_A'
-- group by batch_label, language_code;
