-- 042_stage_wave2_sabaot_starter_pack.sql
-- Purpose:
-- Stage a curated Wave 2 starter pack for Sabaot.
--
-- Covered in this wave:
-- - spy (Sabaot)
--
-- Target:
-- - 10 starter words
-- - 5 starter phrases
--
-- Notes:
-- - These are curated starter entries for moderator and partner review.
-- - They are staged only and must still be validated and applied.

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- spy (Sabaot) words
  ('BATCH_SPY_STARTER_2026_02_26_A', 1, 'spy', 'Nyaar', 'To destroy or spoil something.', 'destroy', 'haribu', 'verb', 'both', 'actions', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/nyaar', 'Curated Wave 2 Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 2, 'spy', 'Muut', 'Five.', 'five', 'tano', 'numeral', 'both', 'numbers', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/muut', 'Curated Wave 2 Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 3, 'spy', 'Cheptoo', 'Girl.', 'girl', 'msichana', 'noun', 'both', 'family', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/cheptoo', 'Curated Wave 2 Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 4, 'spy', 'Chiito', 'Man.', 'man', 'mwanaume', 'noun', 'both', 'family', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/chiito', 'Curated Wave 2 Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 5, 'spy', 'Amiik', 'Food.', 'food', 'chakula', 'noun', 'both', 'food', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/amiik', 'Curated Wave 2 Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 6, 'spy', 'Miandaa', 'Illness or sickness.', 'illness; sickness', 'ugonjwa', 'noun', 'both', 'health', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/miandaa', 'Curated Wave 2 Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 7, 'spy', 'Machee', 'To want or desire something.', 'want', 'taka', 'verb', 'both', 'actions', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/machee', 'Curated Wave 2 Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 8, 'spy', 'Sreet', 'Clothes or garments.', 'clothes', 'nguo', 'noun', 'both', 'home', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/sreet', 'Curated Wave 2 Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 9, 'spy', 'Chekoo', 'Milk.', 'milk', 'maziwa', 'noun', 'both', 'food', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/chekoo', 'Curated Wave 2 Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 10, 'spy', 'Ceepkoot', 'Face mask; a protective covering for the mouth and face.', 'face mask', 'barakoa', 'noun', 'both', 'health', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/ceepkoot', 'Curated Wave 2 Sabaot starter seed'),

  -- spy (Sabaot) phrases
  ('BATCH_SPY_STARTER_2026_02_26_A', 11, 'spy', 'Ke chemne?', 'A common greeting asking how someone is doing.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'culture', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/ke-chemne', 'Curated Wave 2 Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 12, 'spy', 'Kongoi', 'An expression of thanks.', 'Thank you.', 'Asante.', 'phrase', 'both', 'culture', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/kongoi', 'Curated Wave 2 Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 13, 'spy', 'Acheemi', 'An expression of affection meaning I love you.', 'I love you.', 'Nakupenda.', 'phrase', 'both', 'culture', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/acheemi', 'Curated Wave 2 Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 14, 'spy', 'Machee chekoo?', 'A simple question asking if someone wants milk.', 'Do you want milk?', 'Unataka maziwa?', 'phrase', 'both', 'food', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/machee', 'Curated Wave 2 Sabaot starter seed'),
  ('BATCH_SPY_STARTER_2026_02_26_A', 15, 'spy', 'Atinye miandaa.', 'A phrase used to say the speaker is ill.', 'I have an illness.', 'Nina ugonjwa.', 'phrase', 'both', 'health', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/miandaa', 'Curated Wave 2 Sabaot starter seed')
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
