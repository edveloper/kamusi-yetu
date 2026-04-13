-- 064_stage_greetings_courtesy_wave_a.sql
-- Purpose:
-- Stage the first broad greetings/courtesy wave for the strongest indigenous
-- languages before moving on to numbers, days, and people/family packs.
--
-- Covered in this wave:
-- - ki (Kikuyu)
-- - luo (Dholuo)
-- - kam (Kamba)
-- - luy (Luhya)
-- - kal (Kalenjin cluster)
--
-- Category policy:
-- - greetings for salutations and opening exchanges
-- - courtesy for thanks, apologies, welcomes, and polite expressions

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- Kikuyu wave A additions
  ('BATCH_KI_GREETINGS_WAVE_A_2026_02_27_A', 1, 'ki', 'Uhoro waku?', 'A general greeting asking after another person.', 'Hello.; How are you?', 'Hujambo?; Habari yako?', 'phrase', 'both', 'greetings', 'Common Kikuyu phrases', 'reference-web', 'https://ithy.com/article/gikuyu-language-culture-overview-epir6lcd', 'Greetings/courtesy Wave A'),
  ('BATCH_KI_GREETINGS_WAVE_A_2026_02_27_A', 2, 'ki', 'Wi mwega?', 'A greeting asking if another person is well.', 'Are you well?', 'U mzima?', 'phrase', 'both', 'greetings', 'Common Kikuyu phrases', 'reference-web', 'https://ithy.com/article/gikuyu-language-culture-overview-epir6lcd', 'Greetings/courtesy Wave A'),
  ('BATCH_KI_GREETINGS_WAVE_A_2026_02_27_A', 3, 'ki', 'Thega', 'An expression of thanks.', 'Thank you.', 'Asante.', 'phrase', 'both', 'courtesy', 'Common Kikuyu phrases', 'reference-web', 'https://ithy.com/article/gikuyu-language-culture-overview-epir6lcd', 'Greetings/courtesy Wave A'),
  ('BATCH_KI_GREETINGS_WAVE_A_2026_02_27_A', 4, 'ki', 'Tigwo na wega', 'A farewell to the person staying behind.', 'Stay well; goodbye.', 'Baki salama; kwa heri.', 'phrase', 'both', 'courtesy', 'Common Kikuyu phrases', 'reference-web', 'https://ithy.com/article/gikuyu-language-culture-overview-epir6lcd', 'Greetings/courtesy Wave A'),
  ('BATCH_KI_GREETINGS_WAVE_A_2026_02_27_A', 5, 'ki', 'Thii na wega', 'A farewell to the person leaving.', 'Go well; goodbye.', 'Uende salama; kwa heri.', 'phrase', 'both', 'courtesy', 'Common Kikuyu phrases', 'reference-web', 'https://ithy.com/article/gikuyu-language-culture-overview-epir6lcd', 'Greetings/courtesy Wave A'),

  -- Dholuo wave A additions
  ('BATCH_LUO_GREETINGS_WAVE_A_2026_02_27_A', 1, 'luo', 'Oyawre', 'A morning greeting.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Common Luo phrases', 'reference-web', 'https://lughayangu.com/index.php/post/luo-love-wordsgreetingsdirections-and-basic-conversations', 'Greetings/courtesy Wave A'),
  ('BATCH_LUO_GREETINGS_WAVE_A_2026_02_27_A', 2, 'luo', 'Irio nade', 'An afternoon greeting.', 'Good afternoon.', 'Habari ya mchana.', 'phrase', 'both', 'greetings', 'Common Luo phrases', 'reference-web', 'https://lughayangu.com/index.php/post/luo-love-wordsgreetingsdirections-and-basic-conversations', 'Greetings/courtesy Wave A'),
  ('BATCH_LUO_GREETINGS_WAVE_A_2026_02_27_A', 3, 'luo', 'Oimore', 'An evening greeting.', 'Good evening.', 'Habari ya jioni.', 'phrase', 'both', 'greetings', 'Common Luo phrases', 'reference-web', 'https://lughayangu.com/index.php/post/luo-love-wordsgreetingsdirections-and-basic-conversations', 'Greetings/courtesy Wave A'),
  ('BATCH_LUO_GREETINGS_WAVE_A_2026_02_27_A', 4, 'luo', 'Otieno maber', 'A night-time farewell or greeting.', 'Good night.', 'Usiku mwema.', 'phrase', 'both', 'greetings', 'Common Luo phrases', 'reference-web', 'https://lughayangu.com/index.php/post/luo-love-wordsgreetingsdirections-and-basic-conversations', 'Greetings/courtesy Wave A'),
  ('BATCH_LUO_GREETINGS_WAVE_A_2026_02_27_A', 5, 'luo', 'In nade kawuono?', 'A greeting asking how someone is today.', 'How are you today?', 'Habari yako leo?', 'phrase', 'both', 'greetings', 'Common Luo phrases', 'reference-web', 'https://lughayangu.com/index.php/post/luo-love-wordsgreetingsdirections-and-basic-conversations', 'Greetings/courtesy Wave A'),
  ('BATCH_LUO_GREETINGS_WAVE_A_2026_02_27_A', 6, 'luo', 'An maber', 'A response meaning the speaker is doing well.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'greetings', 'Common Luo phrases', 'reference-web', 'https://lughayangu.com/index.php/post/luo-love-wordsgreetingsdirections-and-basic-conversations', 'Greetings/courtesy Wave A'),
  ('BATCH_LUO_GREETINGS_WAVE_A_2026_02_27_A', 7, 'luo', 'Bed gi odiochieng'' maber', 'A goodwill wish for the day ahead.', 'Have a good day.', 'Uwe na siku njema.', 'phrase', 'both', 'courtesy', 'Common Luo phrases', 'reference-web', 'https://lughayangu.com/index.php/post/luo-love-wordsgreetingsdirections-and-basic-conversations', 'Greetings/courtesy Wave A'),

  -- Kamba wave A additions
  ('BATCH_KAM_GREETINGS_WAVE_A_2026_02_27_A', 1, 'kam', 'Uvoo waku?', 'A general greeting or hello.', 'Hello.', 'Hujambo; salamu.', 'phrase', 'both', 'greetings', 'Common Kamba words and their meaning', 'reference-web', 'https://lughayangu.com/post/common-kamba-words-and-their-meaning', 'Greetings/courtesy Wave A'),
  ('BATCH_KAM_GREETINGS_WAVE_A_2026_02_27_A', 2, 'kam', 'Watindata ata?', 'An evening greeting.', 'Good evening.', 'Habari ya jioni.', 'phrase', 'both', 'greetings', 'Common Kamba words and their meaning', 'reference-web', 'https://lughayangu.com/post/common-kamba-words-and-their-meaning', 'Greetings/courtesy Wave A'),
  ('BATCH_KAM_GREETINGS_WAVE_A_2026_02_27_A', 3, 'kam', 'Uvoo wa muthenya?', 'An afternoon greeting.', 'Good afternoon.', 'Habari ya mchana.', 'phrase', 'both', 'greetings', 'Common Kamba words and their meaning', 'reference-web', 'https://lughayangu.com/post/common-kamba-words-and-their-meaning', 'Greetings/courtesy Wave A'),
  ('BATCH_KAM_GREETINGS_WAVE_A_2026_02_27_A', 4, 'kam', 'Wiiw''a ata umunthi?', 'A greeting asking how someone is today.', 'How are you today?', 'Habari yako leo?', 'phrase', 'both', 'greetings', 'Common Kamba words and their meaning', 'reference-web', 'https://lughayangu.com/post/common-kamba-words-and-their-meaning', 'Greetings/courtesy Wave A'),
  ('BATCH_KAM_GREETINGS_WAVE_A_2026_02_27_A', 5, 'kam', 'Ithiwa na muthenya museo', 'A goodwill wish for the day ahead.', 'Have a good day.', 'Uwe na siku njema.', 'phrase', 'both', 'courtesy', 'Common Kamba words and their meaning', 'reference-web', 'https://lughayangu.com/post/common-kamba-words-and-their-meaning', 'Greetings/courtesy Wave A'),
  ('BATCH_KAM_GREETINGS_WAVE_A_2026_02_27_A', 6, 'kam', 'Ni muvea', 'An expression of thanks.', 'Thank you.', 'Asante.', 'phrase', 'both', 'courtesy', 'Common Kamba words and their meaning', 'reference-web', 'https://lughayangu.com/post/common-kamba-words-and-their-meaning', 'Greetings/courtesy Wave A'),
  ('BATCH_KAM_GREETINGS_WAVE_A_2026_02_27_A', 7, 'kam', 'Wimuthokye', 'A welcoming response after thanks or arrival.', 'You are welcome.', 'Karibu.', 'phrase', 'both', 'courtesy', 'Common Kamba words and their meaning', 'reference-web', 'https://lughayangu.com/post/common-kamba-words-and-their-meaning', 'Greetings/courtesy Wave A'),
  ('BATCH_KAM_GREETINGS_WAVE_A_2026_02_27_A', 8, 'kam', 'Kwanya', 'A polite way to get attention or ask pardon.', 'Excuse me.', 'Samahani.', 'phrase', 'both', 'courtesy', 'Common Kamba words and their meaning', 'reference-web', 'https://lughayangu.com/post/common-kamba-words-and-their-meaning', 'Greetings/courtesy Wave A'),

  -- Luhya wave A additions
  ('BATCH_LUY_GREETINGS_WAVE_A_2026_02_27_A', 1, 'luy', 'Busheree mwana wanje', 'A morning greeting directed warmly to someone.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Common Abawanga(Luyha) greetings, phrases and their meaning', 'reference-web', 'https://lughayangu.com/post/greatings-directions-love-words-and-everyday-conversations-in-abawangaluhya-language', 'Greetings/courtesy Wave A'),
  ('BATCH_LUY_GREETINGS_WAVE_A_2026_02_27_A', 2, 'luy', 'Keshitere libukana', 'An afternoon greeting to a gathered group.', 'Good afternoon.', 'Habari ya mchana.', 'phrase', 'both', 'greetings', 'Common Abawanga(Luyha) greetings, phrases and their meaning', 'reference-web', 'https://lughayangu.com/post/greatings-directions-love-words-and-everyday-conversations-in-abawangaluhya-language', 'Greetings/courtesy Wave A'),
  ('BATCH_LUY_GREETINGS_WAVE_A_2026_02_27_A', 3, 'luy', 'Bwakhera mwesi bacheni befu', 'An evening greeting addressed to visitors or a group.', 'Good evening, our guests.', 'Habari ya jioni wageni wetu.', 'phrase', 'both', 'greetings', 'Common Abawanga(Luyha) greetings, phrases and their meaning', 'reference-web', 'https://lughayangu.com/post/greatings-directions-love-words-and-everyday-conversations-in-abawangaluhya-language', 'Greetings/courtesy Wave A'),
  ('BATCH_LUY_GREETINGS_WAVE_A_2026_02_27_A', 4, 'luy', 'Nobulayi khukutana inawe', 'A phrase used when meeting someone for the first time.', 'Nice to meet you.', 'Nimefurahi kukutana nawe.', 'phrase', 'both', 'courtesy', 'Common Abawanga(Luyha) greetings, phrases and their meaning', 'reference-web', 'https://lughayangu.com/post/greatings-directions-love-words-and-everyday-conversations-in-abawangaluhya-language', 'Greetings/courtesy Wave A'),
  ('BATCH_LUY_GREETINGS_WAVE_A_2026_02_27_A', 5, 'luy', 'Khulolane ambisa ano omwitsa', 'A farewell phrase used when parting for a short time.', 'See you soon, my friend.', 'Tutaonana karibuni, rafiki yangu.', 'phrase', 'both', 'courtesy', 'Common Abawanga(Luyha) greetings, phrases and their meaning', 'reference-web', 'https://lughayangu.com/post/greatings-directions-love-words-and-everyday-conversations-in-abawangaluhya-language', 'Greetings/courtesy Wave A'),

  -- Kalenjin wave A additions
  ('BATCH_KAL_GREETINGS_WAVE_A_2026_02_27_A', 1, 'kal', 'Kabi kabuya', 'A morning greeting used in Kalenjin subgroup speech.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'greetings', 'Common Kalenjin subgroup greetings', 'reference-web', 'https://worldschoolbooks.com/nandi-language/', 'Greetings/courtesy Wave A; cluster-sourced'),
  ('BATCH_KAL_GREETINGS_WAVE_A_2026_02_27_A', 2, 'kal', 'Chamngee nebo koskoliny', 'An evening greeting from Tugen phrase usage.', 'Good evening.', 'Habari ya jioni.', 'phrase', 'both', 'greetings', 'Common Tugen phrases', 'reference-web', 'https://lughayangu.com/post/common-tugen-phrases', 'Greetings/courtesy Wave A; cluster-sourced'),
  ('BATCH_KAL_GREETINGS_WAVE_A_2026_02_27_A', 3, 'kal', 'Chamngeenebo bet', 'An afternoon greeting from Tugen phrase usage.', 'Good afternoon.', 'Habari ya mchana.', 'phrase', 'both', 'greetings', 'Common Tugen phrases', 'reference-web', 'https://lughayangu.com/post/common-tugen-phrases', 'Greetings/courtesy Wave A; cluster-sourced'),
  ('BATCH_KAL_GREETINGS_WAVE_A_2026_02_27_A', 4, 'kal', 'Iyamune rani?', 'A greeting asking how someone is today.', 'How are you today?', 'Habari yako leo?', 'phrase', 'both', 'greetings', 'Common Tugen phrases', 'reference-web', 'https://lughayangu.com/post/common-tugen-phrases', 'Greetings/courtesy Wave A; cluster-sourced'),
  ('BATCH_KAL_GREETINGS_WAVE_A_2026_02_27_A', 5, 'kal', 'Tebii komyee', 'A goodwill wish for the day ahead.', 'Have a good day.', 'Uwe na siku njema.', 'phrase', 'both', 'courtesy', 'Common Tugen phrases', 'reference-web', 'https://lughayangu.com/post/common-tugen-phrases', 'Greetings/courtesy Wave A; cluster-sourced')
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
--   'BATCH_KI_GREETINGS_WAVE_A_2026_02_27_A',
--   'BATCH_LUO_GREETINGS_WAVE_A_2026_02_27_A',
--   'BATCH_KAM_GREETINGS_WAVE_A_2026_02_27_A',
--   'BATCH_LUY_GREETINGS_WAVE_A_2026_02_27_A',
--   'BATCH_KAL_GREETINGS_WAVE_A_2026_02_27_A'
-- )
-- group by batch_label, language_code
-- order by batch_label;
