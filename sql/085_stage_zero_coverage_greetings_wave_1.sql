-- 085_stage_zero_coverage_greetings_wave_1.sql
-- Purpose:
-- Stage the first zero-coverage greetings/courtesy wave for live languages that
-- still have no greetings entries after the stronger-language rollout.
--
-- Covered in this wave:
-- - som (Somali)
-- - orm (Borana Oromo)
-- - x-ke-hin (Kenyan Hindustani)
--
-- Notes:
-- - This wave stays narrow on purpose.
-- - Oromo rows are Oromo-aligned and should be reviewed for Borana-specific
--   precision.

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- som (Somali)
  ('BATCH_SOM_GREETINGS_ZERO_W1_2026_02_27_A', 1, 'som', 'Salaan', 'A general greeting or salutation.', 'Hello.; Greetings.', 'Habari.; Salamu.', 'phrase', 'both', 'greetings', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1'),
  ('BATCH_SOM_GREETINGS_ZERO_W1_2026_02_27_A', 2, 'som', 'Subax wanaagsan', 'A morning greeting in Somali.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1'),
  ('BATCH_SOM_GREETINGS_ZERO_W1_2026_02_27_A', 3, 'som', 'Galab wanaagsan', 'An afternoon greeting in Somali.', 'Good afternoon.', 'Habari ya mchana.', 'phrase', 'both', 'greetings', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1'),
  ('BATCH_SOM_GREETINGS_ZERO_W1_2026_02_27_A', 4, 'som', 'Fiid wanaagsan', 'An evening greeting in Somali.', 'Good evening.', 'Habari ya jioni.', 'phrase', 'both', 'greetings', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1'),
  ('BATCH_SOM_GREETINGS_ZERO_W1_2026_02_27_A', 5, 'som', 'Habeen wanaagsan', 'A night farewell or blessing.', 'Good night.', 'Usiku mwema.', 'phrase', 'both', 'courtesy', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1'),
  ('BATCH_SOM_GREETINGS_ZERO_W1_2026_02_27_A', 6, 'som', 'Iska warran?', 'A common greeting asking how someone is doing.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1'),
  ('BATCH_SOM_GREETINGS_ZERO_W1_2026_02_27_A', 7, 'som', 'Waan fiicanahay', 'A response meaning the speaker is fine.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'greetings', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1'),
  ('BATCH_SOM_GREETINGS_ZERO_W1_2026_02_27_A', 8, 'som', 'Mahadsanid', 'An expression of gratitude.', 'Thank you.', 'Asante.', 'phrase', 'both', 'courtesy', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1'),

  -- orm (Borana Oromo / Oromo-aligned)
  ('BATCH_ORM_GREETINGS_ZERO_W1_2026_02_27_A', 1, 'orm', 'Akkam?', 'A common Oromo greeting asking how someone is.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1; Oromo-aligned, Borana review needed'),
  ('BATCH_ORM_GREETINGS_ZERO_W1_2026_02_27_A', 2, 'orm', 'Akkam jirta?', 'An informal singular greeting asking how someone is.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1; Oromo-aligned, Borana review needed'),
  ('BATCH_ORM_GREETINGS_ZERO_W1_2026_02_27_A', 3, 'orm', 'Akkam jirtu?', 'A respectful or plural greeting asking how others are.', 'How are you all?', 'Hamjambo nyote?', 'phrase', 'both', 'greetings', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1; Oromo-aligned, Borana review needed'),
  ('BATCH_ORM_GREETINGS_ZERO_W1_2026_02_27_A', 4, 'orm', 'Nagaa', 'A response meaning peace or that one is fine.', 'Fine.; Peace.', 'Sawa.; Amani.', 'phrase', 'both', 'greetings', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1; Oromo-aligned, Borana review needed'),
  ('BATCH_ORM_GREETINGS_ZERO_W1_2026_02_27_A', 5, 'orm', 'Galatoomi', 'An expression of gratitude.', 'Thank you.', 'Asante.', 'phrase', 'both', 'courtesy', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1; Oromo-aligned, Borana review needed'),
  ('BATCH_ORM_GREETINGS_ZERO_W1_2026_02_27_A', 6, 'orm', 'Akkam bulte?', 'A greeting used in the morning.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1; Oromo-aligned, Borana review needed'),
  ('BATCH_ORM_GREETINGS_ZERO_W1_2026_02_27_A', 7, 'orm', 'Nagaa buli', 'A night farewell or blessing.', 'Good night.', 'Usiku mwema.', 'phrase', 'both', 'courtesy', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1; Oromo-aligned, Borana review needed'),
  ('BATCH_ORM_GREETINGS_ZERO_W1_2026_02_27_A', 8, 'orm', 'Baga nagaan dhuftan', 'A welcoming phrase used when receiving someone.', 'Welcome.', 'Karibu.', 'phrase', 'both', 'courtesy', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1; Oromo-aligned, Borana review needed'),

  -- x-ke-hin (Kenyan Hindustani)
  ('BATCH_HIN_GREETINGS_ZERO_W1_2026_02_27_A', 1, 'x-ke-hin', 'namaste', 'A respectful greeting used when meeting someone.', 'Hello.; Greetings.', 'Habari.; Salamu.', 'phrase', 'both', 'greetings', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1'),
  ('BATCH_HIN_GREETINGS_ZERO_W1_2026_02_27_A', 2, 'x-ke-hin', 'shukriya', 'A common expression of gratitude.', 'Thank you.', 'Asante.', 'phrase', 'both', 'courtesy', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1'),
  ('BATCH_HIN_GREETINGS_ZERO_W1_2026_02_27_A', 3, 'x-ke-hin', 'dhanyavaad', 'A formal expression of gratitude.', 'Thank you.', 'Asante.', 'phrase', 'both', 'courtesy', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1'),
  ('BATCH_HIN_GREETINGS_ZERO_W1_2026_02_27_A', 4, 'x-ke-hin', 'aap kaise ho?', 'A common greeting asking how someone is doing.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1'),
  ('BATCH_HIN_GREETINGS_ZERO_W1_2026_02_27_A', 5, 'x-ke-hin', 'main theek hoon', 'A response meaning the speaker is fine.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'greetings', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1'),
  ('BATCH_HIN_GREETINGS_ZERO_W1_2026_02_27_A', 6, 'x-ke-hin', 'shubh prabhat', 'A morning greeting.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1'),
  ('BATCH_HIN_GREETINGS_ZERO_W1_2026_02_27_A', 7, 'x-ke-hin', 'shubh raatri', 'A night farewell or blessing.', 'Good night.', 'Usiku mwema.', 'phrase', 'both', 'courtesy', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1'),
  ('BATCH_HIN_GREETINGS_ZERO_W1_2026_02_27_A', 8, 'x-ke-hin', 'phir milenge', 'A parting phrase meaning one will meet again.', 'See you later.', 'Tutaonana baadaye.', 'phrase', 'both', 'courtesy', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1'),
  ('BATCH_HIN_GREETINGS_ZERO_W1_2026_02_27_A', 9, 'x-ke-hin', 'maaf kijiye', 'A polite apology or way to get attention.', 'Sorry.; Excuse me.', 'Samahani.', 'phrase', 'both', 'courtesy', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1'),
  ('BATCH_HIN_GREETINGS_ZERO_W1_2026_02_27_A', 10, 'x-ke-hin', 'swagat hai', 'A welcoming phrase used when receiving someone.', 'Welcome.', 'Karibu.', 'phrase', 'both', 'courtesy', 'Kamusi curated greetings pass', 'internal', null, 'Zero-coverage greetings Wave 1')
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
--   'BATCH_SOM_GREETINGS_ZERO_W1_2026_02_27_A',
--   'BATCH_ORM_GREETINGS_ZERO_W1_2026_02_27_A',
--   'BATCH_HIN_GREETINGS_ZERO_W1_2026_02_27_A'
-- )
-- group by batch_label, language_code
-- order by batch_label;
