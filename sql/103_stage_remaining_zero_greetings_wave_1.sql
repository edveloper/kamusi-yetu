-- 103_stage_remaining_zero_greetings_wave_1.sql
-- Purpose:
-- Stage the first remaining zero-coverage greetings/courtesy wave after the
-- coastal and highland families.
--
-- Covered in this wave:
-- - dig (Digo)
-- - dug (Duruma)
-- - x-ke-pok (Pokomo)
-- - rra (Rabai)
-- - rel (Rendille)
-- - dav (Taita)
-- - tvs (Taveta)
-- - x-ke-trk (Turkana)
--
-- Notes:
-- - These rows are curated and review-heavy.
-- - Shared coastal and regional forms are explicitly marked as such.

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- dig (Digo)
  ('BATCH_DIG_GREETINGS_ZERO_W1_2026_02_27_A', 1, 'dig', 'Salama', 'A general coastal greeting.', 'Hello.', 'Habari.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy shared coastal form'),
  ('BATCH_DIG_GREETINGS_ZERO_W1_2026_02_27_A', 2, 'dig', 'Salama newo?', 'A coastal greeting asking if someone is well.', 'Hello, how are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy shared coastal form'),
  ('BATCH_DIG_GREETINGS_ZERO_W1_2026_02_27_A', 3, 'dig', 'Baha gi''embe', 'A coastal morning greeting.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy shared coastal form'),
  ('BATCH_DIG_GREETINGS_ZERO_W1_2026_02_27_A', 4, 'dig', 'Zomaja wao?', 'A greeting asking how someone is.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy shared coastal form'),
  ('BATCH_DIG_GREETINGS_ZERO_W1_2026_02_27_A', 5, 'dig', 'Ndu ebaa', 'A reply meaning the speaker is fine.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy shared coastal form'),
  ('BATCH_DIG_GREETINGS_ZERO_W1_2026_02_27_A', 6, 'dig', 'Nasanta', 'An expression of gratitude.', 'Thank you.', 'Asante.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy coastal form'),
  ('BATCH_DIG_GREETINGS_ZERO_W1_2026_02_27_A', 7, 'dig', 'Karibu', 'A welcoming phrase.', 'Welcome.', 'Karibu.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; shared welcome form'),
  ('BATCH_DIG_GREETINGS_ZERO_W1_2026_02_27_A', 8, 'dig', 'Kwaheri', 'A parting phrase used when saying goodbye.', 'Goodbye.', 'Kwaheri.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; shared parting form'),

  -- dug (Duruma)
  ('BATCH_DUG_GREETINGS_ZERO_W1_2026_02_27_A', 1, 'dug', 'Salama', 'A general coastal greeting.', 'Hello.', 'Habari.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy shared coastal form'),
  ('BATCH_DUG_GREETINGS_ZERO_W1_2026_02_27_A', 2, 'dug', 'Salama newo?', 'A coastal greeting asking if someone is well.', 'Hello, how are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy shared coastal form'),
  ('BATCH_DUG_GREETINGS_ZERO_W1_2026_02_27_A', 3, 'dug', 'Baha gi''embe', 'A coastal morning greeting.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy shared coastal form'),
  ('BATCH_DUG_GREETINGS_ZERO_W1_2026_02_27_A', 4, 'dug', 'Zomaja wao?', 'A greeting asking how someone is.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy shared coastal form'),
  ('BATCH_DUG_GREETINGS_ZERO_W1_2026_02_27_A', 5, 'dug', 'Ndu ebaa', 'A reply meaning the speaker is fine.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy shared coastal form'),
  ('BATCH_DUG_GREETINGS_ZERO_W1_2026_02_27_A', 6, 'dug', 'Nasanta', 'An expression of gratitude.', 'Thank you.', 'Asante.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy coastal form'),
  ('BATCH_DUG_GREETINGS_ZERO_W1_2026_02_27_A', 7, 'dug', 'Karibu', 'A welcoming phrase.', 'Welcome.', 'Karibu.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; shared welcome form'),
  ('BATCH_DUG_GREETINGS_ZERO_W1_2026_02_27_A', 8, 'dug', 'Kwaheri', 'A parting phrase used when saying goodbye.', 'Goodbye.', 'Kwaheri.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; shared parting form'),

  -- x-ke-pok (Pokomo)
  ('BATCH_POK_GREETINGS_ZERO_W1_2026_02_27_A', 1, 'x-ke-pok', 'Salama', 'A general greeting used in the lower Tana region.', 'Hello.', 'Habari.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy regional form'),
  ('BATCH_POK_GREETINGS_ZERO_W1_2026_02_27_A', 2, 'x-ke-pok', 'Salama newo?', 'A regional greeting asking if someone is well.', 'Hello, how are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy regional form'),
  ('BATCH_POK_GREETINGS_ZERO_W1_2026_02_27_A', 3, 'x-ke-pok', 'Baha gi''embe', 'A morning greeting.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy regional form'),
  ('BATCH_POK_GREETINGS_ZERO_W1_2026_02_27_A', 4, 'x-ke-pok', 'Zomaja wao?', 'A greeting asking how someone is.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy regional form'),
  ('BATCH_POK_GREETINGS_ZERO_W1_2026_02_27_A', 5, 'x-ke-pok', 'Ndu ebaa', 'A reply meaning the speaker is fine.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy regional form'),
  ('BATCH_POK_GREETINGS_ZERO_W1_2026_02_27_A', 6, 'x-ke-pok', 'Nasanta', 'An expression of gratitude.', 'Thank you.', 'Asante.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy regional form'),
  ('BATCH_POK_GREETINGS_ZERO_W1_2026_02_27_A', 7, 'x-ke-pok', 'Karibu', 'A welcoming phrase.', 'Welcome.', 'Karibu.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; shared welcome form'),
  ('BATCH_POK_GREETINGS_ZERO_W1_2026_02_27_A', 8, 'x-ke-pok', 'Kwaheri', 'A parting phrase used when saying goodbye.', 'Goodbye.', 'Kwaheri.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; shared parting form'),

  -- rra (Rabai)
  ('BATCH_RRA_GREETINGS_ZERO_W1_2026_02_27_A', 1, 'rra', 'Salama', 'A general coastal greeting.', 'Hello.', 'Habari.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy shared coastal form'),
  ('BATCH_RRA_GREETINGS_ZERO_W1_2026_02_27_A', 2, 'rra', 'Salama newo?', 'A coastal greeting asking if someone is well.', 'Hello, how are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy shared coastal form'),
  ('BATCH_RRA_GREETINGS_ZERO_W1_2026_02_27_A', 3, 'rra', 'Baha gi''embe', 'A coastal morning greeting.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy shared coastal form'),
  ('BATCH_RRA_GREETINGS_ZERO_W1_2026_02_27_A', 4, 'rra', 'Zomaja wao?', 'A greeting asking how someone is.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy shared coastal form'),
  ('BATCH_RRA_GREETINGS_ZERO_W1_2026_02_27_A', 5, 'rra', 'Ndu ebaa', 'A reply meaning the speaker is fine.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy shared coastal form'),
  ('BATCH_RRA_GREETINGS_ZERO_W1_2026_02_27_A', 6, 'rra', 'Nasanta', 'An expression of gratitude.', 'Thank you.', 'Asante.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy coastal form'),
  ('BATCH_RRA_GREETINGS_ZERO_W1_2026_02_27_A', 7, 'rra', 'Karibu', 'A welcoming phrase.', 'Welcome.', 'Karibu.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; shared welcome form'),
  ('BATCH_RRA_GREETINGS_ZERO_W1_2026_02_27_A', 8, 'rra', 'Kwaheri', 'A parting phrase used when saying goodbye.', 'Goodbye.', 'Kwaheri.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; shared parting form'),

  -- rel (Rendille)
  ('BATCH_REL_GREETINGS_ZERO_W1_2026_02_27_A', 1, 'rel', 'Salaan', 'A general greeting or salutation.', 'Hello.; Greetings.', 'Habari.; Salamu.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; Somali-aligned review-heavy form'),
  ('BATCH_REL_GREETINGS_ZERO_W1_2026_02_27_A', 2, 'rel', 'Subax wanaagsan', 'A morning greeting.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; Somali-aligned review-heavy form'),
  ('BATCH_REL_GREETINGS_ZERO_W1_2026_02_27_A', 3, 'rel', 'Galab wanaagsan', 'An afternoon greeting.', 'Good afternoon.', 'Habari ya mchana.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; Somali-aligned review-heavy form'),
  ('BATCH_REL_GREETINGS_ZERO_W1_2026_02_27_A', 4, 'rel', 'Iska warran?', 'A greeting asking how someone is doing.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; Somali-aligned review-heavy form'),
  ('BATCH_REL_GREETINGS_ZERO_W1_2026_02_27_A', 5, 'rel', 'Waan fiicanahay', 'A response meaning the speaker is fine.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; Somali-aligned review-heavy form'),
  ('BATCH_REL_GREETINGS_ZERO_W1_2026_02_27_A', 6, 'rel', 'Mahadsanid', 'An expression of gratitude.', 'Thank you.', 'Asante.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; Somali-aligned review-heavy form'),
  ('BATCH_REL_GREETINGS_ZERO_W1_2026_02_27_A', 7, 'rel', 'Nabad gelyo', 'A parting phrase wishing someone well.', 'Goodbye.', 'Kwaheri.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; Somali-aligned review-heavy form'),
  ('BATCH_REL_GREETINGS_ZERO_W1_2026_02_27_A', 8, 'rel', 'Fadlan', 'A polite word used when making a request.', 'Please.', 'Tafadhali.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; Somali-aligned review-heavy form'),

  -- dav (Taita)
  ('BATCH_DAV_GREETINGS_ZERO_W1_2026_02_27_A', 1, 'dav', 'Salama', 'A general greeting used in Taita-speaking areas.', 'Hello.', 'Habari.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy regional form'),
  ('BATCH_DAV_GREETINGS_ZERO_W1_2026_02_27_A', 2, 'dav', 'Baha gi''embe', 'A morning greeting.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy regional form'),
  ('BATCH_DAV_GREETINGS_ZERO_W1_2026_02_27_A', 3, 'dav', 'Zomaja wao?', 'A greeting asking how someone is.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy regional form'),
  ('BATCH_DAV_GREETINGS_ZERO_W1_2026_02_27_A', 4, 'dav', 'Ndu ebaa', 'A reply meaning the speaker is fine.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy regional form'),
  ('BATCH_DAV_GREETINGS_ZERO_W1_2026_02_27_A', 5, 'dav', 'Nasanta', 'An expression of gratitude.', 'Thank you.', 'Asante.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy regional form'),
  ('BATCH_DAV_GREETINGS_ZERO_W1_2026_02_27_A', 6, 'dav', 'Karibu', 'A welcoming phrase.', 'Welcome.', 'Karibu.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; shared welcome form'),
  ('BATCH_DAV_GREETINGS_ZERO_W1_2026_02_27_A', 7, 'dav', 'Samahani', 'A polite apology or way to get attention.', 'Sorry.; Excuse me.', 'Samahani.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; shared courtesy form'),
  ('BATCH_DAV_GREETINGS_ZERO_W1_2026_02_27_A', 8, 'dav', 'Kwaheri', 'A parting phrase used when saying goodbye.', 'Goodbye.', 'Kwaheri.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; shared parting form'),

  -- tvs (Taveta)
  ('BATCH_TVS_GREETINGS_ZERO_W1_2026_02_27_A', 1, 'tvs', 'Salama', 'A general greeting used in Taveta-speaking areas.', 'Hello.', 'Habari.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy regional form'),
  ('BATCH_TVS_GREETINGS_ZERO_W1_2026_02_27_A', 2, 'tvs', 'Baha gi''embe', 'A morning greeting.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy regional form'),
  ('BATCH_TVS_GREETINGS_ZERO_W1_2026_02_27_A', 3, 'tvs', 'Zomaja wao?', 'A greeting asking how someone is.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy regional form'),
  ('BATCH_TVS_GREETINGS_ZERO_W1_2026_02_27_A', 4, 'tvs', 'Ndu ebaa', 'A reply meaning the speaker is fine.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy regional form'),
  ('BATCH_TVS_GREETINGS_ZERO_W1_2026_02_27_A', 5, 'tvs', 'Nasanta', 'An expression of gratitude.', 'Thank you.', 'Asante.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; review-heavy regional form'),
  ('BATCH_TVS_GREETINGS_ZERO_W1_2026_02_27_A', 6, 'tvs', 'Karibu', 'A welcoming phrase.', 'Welcome.', 'Karibu.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; shared welcome form'),
  ('BATCH_TVS_GREETINGS_ZERO_W1_2026_02_27_A', 7, 'tvs', 'Samahani', 'A polite apology or way to get attention.', 'Sorry.; Excuse me.', 'Samahani.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; shared courtesy form'),
  ('BATCH_TVS_GREETINGS_ZERO_W1_2026_02_27_A', 8, 'tvs', 'Kwaheri', 'A parting phrase used when saying goodbye.', 'Goodbye.', 'Kwaheri.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; shared parting form'),

  -- x-ke-trk (Turkana)
  ('BATCH_TRK_GREETINGS_ZERO_W1_2026_02_27_A', 1, 'x-ke-trk', 'Ejoka', 'A positive greeting or response meaning all is well.', 'Hello.; Fine.', 'Habari.; Sawa.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; Turkana-aligned review-heavy form'),
  ('BATCH_TRK_GREETINGS_ZERO_W1_2026_02_27_A', 2, 'x-ke-trk', 'Ejoka noi', 'A stronger positive response meaning very well.', 'Very well.', 'Vizuri sana.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; Turkana-aligned review-heavy form'),
  ('BATCH_TRK_GREETINGS_ZERO_W1_2026_02_27_A', 3, 'x-ke-trk', 'Alekile?', 'A greeting asking how someone is.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; Turkana-aligned review-heavy form'),
  ('BATCH_TRK_GREETINGS_ZERO_W1_2026_02_27_A', 4, 'x-ke-trk', 'Ejok akuj', 'A morning greeting wishing goodness for the dawn.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; Turkana-aligned review-heavy form'),
  ('BATCH_TRK_GREETINGS_ZERO_W1_2026_02_27_A', 5, 'x-ke-trk', 'Ejok akolong', 'A daytime greeting wishing goodness for the day.', 'Good day.', 'Habari ya mchana.', 'phrase', 'both', 'greetings', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; Turkana-aligned review-heavy form'),
  ('BATCH_TRK_GREETINGS_ZERO_W1_2026_02_27_A', 6, 'x-ke-trk', 'Apwoyo', 'An expression of gratitude.', 'Thank you.', 'Asante.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; Turkana-aligned review-heavy form'),
  ('BATCH_TRK_GREETINGS_ZERO_W1_2026_02_27_A', 7, 'x-ke-trk', 'Kirei', 'A welcoming phrase.', 'Welcome.', 'Karibu.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; Turkana-aligned review-heavy form'),
  ('BATCH_TRK_GREETINGS_ZERO_W1_2026_02_27_A', 8, 'x-ke-trk', 'Kahilei', 'A parting phrase used when leaving someone.', 'Goodbye.', 'Kwaheri.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings Wave 1; Turkana-aligned review-heavy form')
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
