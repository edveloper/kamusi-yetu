-- 091_stage_coastal_greetings_wave_1.sql
-- Purpose:
-- Stage the first remaining coastal greetings/courtesy wave for languages still
-- at zero after the broader rollout.
--
-- Covered in this wave:
-- - nyf (Giriama)
-- - coh (Chonyi)
--
-- Notes:
-- - Giriama rows are sourced directly from greeting references.
-- - Chonyi rows combine direct etiquette references with clearly marked
--   Mijikenda coastal shared forms and should be treated as review-heavy.

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- nyf (Giriama)
  ('BATCH_NYF_GREETINGS_COASTAL_W1_2026_02_27_A', 1, 'nyf', 'Salama', 'A formal general greeting in Giriama.', 'Hello.', 'Habari.', 'phrase', 'both', 'greetings', 'Giriama greeting references', 'reference-web', 'https://howtosayguide.com/how-to-say-hello-in-giriama/', 'Coastal greetings Wave 1'),
  ('BATCH_NYF_GREETINGS_COASTAL_W1_2026_02_27_A', 2, 'nyf', 'Salama newo?', 'A formal greeting asking if someone is well.', 'Hello, how are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Giriama greeting references', 'reference-web', 'https://howtosayguide.com/how-to-say-hello-in-giriama/', 'Coastal greetings Wave 1'),
  ('BATCH_NYF_GREETINGS_COASTAL_W1_2026_02_27_A', 3, 'nyf', 'Baha gi''embe', 'A formal morning greeting in Giriama.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Giriama morning greeting references', 'reference-web', 'https://howtosayguide.com/how-to-say-good-morning-in-giriama/', 'Coastal greetings Wave 1'),
  ('BATCH_NYF_GREETINGS_COASTAL_W1_2026_02_27_A', 4, 'nyf', 'Mbaa ki''naa', 'An informal morning greeting in Giriama.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Giriama morning greeting references', 'reference-web', 'https://howtosayguide.com/how-to-say-good-morning-in-giriama/', 'Coastal greetings Wave 1'),
  ('BATCH_NYF_GREETINGS_COASTAL_W1_2026_02_27_A', 5, 'nyf', 'Zomaja wao?', 'A formal way to ask how someone is.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Giriama greeting references', 'reference-web', 'https://howtosayguide.com/how-to-say-how-are-you-in-giriama/', 'Coastal greetings Wave 1'),
  ('BATCH_NYF_GREETINGS_COASTAL_W1_2026_02_27_A', 6, 'nyf', 'Jomaja waa?', 'An informal way to ask how someone is.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Giriama greeting references', 'reference-web', 'https://howtosayguide.com/how-to-say-how-are-you-in-giriama/', 'Coastal greetings Wave 1'),
  ('BATCH_NYF_GREETINGS_COASTAL_W1_2026_02_27_A', 7, 'nyf', 'Ndu ebaa', 'A reply meaning the speaker is fine.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'greetings', 'Giriama greeting references', 'reference-web', 'https://howtosayguide.com/how-to-say-how-are-you-in-giriama/', 'Coastal greetings Wave 1'),
  ('BATCH_NYF_GREETINGS_COASTAL_W1_2026_02_27_A', 8, 'nyf', 'Kwaheri', 'A parting expression used when saying goodbye.', 'Goodbye.', 'Kwaheri.', 'phrase', 'both', 'courtesy', 'Giriama greeting references', 'reference-web', 'https://howtosayguide.com/how-to-say-how-are-you-in-giriama/', 'Coastal greetings Wave 1; Swahili-shared coastal usage'),

  -- coh (Chonyi)
  ('BATCH_COH_GREETINGS_COASTAL_W1_2026_02_27_A', 1, 'coh', 'Ulamkadze?', 'A morning greeting literally asking how one woke up.', 'Good morning.; How did you wake up?', 'Habari ya asubuhi.; Umeamkaje?', 'phrase', 'both', 'greetings', 'Chonyi etiquette references', 'reference-web', 'https://en.wikipedia.org/wiki/Chonyi_language', 'Coastal greetings Wave 1'),
  ('BATCH_COH_GREETINGS_COASTAL_W1_2026_02_27_A', 2, 'coh', 'Usindadze?', 'An afternoon or day-progress greeting asking how the day has gone.', 'Good afternoon.; How has your day been?', 'Habari ya mchana.; Umeshindaje?', 'phrase', 'both', 'greetings', 'Chonyi etiquette references', 'reference-web', 'https://en.wikipedia.org/wiki/Chonyi_language', 'Coastal greetings Wave 1'),
  ('BATCH_COH_GREETINGS_COASTAL_W1_2026_02_27_A', 3, 'coh', 'Nasanta', 'An expression of gratitude in Chonyi.', 'Thank you.', 'Asante.', 'phrase', 'both', 'courtesy', 'Chonyi etiquette references', 'reference-web', 'https://en.wikipedia.org/wiki/Chonyi_language', 'Coastal greetings Wave 1'),
  ('BATCH_COH_GREETINGS_COASTAL_W1_2026_02_27_A', 4, 'coh', 'Salama', 'A general coastal greeting used in Mijikenda speech communities.', 'Hello.', 'Habari.', 'phrase', 'both', 'greetings', 'Mijikenda coastal shared greeting references', 'reference-web', 'https://howtosayguide.com/how-to-say-hello-in-giriama/', 'Coastal greetings Wave 1; review-heavy shared coastal form'),
  ('BATCH_COH_GREETINGS_COASTAL_W1_2026_02_27_A', 5, 'coh', 'Salama newo?', 'A shared coastal greeting asking if someone is well.', 'Hello, how are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Mijikenda coastal shared greeting references', 'reference-web', 'https://howtosayguide.com/how-to-say-hello-in-giriama/', 'Coastal greetings Wave 1; review-heavy shared coastal form'),
  ('BATCH_COH_GREETINGS_COASTAL_W1_2026_02_27_A', 6, 'coh', 'Karibu', 'A welcoming phrase widely used in coastal speech.', 'Welcome.', 'Karibu.', 'phrase', 'both', 'courtesy', 'Mijikenda coastal shared greeting references', 'reference-web', 'https://mijikenda.co.ke/about-us/', 'Coastal greetings Wave 1; review-heavy shared coastal form'),
  ('BATCH_COH_GREETINGS_COASTAL_W1_2026_02_27_A', 7, 'coh', 'Samahani', 'A polite apology or way to get attention in coastal speech.', 'Sorry.; Excuse me.', 'Samahani.', 'phrase', 'both', 'courtesy', 'Mijikenda coastal shared greeting references', 'reference-web', 'https://mijikenda.co.ke/about-us/', 'Coastal greetings Wave 1; review-heavy shared coastal form'),
  ('BATCH_COH_GREETINGS_COASTAL_W1_2026_02_27_A', 8, 'coh', 'Kwaheri', 'A parting expression used when saying goodbye.', 'Goodbye.', 'Kwaheri.', 'phrase', 'both', 'courtesy', 'Mijikenda coastal shared greeting references', 'reference-web', 'https://mijikenda.co.ke/about-us/', 'Coastal greetings Wave 1; review-heavy shared coastal form')
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
--   'BATCH_NYF_GREETINGS_COASTAL_W1_2026_02_27_A',
--   'BATCH_COH_GREETINGS_COASTAL_W1_2026_02_27_A'
-- )
-- group by batch_label, language_code
-- order by batch_label;
