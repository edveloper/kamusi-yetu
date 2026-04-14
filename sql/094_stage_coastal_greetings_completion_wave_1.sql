-- 094_stage_coastal_greetings_completion_wave_1.sql
-- Purpose:
-- Close the remaining greetings/courtesy gap for the first coastal wave.
--
-- Covered in this wave:
-- - coh (Chonyi)
-- - nyf (Giriama)

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- coh (Chonyi)
  ('BATCH_COH_GREETINGS_COMPLETION_W1_2026_02_27_A', 1, 'coh', 'Ndinareya', 'A reply meaning the speaker is doing well.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'greetings', 'Chonyi etiquette references', 'reference-web', 'https://en.wikipedia.org/wiki/Chonyi_language', 'Coastal greetings completion Wave 1'),
  ('BATCH_COH_GREETINGS_COMPLETION_W1_2026_02_27_A', 2, 'coh', 'Mwirorironi', 'A polite phrase used when parting for later in the day.', 'See you later.', 'Tutaonana baadaye.', 'phrase', 'both', 'courtesy', 'Chonyi etiquette references', 'reference-web', 'https://en.wikipedia.org/wiki/Chonyi_language', 'Coastal greetings completion Wave 1'),

  -- nyf (Giriama)
  ('BATCH_NYF_GREETINGS_COMPLETION_W1_2026_02_27_A', 1, 'nyf', 'Tafadhali', 'A polite word used when making a request.', 'Please.', 'Tafadhali.', 'phrase', 'both', 'courtesy', 'Giriama greeting references', 'reference-web', 'https://howtosayguide.com/how-to-say-how-are-you-in-giriama/', 'Coastal greetings completion Wave 1; coastal shared polite form'),
  ('BATCH_NYF_GREETINGS_COMPLETION_W1_2026_02_27_A', 2, 'nyf', 'Karibu', 'A welcoming phrase used when receiving someone.', 'Welcome.', 'Karibu.', 'phrase', 'both', 'courtesy', 'Giriama greeting references', 'reference-web', 'https://howtosayguide.com/how-to-say-hello-in-giriama/', 'Coastal greetings completion Wave 1; coastal shared welcome form')
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
--   'BATCH_COH_GREETINGS_COMPLETION_W1_2026_02_27_A',
--   'BATCH_NYF_GREETINGS_COMPLETION_W1_2026_02_27_A'
-- )
-- group by batch_label, language_code
-- order by batch_label;
