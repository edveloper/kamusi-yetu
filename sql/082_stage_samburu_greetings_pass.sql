-- 082_stage_samburu_greetings_pass.sql
-- Purpose:
-- Stage a dedicated greetings/courtesy pass for Samburu.
--
-- Why separate:
-- - Samburu still sits far below the greetings floor.
-- - It should not be backfilled by assumption from Maasai without an explicit,
--   reviewable pass.

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  ('BATCH_SAQ_GREETINGS_2026_02_27_A', 1, 'saq', 'keja enkakena', 'A morning greeting in Samburu.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Samburu phrase references', 'reference-web', 'https://samburu.globalrecordings.net/en/program/C56252', 'Dedicated Samburu greetings pass'),
  ('BATCH_SAQ_GREETINGS_2026_02_27_A', 2, 'saq', 'keja entama', 'An afternoon greeting in Samburu.', 'Good afternoon.', 'Habari ya mchana.', 'phrase', 'both', 'greetings', 'Samburu phrase references', 'reference-web', 'https://samburu.globalrecordings.net/en/program/C56252', 'Dedicated Samburu greetings pass'),
  ('BATCH_SAQ_GREETINGS_2026_02_27_A', 3, 'saq', 'keja enteipa', 'An evening greeting in Samburu.', 'Good evening.', 'Habari ya jioni.', 'phrase', 'both', 'greetings', 'Samburu phrase references', 'reference-web', 'https://samburu.globalrecordings.net/en/program/C56252', 'Dedicated Samburu greetings pass'),
  ('BATCH_SAQ_GREETINGS_2026_02_27_A', 4, 'saq', 'keja kewarie', 'A night blessing or late greeting.', 'Good night.', 'Usiku mwema.', 'phrase', 'both', 'courtesy', 'Samburu phrase references', 'reference-web', 'https://samburu.globalrecordings.net/en/program/C56252', 'Dedicated Samburu greetings pass'),
  ('BATCH_SAQ_GREETINGS_2026_02_27_A', 5, 'saq', 'ataa supat?', 'A common greeting asking how someone is.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Samburu phrase references', 'reference-web', 'https://samburu.globalrecordings.net/en/program/C56252', 'Dedicated Samburu greetings pass'),
  ('BATCH_SAQ_GREETINGS_2026_02_27_A', 6, 'saq', 'nanu supat', 'A response meaning the speaker is fine.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'greetings', 'Samburu phrase references', 'reference-web', 'https://samburu.globalrecordings.net/en/program/C56252', 'Dedicated Samburu greetings pass'),
  ('BATCH_SAQ_GREETINGS_2026_02_27_A', 7, 'saq', 'ashe oleng', 'A strong expression of gratitude.', 'Thank you very much.', 'Asante sana.', 'phrase', 'both', 'courtesy', 'Samburu phrase references', 'reference-web', 'https://samburu.globalrecordings.net/en/program/C56252', 'Dedicated Samburu greetings pass'),
  ('BATCH_SAQ_GREETINGS_2026_02_27_A', 8, 'saq', 'sidai', 'A positive response meaning all is well.', 'Fine.; Good.', 'Vizuri.; Nzuri.', 'phrase', 'both', 'greetings', 'Kamusi curated starter plus Samburu phrase references', 'reference-web', 'https://samburu.globalrecordings.net/en/program/C56252', 'Dedicated Samburu greetings pass'),
  ('BATCH_SAQ_GREETINGS_2026_02_27_A', 9, 'saq', 'oleng', 'A term intensifying thanks or goodwill.', 'very much', 'sana', 'adverb', 'both', 'courtesy', 'Kamusi curated starter plus Samburu phrase references', 'reference-web', 'https://samburu.globalrecordings.net/en/program/C56252', 'Dedicated Samburu greetings pass')
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
-- where batch_label = 'BATCH_SAQ_GREETINGS_2026_02_27_A'
-- group by batch_label, language_code;
