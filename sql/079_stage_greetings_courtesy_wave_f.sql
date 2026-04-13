-- 079_stage_greetings_courtesy_wave_f.sql
-- Purpose:
-- Stage the sixth greetings/courtesy wave to close the last small gaps in the
-- near-complete languages before moving to Samburu-specific work and the
-- zero-coverage languages.
--
-- Covered in this wave:
-- - sgc (Kipsigis)
-- - mas (Maasai / Maa)
-- - orc (Orma, Oromo-aligned)
-- - spy (Sabaot)
-- - x-sheng (Sheng)

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- sgc (Kipsigis)
  ('BATCH_SGC_GREETINGS_WAVE_F_2026_02_27_A', 1, 'sgc', 'Mising', 'A greeting used in the afternoon.', 'Good afternoon.', 'Habari ya mchana.', 'phrase', 'both', 'greetings', 'Common Kipsigis words and their meaning', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-kalenjin-words-and-their-meaning', 'Greetings/courtesy Wave F'),

  -- mas (Maasai / Maa)
  ('BATCH_MAS_GREETINGS_WAVE_F_2026_02_27_A', 1, 'mas', 'Dupa', 'An apology or polite way to get attention.', 'Sorry.; Excuse me.', 'Samahani.', 'phrase', 'both', 'courtesy', 'Learn Maasai: Common phrases and their meaning', 'reference-web', 'https://lughayangu.com/post/learn-maasai-common-maasai-phrases-and-their-meaning', 'Greetings/courtesy Wave F'),

  -- orc (Orma, Oromo-aligned)
  ('BATCH_ORC_GREETINGS_WAVE_F_2026_02_27_A', 1, 'orc', 'Akkam jirtu?', 'A respectful plural or formal greeting asking how others are.', 'How are you all?', 'Hamjambo nyote?', 'phrase', 'both', 'greetings', 'Useful phrases in Oromo', 'reference-web', 'https://www.omniglot.com/language/phrases/oromo.htm', 'Greetings/courtesy Wave F; Oromo-aligned'),

  -- spy (Sabaot)
  ('BATCH_SPY_GREETINGS_WAVE_F_2026_02_27_A', 1, 'spy', 'Chemetet', 'A general greeting used to say hello.', 'Hello.', 'Habari.', 'phrase', 'both', 'greetings', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/chemetet', 'Greetings/courtesy Wave F'),
  ('BATCH_SPY_GREETINGS_WAVE_F_2026_02_27_A', 2, 'spy', 'Myee', 'A phrase of gratitude used in everyday speech.', 'Thanks.', 'Asante.', 'phrase', 'both', 'courtesy', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/myee', 'Greetings/courtesy Wave F'),
  ('BATCH_SPY_GREETINGS_WAVE_F_2026_02_27_A', 3, 'spy', 'Chitaabkoret', 'An apology or polite expression of regret.', 'Sorry.', 'Samahani.', 'phrase', 'both', 'courtesy', 'Lughayangu Sabaot dictionary', 'reference-web', 'https://lughayangu.com/sabaot/chitaabkoret', 'Greetings/courtesy Wave F'),

  -- x-sheng (Sheng)
  ('BATCH_SHENG_GREETINGS_WAVE_F_2026_02_27_A', 1, 'x-sheng', 'vipi?', 'A common street greeting in Kenyan urban speech.', 'What''s up?; How are things?', 'Vipi?; Mambo vipi?', 'phrase', 'informal', 'greetings', 'A Tourist''s Guide to Kenyan Slang, Sayings, and Street Lingo', 'reference-web', 'https://visitkenyaguide.com/speak-like-a-local-kenyan-slang-and-phrases-for-tourists/', 'Greetings/courtesy Wave F; review-heavy slang'),
  ('BATCH_SHENG_GREETINGS_WAVE_F_2026_02_27_A', 2, 'x-sheng', 'freshi', 'A casual positive reaction or response in Sheng.', 'Fine.; Cool.', 'Poa.; Sawa.', 'phrase', 'informal', 'greetings', 'A Tourist''s Guide to Kenyan Slang, Sayings, and Street Lingo', 'reference-web', 'https://visitkenyaguide.com/speak-like-a-local-kenyan-slang-and-phrases-for-tourists/', 'Greetings/courtesy Wave F; review-heavy slang'),
  ('BATCH_SHENG_GREETINGS_WAVE_F_2026_02_27_A', 3, 'x-sheng', 'shwari', 'A calm, positive response in everyday urban speech.', 'Okay.; All good.', 'Sawa.; Niko sawa.', 'phrase', 'informal', 'courtesy', 'A Tourist''s Guide to Kenyan Slang, Sayings, and Street Lingo', 'reference-web', 'https://visitkenyaguide.com/speak-like-a-local-kenyan-slang-and-phrases-for-tourists/', 'Greetings/courtesy Wave F; review-heavy slang')
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
--   'BATCH_SGC_GREETINGS_WAVE_F_2026_02_27_A',
--   'BATCH_MAS_GREETINGS_WAVE_F_2026_02_27_A',
--   'BATCH_ORC_GREETINGS_WAVE_F_2026_02_27_A',
--   'BATCH_SPY_GREETINGS_WAVE_F_2026_02_27_A',
--   'BATCH_SHENG_GREETINGS_WAVE_F_2026_02_27_A'
-- )
-- group by batch_label, language_code
-- order by batch_label;
