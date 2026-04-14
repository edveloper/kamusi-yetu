-- 100_stage_highland_greetings_completion_wave_1.sql
-- Purpose:
-- Close the remaining greetings/courtesy gap for the first eastern highland wave.
--
-- Covered in this wave:
-- - ebu (Embu)
-- - mer (Meru)
-- - guz (Gusii)
-- - x-ke-kur (Kuria)

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  ('BATCH_EBU_GREETINGS_COMPLETION_W1_2026_02_27_A', 1, 'ebu', 'Tafadhali', 'A polite word used when making a request.', 'Please.', 'Tafadhali.', 'phrase', 'both', 'courtesy', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings completion Wave 1; review-heavy shared polite form'),
  ('BATCH_EBU_GREETINGS_COMPLETION_W1_2026_02_27_A', 2, 'ebu', 'Kwaheri', 'A parting phrase used when saying goodbye.', 'Goodbye.', 'Kwaheri.', 'phrase', 'both', 'courtesy', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings completion Wave 1; review-heavy shared parting form'),
  ('BATCH_MER_GREETINGS_COMPLETION_W1_2026_02_27_A', 1, 'mer', 'Tafadhali', 'A polite word used when making a request.', 'Please.', 'Tafadhali.', 'phrase', 'both', 'courtesy', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings completion Wave 1; review-heavy shared polite form'),
  ('BATCH_MER_GREETINGS_COMPLETION_W1_2026_02_27_A', 2, 'mer', 'Kwaheri', 'A parting phrase used when saying goodbye.', 'Goodbye.', 'Kwaheri.', 'phrase', 'both', 'courtesy', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings completion Wave 1; review-heavy shared parting form'),
  ('BATCH_GUZ_GREETINGS_COMPLETION_W1_2026_02_27_A', 1, 'guz', 'Tafadhali', 'A polite word used when making a request.', 'Please.', 'Tafadhali.', 'phrase', 'both', 'courtesy', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings completion Wave 1; review-heavy shared polite form'),
  ('BATCH_GUZ_GREETINGS_COMPLETION_W1_2026_02_27_A', 2, 'guz', 'Kwaheri', 'A parting phrase used when saying goodbye.', 'Goodbye.', 'Kwaheri.', 'phrase', 'both', 'courtesy', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings completion Wave 1; review-heavy shared parting form'),
  ('BATCH_KUR_GREETINGS_COMPLETION_W1_2026_02_27_A', 1, 'x-ke-kur', 'Tafadhali', 'A polite word used when making a request.', 'Please.', 'Tafadhali.', 'phrase', 'both', 'courtesy', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings completion Wave 1; review-heavy shared polite form'),
  ('BATCH_KUR_GREETINGS_COMPLETION_W1_2026_02_27_A', 2, 'x-ke-kur', 'Kwaheri', 'A parting phrase used when saying goodbye.', 'Goodbye.', 'Kwaheri.', 'phrase', 'both', 'courtesy', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings completion Wave 1; review-heavy shared parting form')
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
