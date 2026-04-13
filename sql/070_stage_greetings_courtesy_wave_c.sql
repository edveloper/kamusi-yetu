-- 070_stage_greetings_courtesy_wave_c.sql
-- Purpose:
-- Stage the third greetings/courtesy wave for near-threshold languages that
-- have exact additional greeting material available from the same vetted source
-- families already used in earlier waves.
--
-- Covered in this wave:
-- - ki  (Kikuyu)
-- - luo (Dholuo)
-- - sgc (Kipsigis)
-- - lto (Olutsotso)
-- - bxk (Bukusu)
-- - rag (Logooli / Kimaragoli)
-- - sxb (Suba / Olusuba)
-- - tuy (Tugen)
--
-- Notes:
-- - This wave is aimed at pushing these communities to or closer to the 10-row
--   greetings floor.
-- - `spy`, `niq`, and the zero-coverage languages are intentionally left for
--   the next completion pass because the source surface still needs another review.

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- ki (Kikuyu)
  ('BATCH_KI_GREETINGS_WAVE_C_2026_02_27_A', 1, 'ki', 'Tuonane mahinda mangi', 'A later-time farewell used when parting.', 'See you later.', 'Tutaonana baadaye.', 'phrase', 'both', 'courtesy', 'Common Kikuyu phrases and their meaning', 'reference-web', 'https://lughayangu.com/post/common-kikuyu-phrases-and-their-meaning', 'Greetings/courtesy Wave C'),

  -- luo (Dholuo)
  ('BATCH_LUO_GREETINGS_WAVE_C_2026_02_27_A', 1, 'luo', 'Wanenre machiegni', 'A near-term farewell used when parting.', 'See you soon.', 'Tutaonana karibuni.', 'phrase', 'both', 'courtesy', 'Common Luo phrases, love words and their meaning', 'reference-web', 'https://lughayangu.com/post/luo-love-wordsgreetingsdirections-and-basic-conversations', 'Greetings/courtesy Wave C'),

  -- sgc (Kipsigis)
  ('BATCH_SGC_GREETINGS_WAVE_C_2026_02_27_A', 1, 'sgc', 'Chamgei', 'A general greeting used to say hello.', 'Hello.', 'Habari.', 'phrase', 'both', 'greetings', 'Common Kipsigis words and their meaning', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-words-and-their-meaning', 'Greetings/courtesy Wave C'),
  ('BATCH_SGC_GREETINGS_WAVE_C_2026_02_27_A', 2, 'sgc', 'Chamgei mising', 'A response to a greeting.', 'Hello to you too.', 'Habari kwako pia.', 'phrase', 'both', 'greetings', 'Common Kipsigis words and their meaning', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-words-and-their-meaning', 'Greetings/courtesy Wave C'),
  ('BATCH_SGC_GREETINGS_WAVE_C_2026_02_27_A', 3, 'sgc', 'Yamonei', 'A greeting asking how someone is.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Common Kipsigis words and their meaning', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-words-and-their-meaning', 'Greetings/courtesy Wave C'),
  ('BATCH_SGC_GREETINGS_WAVE_C_2026_02_27_A', 4, 'sgc', 'Achamgei', 'A response meaning the speaker is fine.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'greetings', 'Common Kipsigis words and their meaning', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-words-and-their-meaning', 'Greetings/courtesy Wave C'),
  ('BATCH_SGC_GREETINGS_WAVE_C_2026_02_27_A', 5, 'sgc', 'Betut nemie', 'A goodwill wish for the day ahead.', 'Have a good day.', 'Uwe na siku njema.', 'phrase', 'both', 'courtesy', 'Common Kipsigis words and their meaning', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-words-and-their-meaning', 'Greetings/courtesy Wave C'),
  ('BATCH_SGC_GREETINGS_WAVE_C_2026_02_27_A', 6, 'sgc', 'Si ru komie', 'A night blessing or farewell.', 'Sleep well.', 'Lala salama.', 'phrase', 'both', 'courtesy', 'Common Kipsigis words and their meaning', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-words-and-their-meaning', 'Greetings/courtesy Wave C'),
  ('BATCH_SGC_GREETINGS_WAVE_C_2026_02_27_A', 7, 'sgc', 'Seiseri', 'A farewell used when parting.', 'Goodbye.', 'Kwa heri.', 'phrase', 'both', 'courtesy', 'Common Kipsigis words and their meaning', 'reference-web', 'https://lughayangu.com/post/common-kipsigis-words-and-their-meaning', 'Greetings/courtesy Wave C'),

  -- lto (Olutsotso)
  ('BATCH_LTO_GREETINGS_WAVE_C_2026_02_27_A', 1, 'lto', 'Keshitere', 'A daytime greeting used in the afternoon.', 'Good afternoon.', 'Habari ya mchana.', 'phrase', 'both', 'greetings', 'Common Phrases in Olutsotso', 'reference-web', 'https://lughayangu.com/post/common-phrases-in-olutsotso', 'Greetings/courtesy Wave C'),
  ('BATCH_LTO_GREETINGS_WAVE_C_2026_02_27_A', 2, 'lto', 'Namalayi', 'A response to an afternoon greeting.', 'Good afternoon too.', 'Habari ya mchana pia.', 'phrase', 'both', 'greetings', 'Common Phrases in Olutsotso', 'reference-web', 'https://lughayangu.com/post/common-phrases-in-olutsotso', 'Greetings/courtesy Wave C'),
  ('BATCH_LTO_GREETINGS_WAVE_C_2026_02_27_A', 3, 'lto', 'Vaa nende inyanga indayi', 'A goodwill wish for the day ahead.', 'Have a good day.', 'Uwe na siku njema.', 'phrase', 'both', 'courtesy', 'Common Phrases in Olutsotso', 'reference-web', 'https://lughayangu.com/post/common-phrases-in-olutsotso', 'Greetings/courtesy Wave C'),
  ('BATCH_LTO_GREETINGS_WAVE_C_2026_02_27_A', 4, 'lto', 'Khulolane nunu', 'A near-term farewell.', 'See you soon.', 'Tutaonana karibuni.', 'phrase', 'both', 'courtesy', 'Common Phrases in Olutsotso', 'reference-web', 'https://lughayangu.com/post/common-phrases-in-olutsotso', 'Greetings/courtesy Wave C'),

  -- bxk (Bukusu)
  ('BATCH_BXK_GREETINGS_WAVE_C_2026_02_27_A', 1, 'bxk', 'Chesikala?', 'A regional Bukusu morning greeting.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'How to Say Good Morning in Bukusu', 'reference-web', 'https://howtosayguide.com/how-to-say-good-morning-in-bukusu/', 'Greetings/courtesy Wave C'),
  ('BATCH_BXK_GREETINGS_WAVE_C_2026_02_27_A', 2, 'bxk', 'Wasanguti?', 'A regional Bukusu morning greeting used in Bungoma.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'How to Say Good Morning in Bukusu', 'reference-web', 'https://howtosayguide.com/how-to-say-good-morning-in-bukusu/', 'Greetings/courtesy Wave C'),
  ('BATCH_BXK_GREETINGS_WAVE_C_2026_02_27_A', 3, 'bxk', 'Nasikhuuks', 'A formal expression of gratitude.', 'Thank you.', 'Asante.', 'phrase', 'both', 'courtesy', 'How to Say Thank You in Bukusu', 'reference-web', 'https://howtosayguide.com/how-to-say-thank-you-in-bukusu/', 'Greetings/courtesy Wave C'),

  -- rag (Logooli / Kimaragoli)
  ('BATCH_RAG_GREETINGS_WAVE_C_2026_02_27_A', 1, 'rag', 'Ndi mulamu', 'A response meaning the speaker is fine.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'greetings', 'Common Kimaragoli Phrases', 'reference-web', 'https://lughayangu.com/post/common-kimaragoli-phrases', 'Greetings/courtesy Wave C'),
  ('BATCH_RAG_GREETINGS_WAVE_C_2026_02_27_A', 2, 'rag', 'Kulolane kalunu', 'A near-term farewell used when parting.', 'See you soon.', 'Tutaonana karibuni.', 'phrase', 'both', 'courtesy', 'Common Kimaragoli Phrases', 'reference-web', 'https://lughayangu.com/post/common-kimaragoli-phrases', 'Greetings/courtesy Wave C'),

  -- sxb (Suba / Olusuba)
  ('BATCH_SXB_GREETINGS_WAVE_C_2026_02_27_A', 1, 'sxb', 'Reero ogi igake?', 'A greeting asking how someone is today.', 'How are you today?', 'Habari yako leo?', 'phrase', 'both', 'greetings', 'Learn Common Suba Phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Greetings/courtesy Wave C'),
  ('BATCH_SXB_GREETINGS_WAVE_C_2026_02_27_A', 2, 'sxb', 'Owe ne erigoro eriroothu', 'A goodwill wish for the day ahead.', 'Have a good day.', 'Uwe na siku njema.', 'phrase', 'both', 'courtesy', 'Learn Common Suba Phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Greetings/courtesy Wave C'),

  -- tuy (Tugen)
  ('BATCH_TUY_GREETINGS_WAVE_C_2026_02_27_A', 1, 'tuy', 'Kararan kaa kerin', 'A phrase used when meeting someone for the first time.', 'Nice to meet you.', 'Nimefurahi kukutana nawe.', 'phrase', 'both', 'courtesy', 'Common Tugen Phrases', 'reference-web', 'https://lughayangu.com/post/common-tugen-phrases', 'Greetings/courtesy Wave C'),
  ('BATCH_TUY_GREETINGS_WAVE_C_2026_02_27_A', 2, 'tuy', 'Sia kerin patae', 'A later-time farewell used when parting.', 'See you later.', 'Tutaonana baadaye.', 'phrase', 'both', 'courtesy', 'Common Tugen Phrases', 'reference-web', 'https://lughayangu.com/post/common-tugen-phrases', 'Greetings/courtesy Wave C')
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
--   'BATCH_KI_GREETINGS_WAVE_C_2026_02_27_A',
--   'BATCH_LUO_GREETINGS_WAVE_C_2026_02_27_A',
--   'BATCH_SGC_GREETINGS_WAVE_C_2026_02_27_A',
--   'BATCH_LTO_GREETINGS_WAVE_C_2026_02_27_A',
--   'BATCH_BXK_GREETINGS_WAVE_C_2026_02_27_A',
--   'BATCH_RAG_GREETINGS_WAVE_C_2026_02_27_A',
--   'BATCH_SXB_GREETINGS_WAVE_C_2026_02_27_A',
--   'BATCH_TUY_GREETINGS_WAVE_C_2026_02_27_A'
-- )
-- group by batch_label, language_code
-- order by batch_label;
