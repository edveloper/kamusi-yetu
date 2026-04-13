-- 067_stage_greetings_courtesy_wave_b.sql
-- Purpose:
-- Stage the second greetings/courtesy wave for languages that already have a
-- starter phrase layer and now have enough exact sourced additions to deepen
-- coverage without guessing.
--
-- Covered in this wave:
-- - pko (Pokot)
-- - sxb (Suba / Olusuba)
-- - lto (Olutsotso)
-- - bxk (Bukusu)
-- - rag (Logooli / Kimaragoli)
-- - tuy (Tugen)
-- - orc (Orma, Oromo-aligned)
--
-- Notes:
-- - This wave intentionally excludes `spy` and `sgc` for now.
-- - They need another sourcing pass before we should add more greetings rows.

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- pko (Pokot)
  ('BATCH_PKO_GREETINGS_WAVE_B_2026_02_27_A', 1, 'pko', 'takwes akwaa', 'A general greeting that can be used across the day.', 'Greetings.; Good morning.; Good afternoon.; Good evening.', 'Salamu.; Habari ya asubuhi.; Habari ya mchana.; Habari ya jioni.', 'phrase', 'both', 'greetings', 'Lughayangu Pokot dictionary', 'reference-web', 'https://lughayangu.com/pokot/takwes-akwaa', 'Greetings/courtesy Wave B'),
  ('BATCH_PKO_GREETINGS_WAVE_B_2026_02_27_A', 2, 'pko', 'amee chopo tokwooa', 'A morning greeting used early in the day.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Common Pokot phrases', 'reference-web', 'https://lughayangu.com/post/common-pokot-phrases-and-their-meaning', 'Greetings/courtesy Wave B'),
  ('BATCH_PKO_GREETINGS_WAVE_B_2026_02_27_A', 3, 'pko', 'lendanee chopo monon', 'An afternoon greeting.', 'Good afternoon.', 'Habari ya mchana.', 'phrase', 'both', 'greetings', 'Common Pokot phrases', 'reference-web', 'https://lughayangu.com/post/common-pokot-phrases-and-their-meaning', 'Greetings/courtesy Wave B'),
  ('BATCH_PKO_GREETINGS_WAVE_B_2026_02_27_A', 4, 'pko', 'lendanee chopo nang''at', 'An evening greeting.', 'Good evening.', 'Habari ya jioni.', 'phrase', 'both', 'greetings', 'Common Pokot phrases', 'reference-web', 'https://lughayangu.com/post/common-pokot-phrases-and-their-meaning', 'Greetings/courtesy Wave B'),
  ('BATCH_PKO_GREETINGS_WAVE_B_2026_02_27_A', 5, 'pko', 'lendanee chopo asisetee', 'A greeting that asks how someone is doing today.', 'How are you today?', 'Habari yako leo?', 'phrase', 'both', 'greetings', 'Common Pokot phrases', 'reference-web', 'https://lughayangu.com/post/common-pokot-phrases-and-their-meaning', 'Greetings/courtesy Wave B'),

  -- sxb (Suba / Olusuba)
  ('BATCH_SXB_GREETINGS_WAVE_B_2026_02_27_A', 1, 'sxb', 'Wakia', 'A greeting used in the afternoon.', 'Good afternoon.', 'Habari ya mchana.', 'phrase', 'both', 'greetings', 'Learn Common Suba Phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Greetings/courtesy Wave B'),
  ('BATCH_SXB_GREETINGS_WAVE_B_2026_02_27_A', 2, 'sxb', 'Omuvasu omuroothu', 'Another courteous afternoon greeting.', 'Good afternoon.', 'Habari ya mchana.', 'phrase', 'both', 'greetings', 'Learn Common Suba Phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Greetings/courtesy Wave B'),
  ('BATCH_SXB_GREETINGS_WAVE_B_2026_02_27_A', 3, 'sxb', 'Ogi igake?', 'A general greeting asking how someone is.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Learn Common Suba Phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Greetings/courtesy Wave B'),
  ('BATCH_SXB_GREETINGS_WAVE_B_2026_02_27_A', 4, 'sxb', 'Ng''omerewue okunyorona ni iwue', 'A phrase used when meeting someone for the first time.', 'Nice to meet you.', 'Nimefurahi kukutana nawe.', 'phrase', 'both', 'courtesy', 'Learn Common Suba Phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Greetings/courtesy Wave B'),
  ('BATCH_SXB_GREETINGS_WAVE_B_2026_02_27_A', 5, 'sxb', 'Thuvoonane igano ang''i', 'A near-term farewell meaning speakers will see each other soon.', 'See you soon.', 'Tutaonana karibuni.', 'phrase', 'both', 'courtesy', 'Learn Common Suba Phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Greetings/courtesy Wave B'),

  -- lto (Olutsotso)
  ('BATCH_LTO_GREETINGS_WAVE_B_2026_02_27_A', 1, 'lto', 'Vushiere', 'A morning greeting.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Common Phrases in Olutsotso', 'reference-web', 'https://lughayangu.com/post/common-phrases-in-olutsotso', 'Greetings/courtesy Wave B'),
  ('BATCH_LTO_GREETINGS_WAVE_B_2026_02_27_A', 2, 'lto', 'Vushiereno', 'A response to a morning greeting.', 'Good morning too.', 'Habari ya asubuhi pia.', 'phrase', 'both', 'greetings', 'Common Phrases in Olutsotso', 'reference-web', 'https://lughayangu.com/post/common-phrases-in-olutsotso', 'Greetings/courtesy Wave B'),
  ('BATCH_LTO_GREETINGS_WAVE_B_2026_02_27_A', 3, 'lto', 'Vuirire', 'An evening greeting.', 'Good evening.', 'Habari ya jioni.', 'phrase', 'both', 'greetings', 'Common Phrases in Olutsotso', 'reference-web', 'https://lughayangu.com/post/common-phrases-in-olutsotso', 'Greetings/courtesy Wave B'),
  ('BATCH_LTO_GREETINGS_WAVE_B_2026_02_27_A', 4, 'lto', 'Eshiro eshilayi', 'A night blessing or parting phrase.', 'Good night.', 'Usiku mwema.', 'phrase', 'both', 'courtesy', 'Common Phrases in Olutsotso', 'reference-web', 'https://lughayangu.com/post/common-phrases-in-olutsotso', 'Greetings/courtesy Wave B'),
  ('BATCH_LTO_GREETINGS_WAVE_B_2026_02_27_A', 5, 'lto', 'Ori endiena?', 'A common greeting asking how someone is.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'greetings', 'Common Phrases in Olutsotso', 'reference-web', 'https://lughayangu.com/post/common-phrases-in-olutsotso', 'Greetings/courtesy Wave B'),

  -- bxk (Bukusu)
  ('BATCH_BXK_GREETINGS_WAVE_B_2026_02_27_A', 1, 'bxk', 'Wasuzaa?', 'A concise formal morning greeting.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'How to Say Good Morning in Bukusu', 'reference-web', 'https://howtosayguide.com/how-to-say-good-morning-in-bukusu/', 'Greetings/courtesy Wave B'),
  ('BATCH_BXK_GREETINGS_WAVE_B_2026_02_27_A', 2, 'bxk', 'Wasuzale?', 'A formal greeting asking how someone spent the night.', 'How was your night?', 'Umeshindaje usiku?', 'phrase', 'both', 'greetings', 'How to Say Good Morning in Bukusu', 'reference-web', 'https://howtosayguide.com/how-to-say-good-morning-in-bukusu/', 'Greetings/courtesy Wave B'),
  ('BATCH_BXK_GREETINGS_WAVE_B_2026_02_27_A', 3, 'bxk', 'Wangu?', 'An informal friendly morning greeting.', 'Good morning, friend.', 'Habari ya asubuhi, rafiki.', 'phrase', 'both', 'greetings', 'How to Say Good Morning in Bukusu', 'reference-web', 'https://howtosayguide.com/how-to-say-good-morning-in-bukusu/', 'Greetings/courtesy Wave B'),
  ('BATCH_BXK_GREETINGS_WAVE_B_2026_02_27_A', 4, 'bxk', 'Nasikhuuks', 'A formal expression of gratitude.', 'Thank you.', 'Asante.', 'phrase', 'both', 'courtesy', 'How to Say Thank You in Bukusu', 'reference-web', 'https://howtosayguide.com/how-to-say-thank-you-in-bukusu/', 'Greetings/courtesy Wave B'),
  ('BATCH_BXK_GREETINGS_WAVE_B_2026_02_27_A', 5, 'bxk', 'Nalako', 'An informal expression of gratitude among peers.', 'Thanks.', 'Asante.', 'phrase', 'both', 'courtesy', 'How to Say Thank You in Bukusu', 'reference-web', 'https://howtosayguide.com/how-to-say-thank-you-in-bukusu/', 'Greetings/courtesy Wave B'),

  -- rag (Logooli / Kimaragoli)
  ('BATCH_RAG_GREETINGS_WAVE_B_2026_02_27_A', 1, 'rag', 'Bwakira', 'An evening greeting.', 'Good evening.', 'Habari ya jioni.', 'phrase', 'both', 'greetings', 'Common Kimaragoli Phrases', 'reference-web', 'https://lughayangu.com/post/common-kimaragoli-phrases', 'Greetings/courtesy Wave B'),
  ('BATCH_RAG_GREETINGS_WAVE_B_2026_02_27_A', 2, 'rag', 'Bushiere', 'A morning greeting.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Common Kimaragoli Phrases', 'reference-web', 'https://lughayangu.com/post/common-kimaragoli-phrases', 'Greetings/courtesy Wave B'),
  ('BATCH_RAG_GREETINGS_WAVE_B_2026_02_27_A', 3, 'rag', 'Milembe ju mbasu', 'An afternoon greeting.', 'Good afternoon.', 'Habari ya mchana.', 'phrase', 'both', 'greetings', 'Common Kimaragoli Phrases', 'reference-web', 'https://lughayangu.com/post/common-kimaragoli-phrases', 'Greetings/courtesy Wave B'),
  ('BATCH_RAG_GREETINGS_WAVE_B_2026_02_27_A', 4, 'rag', 'Uve ndi nunu?', 'A greeting asking how someone is today.', 'How are you today?', 'Habari yako leo?', 'phrase', 'both', 'greetings', 'Common Kimaragoli Phrases', 'reference-web', 'https://lughayangu.com/post/common-kimaragoli-phrases', 'Greetings/courtesy Wave B'),
  ('BATCH_RAG_GREETINGS_WAVE_B_2026_02_27_A', 5, 'rag', 'Vaa ni lidiku lilai', 'A goodwill wish for the day ahead.', 'Have a good day.', 'Uwe na siku njema.', 'phrase', 'both', 'courtesy', 'Common Kimaragoli Phrases', 'reference-web', 'https://lughayangu.com/post/common-kimaragoli-phrases', 'Greetings/courtesy Wave B'),

  -- tuy (Tugen)
  ('BATCH_TUY_GREETINGS_WAVE_B_2026_02_27_A', 1, 'tuy', 'Chamngee nebo karon', 'A morning greeting.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Common Tugen Phrases', 'reference-web', 'https://lughayangu.com/post/common-tugen-phrases', 'Greetings/courtesy Wave B'),
  ('BATCH_TUY_GREETINGS_WAVE_B_2026_02_27_A', 2, 'tuy', 'Chamngee nebo koskoliny', 'An evening greeting.', 'Good evening.', 'Habari ya jioni.', 'phrase', 'both', 'greetings', 'Common Tugen Phrases', 'reference-web', 'https://lughayangu.com/post/common-tugen-phrases', 'Greetings/courtesy Wave B'),
  ('BATCH_TUY_GREETINGS_WAVE_B_2026_02_27_A', 3, 'tuy', 'Chamngeenebo bet', 'An afternoon greeting.', 'Good afternoon.', 'Habari ya mchana.', 'phrase', 'both', 'greetings', 'Common Tugen Phrases', 'reference-web', 'https://lughayangu.com/post/common-tugen-phrases', 'Greetings/courtesy Wave B'),
  ('BATCH_TUY_GREETINGS_WAVE_B_2026_02_27_A', 4, 'tuy', 'Iyamune rani?', 'A greeting asking how someone is today.', 'How are you today?', 'Habari yako leo?', 'phrase', 'both', 'greetings', 'Common Tugen Phrases', 'reference-web', 'https://lughayangu.com/post/common-tugen-phrases', 'Greetings/courtesy Wave B'),
  ('BATCH_TUY_GREETINGS_WAVE_B_2026_02_27_A', 5, 'tuy', 'Tebii komyee', 'A goodwill wish for the day ahead.', 'Have a good day.', 'Uwe na siku njema.', 'phrase', 'both', 'courtesy', 'Common Tugen Phrases', 'reference-web', 'https://lughayangu.com/post/common-tugen-phrases', 'Greetings/courtesy Wave B'),

  -- orc (Orma, Oromo-aligned)
  ('BATCH_ORC_GREETINGS_WAVE_B_2026_02_27_A', 1, 'orc', 'Akkam bulte?', 'A morning greeting used with one person.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Useful phrases in Oromo', 'reference-web', 'https://www.omniglot.com/language/phrases/oromo.htm', 'Greetings/courtesy Wave B; Oromo-aligned'),
  ('BATCH_ORC_GREETINGS_WAVE_B_2026_02_27_A', 2, 'orc', 'Oolmaan akkam?', 'A daytime greeting used in the afternoon or evening.', 'Good afternoon.; Good evening.', 'Habari ya mchana.; Habari ya jioni.', 'phrase', 'both', 'greetings', 'Useful phrases in Oromo', 'reference-web', 'https://www.omniglot.com/language/phrases/oromo.htm', 'Greetings/courtesy Wave B; Oromo-aligned'),
  ('BATCH_ORC_GREETINGS_WAVE_B_2026_02_27_A', 3, 'orc', 'Nagaan buli', 'A night blessing or farewell.', 'Good night.', 'Usiku mwema.', 'phrase', 'both', 'courtesy', 'Useful phrases in Oromo', 'reference-web', 'https://www.omniglot.com/language/phrases/oromo.htm', 'Greetings/courtesy Wave B; Oromo-aligned'),
  ('BATCH_ORC_GREETINGS_WAVE_B_2026_02_27_A', 4, 'orc', 'Nagaatti', 'A farewell used when parting.', 'Goodbye.', 'Kwa heri.', 'phrase', 'both', 'courtesy', 'Useful phrases in Oromo', 'reference-web', 'https://www.omniglot.com/language/phrases/oromo.htm', 'Greetings/courtesy Wave B; Oromo-aligned'),
  ('BATCH_ORC_GREETINGS_WAVE_B_2026_02_27_A', 5, 'orc', 'Guyyaa gaarii', 'A goodwill wish for the day ahead.', 'Have a nice day.', 'Uwe na siku njema.', 'phrase', 'both', 'courtesy', 'Useful phrases in Oromo', 'reference-web', 'https://www.omniglot.com/language/phrases/oromo.htm', 'Greetings/courtesy Wave B; Oromo-aligned')
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
--   'BATCH_PKO_GREETINGS_WAVE_B_2026_02_27_A',
--   'BATCH_SXB_GREETINGS_WAVE_B_2026_02_27_A',
--   'BATCH_LTO_GREETINGS_WAVE_B_2026_02_27_A',
--   'BATCH_BXK_GREETINGS_WAVE_B_2026_02_27_A',
--   'BATCH_RAG_GREETINGS_WAVE_B_2026_02_27_A',
--   'BATCH_TUY_GREETINGS_WAVE_B_2026_02_27_A',
--   'BATCH_ORC_GREETINGS_WAVE_B_2026_02_27_A'
-- )
-- group by batch_label, language_code
-- order by batch_label;
