-- 073_stage_greetings_courtesy_wave_d.sql
-- Purpose:
-- Stage the fourth greetings/courtesy wave.
--
-- This wave has two jobs:
-- 1) push a few near-threshold languages over the 10-entry floor
-- 2) start filling sparse but sourceable live languages instead of leaving them untouched
--
-- Covered in this wave:
-- - bxk (Bukusu)
-- - lto (Olutsotso)
-- - sxb (Suba / Olusuba)
-- - orc (Orma, Oromo-aligned)
-- - mas (Maasai / Maa)
-- - x-sheng (Sheng)
--
-- Notes:
-- - `niq`, `spy`, `saq`, and the zero-coverage set still need a follow-up pass.
-- - `x-sheng` is sourced from current public Kenya slang references and should
--   be treated as fast-changing, review-heavy language data.

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- bxk (Bukusu)
  ('BATCH_BXK_GREETINGS_WAVE_D_2026_02_27_A', 1, 'bxk', 'Mang''ende?', 'An informal Bukusu morning greeting asking how someone woke up.', 'Good morning.; How did you wake?', 'Habari ya asubuhi.; Umeamkaje?', 'phrase', 'both', 'greetings', 'How to Say Good Morning in Bukusu', 'reference-web', 'https://howtosayguide.com/how-to-say-good-morning-in-bukusu/', 'Greetings/courtesy Wave D'),

  -- lto (Olutsotso)
  ('BATCH_LTO_GREETINGS_WAVE_D_2026_02_27_A', 1, 'lto', 'Vushiere/keshitere/bwire', 'A combined greeting string covering morning, afternoon, evening, and night usage.', 'Good morning.; Good afternoon.; Good evening.; Good night.', 'Habari ya asubuhi.; Habari ya mchana.; Habari ya jioni.; Usiku mwema.', 'phrase', 'both', 'greetings', 'Olutsotso dictionary entry', 'reference-web', 'https://lughayangu.com/olutsotso/vushierekeshiterebwire', 'Greetings/courtesy Wave D'),

  -- sxb (Suba / Olusuba)
  ('BATCH_SXB_GREETINGS_WAVE_D_2026_02_27_A', 1, 'sxb', 'Tuwonane lunyima', 'A later-time farewell used when parting.', 'See you later.', 'Tutaonana baadaye.', 'phrase', 'both', 'courtesy', 'Learn Common Suba Phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Greetings/courtesy Wave D'),

  -- orc (Orma, Oromo-aligned)
  ('BATCH_ORC_GREETINGS_WAVE_D_2026_02_27_A', 1, 'orc', 'Naqaa?', 'A general Oromo greeting used to say hello.', 'Hello.', 'Habari.', 'phrase', 'both', 'greetings', 'Useful phrases in Oromo', 'reference-web', 'https://www.omniglot.com/language/phrases/oromo.htm', 'Greetings/courtesy Wave D; Oromo-aligned'),
  ('BATCH_ORC_GREETINGS_WAVE_D_2026_02_27_A', 2, 'orc', 'Baga nagaan dhufte!', 'A welcoming phrase addressed to one person.', 'Welcome.', 'Karibu.', 'phrase', 'both', 'courtesy', 'Useful phrases in Oromo', 'reference-web', 'https://www.omniglot.com/language/phrases/oromo.htm', 'Greetings/courtesy Wave D; Oromo-aligned'),
  ('BATCH_ORC_GREETINGS_WAVE_D_2026_02_27_A', 3, 'orc', 'Dhiifama', 'An apology or polite attention-getting phrase.', 'Sorry.; Excuse me.', 'Samahani.', 'phrase', 'both', 'courtesy', 'Useful phrases in Oromo', 'reference-web', 'https://www.omniglot.com/language/phrases/oromo.htm', 'Greetings/courtesy Wave D; Oromo-aligned'),

  -- mas (Maasai / Maa)
  ('BATCH_MAS_GREETINGS_WAVE_D_2026_02_27_A', 1, 'mas', 'Kejaa enkakenya inno', 'A morning greeting in Maasai.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Learn Maasai: Common phrases and their meaning', 'reference-web', 'https://lughayangu.com/post/learn-maasai-common-maasai-phrases-and-their-meaning', 'Greetings/courtesy Wave D'),
  ('BATCH_MAS_GREETINGS_WAVE_D_2026_02_27_A', 2, 'mas', 'Kejaa endama inno', 'An afternoon greeting in Maasai.', 'Good afternoon.', 'Habari ya mchana.', 'phrase', 'both', 'greetings', 'Learn Maasai: Common phrases and their meaning', 'reference-web', 'https://lughayangu.com/post/learn-maasai-common-maasai-phrases-and-their-meaning', 'Greetings/courtesy Wave D'),
  ('BATCH_MAS_GREETINGS_WAVE_D_2026_02_27_A', 3, 'mas', 'Kejaa enteipa inno', 'An evening greeting in Maasai.', 'Good evening.', 'Habari ya jioni.', 'phrase', 'both', 'greetings', 'Learn Maasai: Common phrases and their meaning', 'reference-web', 'https://lughayangu.com/post/learn-maasai-common-maasai-phrases-and-their-meaning', 'Greetings/courtesy Wave D'),
  ('BATCH_MAS_GREETINGS_WAVE_D_2026_02_27_A', 4, 'mas', 'Ira supat?', 'A common greeting asking how someone is.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Learn Maasai: Common phrases and their meaning', 'reference-web', 'https://lughayangu.com/post/learn-maasai-common-maasai-phrases-and-their-meaning', 'Greetings/courtesy Wave D'),
  ('BATCH_MAS_GREETINGS_WAVE_D_2026_02_27_A', 5, 'mas', 'Kara nanu supat', 'A response meaning the speaker is fine.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'greetings', 'Learn Maasai: Common phrases and their meaning', 'reference-web', 'https://lughayangu.com/post/learn-maasai-common-maasai-phrases-and-their-meaning', 'Greetings/courtesy Wave D'),
  ('BATCH_MAS_GREETINGS_WAVE_D_2026_02_27_A', 6, 'mas', 'Ashe oleng', 'A strong expression of gratitude.', 'Thank you very much.', 'Asante sana.', 'phrase', 'both', 'courtesy', 'Meaning of ashe in Maasai', 'reference-web', 'https://lughayangu.com/maasai/ashe', 'Greetings/courtesy Wave D'),
  ('BATCH_MAS_GREETINGS_WAVE_D_2026_02_27_A', 7, 'mas', 'Ole sere', 'A farewell used when parting.', 'Goodbye.', 'Kwa heri.', 'phrase', 'both', 'courtesy', 'Learn Maasai: Common phrases and their meaning', 'reference-web', 'https://lughayangu.com/post/learn-maasai-common-maasai-phrases-and-their-meaning', 'Greetings/courtesy Wave D'),
  ('BATCH_MAS_GREETINGS_WAVE_D_2026_02_27_A', 8, 'mas', 'Matoduata adake teipa', 'A later-time farewell.', 'See you later.', 'Tutaonana baadaye.', 'phrase', 'both', 'courtesy', 'Learn Maasai: Common phrases and their meaning', 'reference-web', 'https://lughayangu.com/post/learn-maasai-common-maasai-phrases-and-their-meaning', 'Greetings/courtesy Wave D'),

  -- x-sheng (Sheng)
  ('BATCH_SHENG_GREETINGS_WAVE_D_2026_02_27_A', 1, 'x-sheng', 'mambo?', 'A casual urban greeting in Sheng.', 'What''s up?; How are you?', 'Sasa?; Habari yako?', 'phrase', 'informal', 'greetings', 'A Tourist''s Guide to Kenyan Slang, Sayings, and Street Lingo', 'reference-web', 'https://visitkenyaguide.com/speak-like-a-local-kenyan-slang-and-phrases-for-tourists/', 'Greetings/courtesy Wave D; review-heavy slang'),
  ('BATCH_SHENG_GREETINGS_WAVE_D_2026_02_27_A', 2, 'x-sheng', 'fiti', 'A casual positive response to a greeting.', 'Good.; Cool.; I am fine.', 'Poa.; Niko sawa.', 'phrase', 'informal', 'greetings', 'A Tourist''s Guide to Kenyan Slang, Sayings, and Street Lingo', 'reference-web', 'https://visitkenyaguide.com/speak-like-a-local-kenyan-slang-and-phrases-for-tourists/', 'Greetings/courtesy Wave D; review-heavy slang'),
  ('BATCH_SHENG_GREETINGS_WAVE_D_2026_02_27_A', 3, 'x-sheng', 'baadaye', 'A casual parting expression used in urban speech.', 'Later.; Goodbye.', 'Baadaye.; Kwa heri.', 'phrase', 'informal', 'courtesy', 'These are the phrases you need to know before you visit Kenya', 'reference-web', 'https://explorepartsunknown.com/kenya/phrasebook-kenya/', 'Greetings/courtesy Wave D; review-heavy slang')
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
--   'BATCH_BXK_GREETINGS_WAVE_D_2026_02_27_A',
--   'BATCH_LTO_GREETINGS_WAVE_D_2026_02_27_A',
--   'BATCH_SXB_GREETINGS_WAVE_D_2026_02_27_A',
--   'BATCH_ORC_GREETINGS_WAVE_D_2026_02_27_A',
--   'BATCH_MAS_GREETINGS_WAVE_D_2026_02_27_A',
--   'BATCH_SHENG_GREETINGS_WAVE_D_2026_02_27_A'
-- )
-- group by batch_label, language_code
-- order by batch_label;
