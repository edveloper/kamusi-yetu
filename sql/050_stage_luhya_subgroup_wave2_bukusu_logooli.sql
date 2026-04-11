-- 050_stage_luhya_subgroup_wave2_bukusu_logooli.sql
-- Purpose:
-- Stage the second Luhya subgroup starter wave using Bukusu and Logooli.
--
-- Covered in this wave:
-- - bxk (Bukusu)
-- - rag (Logooli / Kimaragoli)
--
-- Target per language:
-- - 10 starter words
-- - 5 starter phrases

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- bxk (Bukusu) words
  ('BATCH_BXK_STARTER_2026_02_26_A', 1, 'bxk', 'embusi', 'Goat.', 'goat', 'mbuzi', 'noun', 'both', 'nature', 'Lughayangu Bukusu dictionary', 'reference-web', 'https://lughayangu.com/bukusu/embusi', 'Curated Luhya subgroup Wave 2 Bukusu starter seed'),
  ('BATCH_BXK_STARTER_2026_02_26_A', 2, 'bxk', 'kamabele', 'Milk.', 'milk', 'maziwa', 'noun', 'both', 'food', 'Lughayangu Bukusu dictionary', 'reference-web', 'https://lughayangu.com/bukusu/kamabele', 'Curated Luhya subgroup Wave 2 Bukusu starter seed'),
  ('BATCH_BXK_STARTER_2026_02_26_A', 3, 'bxk', 'liilo', 'Sleepiness; the state of being sleepy.', 'sleepiness', 'usingizi', 'noun', 'both', 'body', 'Lughayangu Bukusu dictionary', 'reference-web', 'https://lughayangu.com/bukusu/liilo', 'Curated Luhya subgroup Wave 2 Bukusu starter seed'),
  ('BATCH_BXK_STARTER_2026_02_26_A', 4, 'bxk', 'liloo', 'Sleep.', 'sleep', 'usingizi; kulala', 'noun', 'both', 'body', 'Lughayangu Bukusu dictionary', 'reference-web', 'https://lughayangu.com/bukusu/liloo', 'Curated Luhya subgroup Wave 2 Bukusu starter seed'),
  ('BATCH_BXK_STARTER_2026_02_26_A', 5, 'bxk', 'enge', 'Scorpion.', 'scorpion', 'nge', 'noun', 'both', 'nature', 'Lughayangu Bukusu dictionary', 'reference-web', 'https://lughayangu.com/bukusu/enge', 'Curated Luhya subgroup Wave 2 Bukusu starter seed'),
  ('BATCH_BXK_STARTER_2026_02_26_A', 6, 'bxk', 'luchi', 'River.', 'river', 'mto', 'noun', 'both', 'nature', 'Lughayangu Bukusu dictionary', 'reference-web', 'https://lughayangu.com/bukusu/luchi', 'Curated Luhya subgroup Wave 2 Bukusu starter seed'),
  ('BATCH_BXK_STARTER_2026_02_26_A', 7, 'bxk', 'kumubano', 'Knife.', 'knife', 'kisu', 'noun', 'both', 'home', 'Lughayangu Bukusu dictionary', 'reference-web', 'https://lughayangu.com/bukusu/kumubano', 'Curated Luhya subgroup Wave 2 Bukusu starter seed'),
  ('BATCH_BXK_STARTER_2026_02_26_A', 8, 'bxk', 'kumukoye', 'Rope.', 'rope', 'kamba', 'noun', 'both', 'home', 'Lughayangu Bukusu dictionary', 'reference-web', 'https://lughayangu.com/bukusu/kumukoye', 'Curated Luhya subgroup Wave 2 Bukusu starter seed'),
  ('BATCH_BXK_STARTER_2026_02_26_A', 9, 'bxk', 'endebe', 'Chair.', 'chair', 'kiti', 'noun', 'both', 'home', 'Lughayangu Bukusu dictionary', 'reference-web', 'https://lughayangu.com/bukusu/endebe', 'Curated Luhya subgroup Wave 2 Bukusu starter seed'),
  ('BATCH_BXK_STARTER_2026_02_26_A', 10, 'bxk', 'kenda', 'To walk.', 'walk', 'tembea', 'verb', 'both', 'actions', 'Lughayangu Bukusu dictionary', 'reference-web', 'https://lughayangu.com/bukusu/kenda', 'Curated Luhya subgroup Wave 2 Bukusu starter seed'),

  -- bxk (Bukusu) phrases
  ('BATCH_BXK_STARTER_2026_02_26_A', 11, 'bxk', 'Wasuzahai?', 'A formal Bukusu morning greeting.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'culture', 'Bukusu phrase guides', 'reference-web', 'https://howtosayguide.com/how-to-say-good-morning-in-bukusu/', 'Curated Luhya subgroup Wave 2 Bukusu starter seed'),
  ('BATCH_BXK_STARTER_2026_02_26_A', 12, 'bxk', 'Mangen de?', 'An informal Bukusu morning greeting.', 'How did you wake up?', 'Umeamkaje?', 'phrase', 'both', 'culture', 'Bukusu phrase guides', 'reference-web', 'https://howtosayguide.com/how-to-say-good-morning-in-bukusu/', 'Curated Luhya subgroup Wave 2 Bukusu starter seed'),
  ('BATCH_BXK_STARTER_2026_02_26_A', 13, 'bxk', 'Webale', 'A respectful expression of thanks.', 'Thank you.', 'Asante.', 'phrase', 'both', 'culture', 'Bukusu phrase guides', 'reference-web', 'https://howtosayguide.com/how-to-say-thank-you-in-bukusu/', 'Curated Luhya subgroup Wave 2 Bukusu starter seed'),
  ('BATCH_BXK_STARTER_2026_02_26_A', 14, 'bxk', 'Ndimpenyi', 'An expression of affection meaning I love you.', 'I love you.', 'Nakupenda.', 'phrase', 'both', 'culture', 'Bukusu phrase guides', 'reference-web', 'https://howtosayguide.com/how-to-say-i-love-you-in-bukusu/', 'Curated Luhya subgroup Wave 2 Bukusu starter seed'),
  ('BATCH_BXK_STARTER_2026_02_26_A', 15, 'bxk', 'Wamwala', 'A formal Bukusu farewell.', 'Goodbye.', 'Kwa heri.', 'phrase', 'both', 'culture', 'Luhya farewell guide', 'reference-web', 'https://howtosayguide.com/how-to-say-goodbye-in-luhya/', 'Curated Luhya subgroup Wave 2 Bukusu starter seed'),

  -- rag (Logooli / Kimaragoli) words
  ('BATCH_RAG_STARTER_2026_02_26_A', 1, 'rag', 'matsi', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Lughayangu Kimaragoli dictionary', 'reference-web', 'https://lughayangu.com/kimaragoli/matsi', 'Curated Luhya subgroup Wave 2 Logooli starter seed'),
  ('BATCH_RAG_STARTER_2026_02_26_A', 2, 'rag', 'mazi', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Lughayangu Kimaragoli dictionary', 'reference-web', 'https://lughayangu.com/kimaragoli/mazi', 'Curated Luhya subgroup Wave 2 Logooli starter seed'),
  ('BATCH_RAG_STARTER_2026_02_26_A', 3, 'rag', 'mwana', 'Child.', 'child', 'mtoto', 'noun', 'both', 'family', 'Lughayangu Kimaragoli dictionary', 'reference-web', 'https://lughayangu.com/kimaragoli/mwana', 'Curated Luhya subgroup Wave 2 Logooli starter seed'),
  ('BATCH_RAG_STARTER_2026_02_26_A', 4, 'rag', 'kidali', 'Bed.', 'bed', 'kitanda', 'noun', 'both', 'home', 'Lughayangu Kimaragoli dictionary', 'reference-web', 'https://lughayangu.com/kimaragoli/kidali', 'Curated Luhya subgroup Wave 2 Logooli starter seed'),
  ('BATCH_RAG_STARTER_2026_02_26_A', 5, 'rag', 'kwiga', 'To study.', 'study', 'soma', 'verb', 'both', 'education', 'Lughayangu Kimaragoli dictionary', 'reference-web', 'https://lughayangu.com/kimaragoli/kwiga', 'Curated Luhya subgroup Wave 2 Logooli starter seed'),
  ('BATCH_RAG_STARTER_2026_02_26_A', 6, 'rag', 'imbongo', 'Money.', 'money', 'pesa', 'noun', 'both', 'work', 'Lughayangu Kimaragoli dictionary', 'reference-web', 'https://lughayangu.com/kimaragoli/imbongo', 'Curated Luhya subgroup Wave 2 Logooli starter seed'),
  ('BATCH_RAG_STARTER_2026_02_26_A', 7, 'rag', 'indulu', 'Bucket or container.', 'bucket', 'ndoo', 'noun', 'both', 'home', 'Lughayangu Kimaragoli dictionary', 'reference-web', 'https://lughayangu.com/kimaragoli/indulu', 'Curated Luhya subgroup Wave 2 Logooli starter seed'),
  ('BATCH_RAG_STARTER_2026_02_26_A', 8, 'rag', 'kivwe', 'Stone.', 'stone', 'jiwe', 'noun', 'both', 'nature', 'Lughayangu Kimaragoli dictionary', 'reference-web', 'https://lughayangu.com/kimaragoli/kivwe', 'Curated Luhya subgroup Wave 2 Logooli starter seed'),
  ('BATCH_RAG_STARTER_2026_02_26_A', 9, 'rag', 'mkonye', 'Helper or one who helps.', 'helper', 'msaidizi', 'noun', 'both', 'work', 'Lughayangu Kimaragoli dictionary', 'reference-web', 'https://lughayangu.com/kimaragoli/mkonye', 'Curated Luhya subgroup Wave 2 Logooli starter seed'),
  ('BATCH_RAG_STARTER_2026_02_26_A', 10, 'rag', 'kiziriri', 'Cold or chilly condition.', 'cold', 'baridi', 'noun', 'both', 'weather', 'Lughayangu Kimaragoli dictionary', 'reference-web', 'https://lughayangu.com/kimaragoli/kiziriri', 'Curated Luhya subgroup Wave 2 Logooli starter seed'),

  -- rag (Logooli / Kimaragoli) phrases
  ('BATCH_RAG_STARTER_2026_02_26_A', 11, 'rag', 'Milembe', 'A greeting used to say hello.', 'Hello.', 'Habari.', 'phrase', 'both', 'culture', 'Common Kimaragoli phrases', 'reference-web', 'https://lughayangu.com/post/common-kimaragoli-phrases', 'Curated Luhya subgroup Wave 2 Logooli starter seed'),
  ('BATCH_RAG_STARTER_2026_02_26_A', 12, 'rag', 'Uve ndi?', 'A common greeting asking how someone is.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'culture', 'Common Kimaragoli phrases', 'reference-web', 'https://lughayangu.com/post/common-kimaragoli-phrases', 'Curated Luhya subgroup Wave 2 Logooli starter seed'),
  ('BATCH_RAG_STARTER_2026_02_26_A', 13, 'rag', 'Sandidhe', 'An expression of thanks.', 'Thank you.', 'Asante.', 'phrase', 'both', 'culture', 'Common Kimaragoli phrases', 'reference-web', 'https://lughayangu.com/post/common-kimaragoli-phrases', 'Curated Luhya subgroup Wave 2 Logooli starter seed'),
  ('BATCH_RAG_STARTER_2026_02_26_A', 14, 'rag', 'Ndi Modi', 'An apology or expression of regret.', 'I am sorry.', 'Samahani.', 'phrase', 'both', 'culture', 'Common Kimaragoli phrases', 'reference-web', 'https://lughayangu.com/post/common-kimaragoli-phrases', 'Curated Luhya subgroup Wave 2 Logooli starter seed'),
  ('BATCH_RAG_STARTER_2026_02_26_A', 15, 'rag', 'Nthidha yengo.', 'A phrase indicating the speaker is going home.', 'I am going home.', 'Ninaenda nyumbani.', 'phrase', 'both', 'culture', 'Common Kimaragoli phrases', 'reference-web', 'https://lughayangu.com/post/common-kimaragoli-phrases', 'Curated Luhya subgroup Wave 2 Logooli starter seed')
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
--   'BATCH_BXK_STARTER_2026_02_26_A',
--   'BATCH_RAG_STARTER_2026_02_26_A'
-- )
-- group by batch_label, language_code
-- order by batch_label;
