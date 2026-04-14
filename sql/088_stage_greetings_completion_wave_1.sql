-- 088_stage_greetings_completion_wave_1.sql
-- Purpose:
-- Close the near-threshold greetings/courtesy gap for the languages that are
-- already close to the 10-entry floor after the first zero-coverage wave.
--
-- Covered in this wave:
-- - saq (Samburu)
-- - orm (Borana Oromo)
-- - som (Somali)
-- - x-ke-hin (Kenyan Hindustani)
--
-- Notes:
-- - Oromo rows remain Oromo-aligned and should be reviewed for Borana-specific
--   precision.

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- saq (Samburu)
  ('BATCH_SAQ_GREETINGS_COMPLETION_W1_2026_02_27_A', 1, 'saq', 'Baga', 'A welcoming expression used when receiving someone.', 'Welcome.', 'Karibu.', 'phrase', 'both', 'courtesy', 'Samburu phrase references', 'reference-web', 'https://samburu.globalrecordings.net/en/program/C56252', 'Greetings completion Wave 1'),
  ('BATCH_SAQ_GREETINGS_COMPLETION_W1_2026_02_27_A', 2, 'saq', 'Dupa', 'A polite apology or way to get attention.', 'Sorry.; Excuse me.', 'Samahani.', 'phrase', 'both', 'courtesy', 'Samburu phrase references', 'reference-web', 'https://samburu.globalrecordings.net/en/program/C56252', 'Greetings completion Wave 1'),

  -- orm (Borana Oromo / Oromo-aligned)
  ('BATCH_ORM_GREETINGS_COMPLETION_W1_2026_02_27_A', 1, 'orm', 'Akkam ooltan?', 'A greeting asking how a group is doing.', 'How are you all?', 'Hamjambo nyote?', 'phrase', 'both', 'greetings', 'Useful phrases in Oromo', 'reference-web', 'https://www.omniglot.com/language/phrases/oromo.htm', 'Greetings completion Wave 1; Oromo-aligned, Borana review needed'),
  ('BATCH_ORM_GREETINGS_COMPLETION_W1_2026_02_27_A', 2, 'orm', 'Maaloo', 'A polite word used when requesting something.', 'Please.', 'Tafadhali.', 'phrase', 'both', 'courtesy', 'Useful phrases in Oromo', 'reference-web', 'https://www.omniglot.com/language/phrases/oromo.htm', 'Greetings completion Wave 1; Oromo-aligned, Borana review needed'),

  -- som (Somali)
  ('BATCH_SOM_GREETINGS_COMPLETION_W1_2026_02_27_A', 1, 'som', 'Fadlan', 'A polite word used when making a request.', 'Please.', 'Tafadhali.', 'phrase', 'both', 'courtesy', 'Useful phrases in Somali', 'reference-web', 'https://www.omniglot.com/language/phrases/somali.php', 'Greetings completion Wave 1'),
  ('BATCH_SOM_GREETINGS_COMPLETION_W1_2026_02_27_A', 2, 'som', 'Nabad gelyo', 'A parting phrase wishing someone well.', 'Goodbye.', 'Kwaheri.', 'phrase', 'both', 'courtesy', 'Useful phrases in Somali', 'reference-web', 'https://www.omniglot.com/language/phrases/somali.php', 'Greetings completion Wave 1'),

  -- x-ke-hin (Kenyan Hindustani)
  ('BATCH_HIN_GREETINGS_COMPLETION_W1_2026_02_27_A', 1, 'x-ke-hin', 'kripaya', 'A polite word used when requesting something.', 'Please.', 'Tafadhali.', 'phrase', 'both', 'courtesy', 'Useful phrases in Hindi', 'reference-web', 'https://www.omniglot.com/language/phrases/hindi.php', 'Greetings completion Wave 1'),
  ('BATCH_HIN_GREETINGS_COMPLETION_W1_2026_02_27_A', 2, 'x-ke-hin', 'alvida', 'A parting phrase used when saying goodbye.', 'Goodbye.', 'Kwaheri.', 'phrase', 'both', 'courtesy', 'Useful phrases in Hindi', 'reference-web', 'https://www.omniglot.com/language/phrases/hindi.php', 'Greetings completion Wave 1')
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
--   'BATCH_SAQ_GREETINGS_COMPLETION_W1_2026_02_27_A',
--   'BATCH_ORM_GREETINGS_COMPLETION_W1_2026_02_27_A',
--   'BATCH_SOM_GREETINGS_COMPLETION_W1_2026_02_27_A',
--   'BATCH_HIN_GREETINGS_COMPLETION_W1_2026_02_27_A'
-- )
-- group by batch_label, language_code
-- order by batch_label;
