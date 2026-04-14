-- 097_stage_highland_greetings_wave_1.sql
-- Purpose:
-- Stage the first eastern highland greetings/courtesy wave for live languages
-- that still sit at zero after the broader rollout.
--
-- Covered in this wave:
-- - ebu (Embu)
-- - mer (Meru)
-- - guz (Gusii)
-- - x-ke-kur (Kuria)
--
-- Notes:
-- - These rows are curated from neighboring Bantu greeting patterns and should
--   be treated as review-heavy until native verification.

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- ebu (Embu)
  ('BATCH_EBU_GREETINGS_HIGHLAND_W1_2026_02_27_A', 1, 'ebu', 'Wega', 'A general positive greeting or response.', 'Hello.; Fine.', 'Habari.; Sawa.', 'phrase', 'both', 'greetings', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_EBU_GREETINGS_HIGHLAND_W1_2026_02_27_A', 2, 'ebu', 'Wega mwaramuka', 'A morning greeting in Embu.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_EBU_GREETINGS_HIGHLAND_W1_2026_02_27_A', 3, 'ebu', 'Ukarire ata?', 'A greeting asking how someone spent the night.', 'How did you sleep?', 'Umeamkaje?', 'phrase', 'both', 'greetings', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_EBU_GREETINGS_HIGHLAND_W1_2026_02_27_A', 4, 'ebu', 'Ndiri wega', 'A reply meaning the speaker is fine.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'greetings', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_EBU_GREETINGS_HIGHLAND_W1_2026_02_27_A', 5, 'ebu', 'Ningukena', 'An expression of thanks.', 'Thank you.', 'Asante.', 'phrase', 'both', 'courtesy', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_EBU_GREETINGS_HIGHLAND_W1_2026_02_27_A', 6, 'ebu', 'Tawetha', 'A welcoming phrase.', 'Welcome.', 'Karibu.', 'phrase', 'both', 'courtesy', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_EBU_GREETINGS_HIGHLAND_W1_2026_02_27_A', 7, 'ebu', 'Ndugakone nyuma', 'A parting phrase meaning one will meet later.', 'See you later.', 'Tutaonana baadaye.', 'phrase', 'both', 'courtesy', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_EBU_GREETINGS_HIGHLAND_W1_2026_02_27_A', 8, 'ebu', 'Thaayu', 'A calm positive response meaning peace or wellness.', 'Peace.; All is well.', 'Amani.; Yote sawa.', 'phrase', 'both', 'greetings', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),

  -- mer (Meru)
  ('BATCH_MER_GREETINGS_HIGHLAND_W1_2026_02_27_A', 1, 'mer', 'Wega', 'A general positive greeting or response.', 'Hello.; Fine.', 'Habari.; Sawa.', 'phrase', 'both', 'greetings', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_MER_GREETINGS_HIGHLAND_W1_2026_02_27_A', 2, 'mer', 'Wega mwaramuka', 'A morning greeting in Meru.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_MER_GREETINGS_HIGHLAND_W1_2026_02_27_A', 3, 'mer', 'Ukarire atia?', 'A greeting asking how someone spent the night.', 'How did you sleep?', 'Umeamkaje?', 'phrase', 'both', 'greetings', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_MER_GREETINGS_HIGHLAND_W1_2026_02_27_A', 4, 'mer', 'Ndiri wega', 'A reply meaning the speaker is fine.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'greetings', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_MER_GREETINGS_HIGHLAND_W1_2026_02_27_A', 5, 'mer', 'Ningukena', 'An expression of thanks.', 'Thank you.', 'Asante.', 'phrase', 'both', 'courtesy', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_MER_GREETINGS_HIGHLAND_W1_2026_02_27_A', 6, 'mer', 'Tawetha', 'A welcoming phrase.', 'Welcome.', 'Karibu.', 'phrase', 'both', 'courtesy', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_MER_GREETINGS_HIGHLAND_W1_2026_02_27_A', 7, 'mer', 'Ndugakone nyuma', 'A parting phrase meaning one will meet later.', 'See you later.', 'Tutaonana baadaye.', 'phrase', 'both', 'courtesy', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_MER_GREETINGS_HIGHLAND_W1_2026_02_27_A', 8, 'mer', 'Thaayu', 'A calm positive response meaning peace or wellness.', 'Peace.; All is well.', 'Amani.; Yote sawa.', 'phrase', 'both', 'greetings', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),

  -- guz (Gusii)
  ('BATCH_GUZ_GREETINGS_HIGHLAND_W1_2026_02_27_A', 1, 'guz', 'Bwanchire', 'A greeting asking how someone woke or how the day began.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_GUZ_GREETINGS_HIGHLAND_W1_2026_02_27_A', 2, 'guz', 'Mwane bwaboke?', 'A greeting asking how someone is doing.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_GUZ_GREETINGS_HIGHLAND_W1_2026_02_27_A', 3, 'guz', 'Nare bwaboke', 'A reply meaning the speaker is well.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'greetings', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_GUZ_GREETINGS_HIGHLAND_W1_2026_02_27_A', 4, 'guz', 'Bwakire', 'A welcoming phrase.', 'Welcome.', 'Karibu.', 'phrase', 'both', 'courtesy', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_GUZ_GREETINGS_HIGHLAND_W1_2026_02_27_A', 5, 'guz', 'Nasanta mono', 'A strong expression of gratitude.', 'Thank you very much.', 'Asante sana.', 'phrase', 'both', 'courtesy', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_GUZ_GREETINGS_HIGHLAND_W1_2026_02_27_A', 6, 'guz', 'Rigererio', 'A parting expression used when saying goodbye.', 'Goodbye.', 'Kwaheri.', 'phrase', 'both', 'courtesy', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_GUZ_GREETINGS_HIGHLAND_W1_2026_02_27_A', 7, 'guz', 'Mbuya', 'A positive response meaning good or fine.', 'Good.; Fine.', 'Nzuri.; Sawa.', 'phrase', 'both', 'greetings', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_GUZ_GREETINGS_HIGHLAND_W1_2026_02_27_A', 8, 'guz', 'Mbuya mono', 'A stronger positive response meaning very good.', 'Very good.', 'Vizuri sana.', 'phrase', 'both', 'greetings', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),

  -- x-ke-kur (Kuria)
  ('BATCH_KUR_GREETINGS_HIGHLAND_W1_2026_02_27_A', 1, 'x-ke-kur', 'Bwanchire', 'A greeting asking how someone woke or how the day began.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_KUR_GREETINGS_HIGHLAND_W1_2026_02_27_A', 2, 'x-ke-kur', 'Mwane bwaboke?', 'A greeting asking how someone is doing.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_KUR_GREETINGS_HIGHLAND_W1_2026_02_27_A', 3, 'x-ke-kur', 'Nare bwaboke', 'A reply meaning the speaker is well.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'greetings', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_KUR_GREETINGS_HIGHLAND_W1_2026_02_27_A', 4, 'x-ke-kur', 'Bwakire', 'A welcoming phrase.', 'Welcome.', 'Karibu.', 'phrase', 'both', 'courtesy', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_KUR_GREETINGS_HIGHLAND_W1_2026_02_27_A', 5, 'x-ke-kur', 'Nasanta mono', 'A strong expression of gratitude.', 'Thank you very much.', 'Asante sana.', 'phrase', 'both', 'courtesy', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_KUR_GREETINGS_HIGHLAND_W1_2026_02_27_A', 6, 'x-ke-kur', 'Rigererio', 'A parting expression used when saying goodbye.', 'Goodbye.', 'Kwaheri.', 'phrase', 'both', 'courtesy', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_KUR_GREETINGS_HIGHLAND_W1_2026_02_27_A', 7, 'x-ke-kur', 'Mbuya', 'A positive response meaning good or fine.', 'Good.; Fine.', 'Nzuri.; Sawa.', 'phrase', 'both', 'greetings', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy'),
  ('BATCH_KUR_GREETINGS_HIGHLAND_W1_2026_02_27_A', 8, 'x-ke-kur', 'Mbuya mono', 'A stronger positive response meaning very good.', 'Very good.', 'Vizuri sana.', 'phrase', 'both', 'greetings', 'Kamusi curated highland greetings pass', 'internal', null, 'Highland greetings Wave 1; review-heavy')
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
--   'BATCH_EBU_GREETINGS_HIGHLAND_W1_2026_02_27_A',
--   'BATCH_MER_GREETINGS_HIGHLAND_W1_2026_02_27_A',
--   'BATCH_GUZ_GREETINGS_HIGHLAND_W1_2026_02_27_A',
--   'BATCH_KUR_GREETINGS_HIGHLAND_W1_2026_02_27_A'
-- )
-- group by batch_label, language_code
-- order by batch_label;
