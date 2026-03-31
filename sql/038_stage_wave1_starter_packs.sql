-- 038_stage_wave1_starter_packs.sql
-- Purpose:
-- Stage Wave 1 starter packs for newly registered standalone Kenyan languages
-- with the strongest immediately sourceable lexical surface.
--
-- Covered in this wave:
-- - pko (Pokot)
-- - sxb (Suba / Olusuba)
-- - orc (Orma)
--
-- Target per language:
-- - 10 starter words
-- - 5 starter phrases
--
-- Notes:
-- - These are curated starter packs for moderator and partner review.
-- - They are staged only and must still be validated and applied.

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- pko (Pokot) words
  ('BATCH_PKO_STARTER_2026_02_26_A', 1, 'pko', 'munda', 'Baby; a very young child.', 'baby', 'mtoto mchanga', 'noun', 'both', 'family', 'Pokot starter sources', 'reference-web', 'https://yellowmen.org/2014/07/01/pokot-dictionary/', 'Curated Wave 1 Pokot starter seed'),
  ('BATCH_PKO_STARTER_2026_02_26_A', 2, 'pko', 'moning', 'Child.', 'child', 'mtoto', 'noun', 'both', 'family', 'Pokot starter sources', 'reference-web', 'https://yellowmen.org/2014/07/01/pokot-dictionary/', 'Curated Wave 1 Pokot starter seed'),
  ('BATCH_PKO_STARTER_2026_02_26_A', 3, 'pko', 'muzei', 'Old man; elder.', 'old man; elder', 'mzee', 'noun', 'both', 'family', 'Pokot starter sources', 'reference-web', 'https://yellowmen.org/2014/07/01/pokot-dictionary/', 'Curated Wave 1 Pokot starter seed'),
  ('BATCH_PKO_STARTER_2026_02_26_A', 4, 'pko', 'chept-o', 'Girl.', 'girl', 'msichana', 'noun', 'both', 'family', 'Pokot starter sources', 'reference-web', 'https://yellowmen.org/2014/07/01/pokot-dictionary/', 'Curated Wave 1 Pokot starter seed'),
  ('BATCH_PKO_STARTER_2026_02_26_A', 5, 'pko', 'pap', 'Father.', 'father', 'baba', 'noun', 'both', 'family', 'Pokot starter sources', 'reference-web', 'https://yellowmen.org/2014/07/01/pokot-dictionary/', 'Curated Wave 1 Pokot starter seed'),
  ('BATCH_PKO_STARTER_2026_02_26_A', 6, 'pko', 'arun', 'Goat.', 'goat', 'mbuzi', 'noun', 'both', 'nature', 'Pokot starter sources', 'reference-web', 'https://yellowmen.org/2014/07/01/pokot-dictionary/', 'Curated Wave 1 Pokot starter seed'),
  ('BATCH_PKO_STARTER_2026_02_26_A', 7, 'pko', 'ngoror', 'Goats; plural form of goat.', 'goats', 'mbuzi', 'noun', 'both', 'nature', 'Pokot starter sources', 'reference-web', 'https://yellowmen.org/2014/07/01/pokot-dictionary/', 'Curated Wave 1 Pokot starter seed'),
  ('BATCH_PKO_STARTER_2026_02_26_A', 8, 'pko', 'skrio', 'Donkey.', 'donkey', 'punda', 'noun', 'both', 'nature', 'Pokot starter sources', 'reference-web', 'https://yellowmen.org/2014/07/01/pokot-dictionary/', 'Curated Wave 1 Pokot starter seed'),
  ('BATCH_PKO_STARTER_2026_02_26_A', 9, 'pko', 'tang', 'Cow.', 'cow', 'ngombe', 'noun', 'both', 'nature', 'Pokot starter sources', 'reference-web', 'https://yellowmen.org/2014/07/01/pokot-dictionary/', 'Curated Wave 1 Pokot starter seed'),
  ('BATCH_PKO_STARTER_2026_02_26_A', 10, 'pko', 'karam', 'Good, fine, or nice.', 'good; fine; nice', 'nzuri', 'adjective', 'both', 'culture', 'Pokot starter sources', 'reference-web', 'https://yellowmen.org/2014/07/01/pokot-dictionary/', 'Curated Wave 1 Pokot starter seed'),

  -- pko (Pokot) phrases
  ('BATCH_PKO_STARTER_2026_02_26_A', 11, 'pko', 'poisho?', 'A simple greeting used to say hello.', 'hello', 'salamu; habari', 'phrase', 'both', 'culture', 'Common Pokot phrases', 'reference-web', 'https://lughayangu.com/post/common-pokot-phrases-and-their-meaning', 'Curated Wave 1 Pokot starter seed'),
  ('BATCH_PKO_STARTER_2026_02_26_A', 12, 'pko', 'poisho nyii?', 'A conversational greeting asking how another person is doing.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'culture', 'Common Pokot phrases', 'reference-web', 'https://lughayangu.com/post/common-pokot-phrases-and-their-meaning', 'Curated Wave 1 Pokot starter seed'),
  ('BATCH_PKO_STARTER_2026_02_26_A', 13, 'pko', 'poisho nyoman', 'A reply meaning the speaker is fine or doing well.', 'I am fine.', 'Niko sawa.', 'phrase', 'both', 'culture', 'Common Pokot phrases', 'reference-web', 'https://lughayangu.com/post/common-pokot-phrases-and-their-meaning', 'Curated Wave 1 Pokot starter seed'),
  ('BATCH_PKO_STARTER_2026_02_26_A', 14, 'pko', 'soro', 'An expression of thanks.', 'thank you', 'asante', 'phrase', 'both', 'culture', 'Common Pokot phrases', 'reference-web', 'https://lughayangu.com/post/common-pokot-phrases-and-their-meaning', 'Curated Wave 1 Pokot starter seed'),
  ('BATCH_PKO_STARTER_2026_02_26_A', 15, 'pko', 'keriama kitee', 'A farewell meaning people will see each other later.', 'See you later.', 'Tutaonana baadaye.', 'phrase', 'both', 'culture', 'Common Pokot phrases', 'reference-web', 'https://lughayangu.com/post/common-pokot-phrases-and-their-meaning', 'Curated Wave 1 Pokot starter seed'),

  -- sxb (Suba) words
  ('BATCH_SXB_STARTER_2026_02_26_A', 1, 'sxb', 'amaveere', 'Milk.', 'milk', 'maziwa', 'noun', 'both', 'food', 'Common Suba phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Curated Wave 1 Suba starter seed'),
  ('BATCH_SXB_STARTER_2026_02_26_A', 2, 'sxb', 'abaana', 'Children.', 'children', 'watoto', 'noun', 'both', 'family', 'Common Suba phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Curated Wave 1 Suba starter seed'),
  ('BATCH_SXB_STARTER_2026_02_26_A', 3, 'sxb', 'buya', 'Good; fine.', 'good; fine', 'nzuri', 'adjective', 'both', 'culture', 'Common Suba phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Curated Wave 1 Suba starter seed'),
  ('BATCH_SXB_STARTER_2026_02_26_A', 4, 'sxb', 'okumanya', 'To know or understand.', 'to know', 'kujua', 'verb', 'both', 'education', 'Common Suba phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Curated Wave 1 Suba starter seed'),
  ('BATCH_SXB_STARTER_2026_02_26_A', 5, 'sxb', 'amiiso', 'Eyes.', 'eyes', 'macho', 'noun', 'both', 'body', 'Common Suba phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Curated Wave 1 Suba starter seed'),
  ('BATCH_SXB_STARTER_2026_02_26_A', 6, 'sxb', 'omugonchi', 'Beloved person; loved one.', 'beloved; loved one', 'mpenzi', 'noun', 'both', 'culture', 'Common Suba phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Curated Wave 1 Suba starter seed'),
  ('BATCH_SXB_STARTER_2026_02_26_A', 7, 'sxb', 'omukari', 'Wife.', 'wife', 'mke', 'noun', 'both', 'family', 'Common Suba phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Curated Wave 1 Suba starter seed'),
  ('BATCH_SXB_STARTER_2026_02_26_A', 8, 'sxb', 'ovugonchi', 'Love.', 'love', 'upendo', 'noun', 'both', 'culture', 'Common Suba phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Curated Wave 1 Suba starter seed'),
  ('BATCH_SXB_STARTER_2026_02_26_A', 9, 'sxb', 'erigoro', 'Day.', 'day', 'siku', 'noun', 'both', 'time', 'Common Suba phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Curated Wave 1 Suba starter seed'),
  ('BATCH_SXB_STARTER_2026_02_26_A', 10, 'sxb', 'enamba', 'Number.', 'number', 'nambari', 'noun', 'both', 'education', 'Common Suba phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Curated Wave 1 Suba starter seed'),

  -- sxb (Suba) phrases
  ('BATCH_SXB_STARTER_2026_02_26_A', 11, 'sxb', 'Wukiere', 'A greeting used in the morning.', 'Good morning.', 'Habari ya asubuhi.', 'phrase', 'both', 'culture', 'Common Suba phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Curated Wave 1 Suba starter seed'),
  ('BATCH_SXB_STARTER_2026_02_26_A', 12, 'sxb', 'Vurira', 'A greeting used in the evening.', 'Good evening.', 'Habari ya jioni.', 'phrase', 'both', 'culture', 'Common Suba phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Curated Wave 1 Suba starter seed'),
  ('BATCH_SXB_STARTER_2026_02_26_A', 13, 'sxb', 'Oramukiri igake?', 'A greeting asking how someone has woken up.', 'How have you woken up?', 'Umeamkaje?', 'phrase', 'both', 'culture', 'Common Suba phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Curated Wave 1 Suba starter seed'),
  ('BATCH_SXB_STARTER_2026_02_26_A', 14, 'sxb', 'Ndamukiri Vuroothu.', 'A reply meaning the speaker has woken up well.', 'I have woken up well.', 'Nimeamka salama.', 'phrase', 'both', 'culture', 'Common Suba phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Curated Wave 1 Suba starter seed'),
  ('BATCH_SXB_STARTER_2026_02_26_A', 15, 'sxb', 'Ekurinde.', 'A farewell expression used when parting.', 'Goodbye.', 'Kwa heri.', 'phrase', 'both', 'culture', 'Common Suba phrases', 'reference-web', 'https://lughayangu.com/post/common-suba-phrases-love-words-and-greetings', 'Curated Wave 1 Suba starter seed'),

  -- orc (Orma) words
  ('BATCH_ORC_STARTER_2026_02_26_A', 1, 'orc', 'bishaan', 'Water.', 'water', 'maji', 'noun', 'both', 'nature', 'Oromo starter sources for Orma review', 'reference-web', 'https://www.omniglot.com/language/phrases/oromo.htm', 'Curated Wave 1 Orma-aligned starter seed'),
  ('BATCH_ORC_STARTER_2026_02_26_A', 2, 'orc', 'mana', 'House or home.', 'house; home', 'nyumba', 'noun', 'both', 'home', 'Oromo starter sources for Orma review', 'reference-web', 'https://en.wikipedia.org/wiki/Oromo_language', 'Curated Wave 1 Orma-aligned starter seed'),
  ('BATCH_ORC_STARTER_2026_02_26_A', 3, 'orc', 'nama', 'A person; human being.', 'person', 'mtu', 'noun', 'both', 'family', 'Oromo starter sources for Orma review', 'reference-web', 'https://en.wikipedia.org/wiki/Oromo_language', 'Curated Wave 1 Orma-aligned starter seed'),
  ('BATCH_ORC_STARTER_2026_02_26_A', 4, 'orc', 'abbaa', 'Father.', 'father', 'baba', 'noun', 'both', 'family', 'Oromo starter sources for Orma review', 'reference-web', 'https://oromotoenglish.com/lessons/family-members', 'Curated Wave 1 Orma-aligned starter seed'),
  ('BATCH_ORC_STARTER_2026_02_26_A', 5, 'orc', 'haadha', 'Mother.', 'mother', 'mama', 'noun', 'both', 'family', 'Oromo starter sources for Orma review', 'reference-web', 'https://oromotoenglish.com/lessons/family-members', 'Curated Wave 1 Orma-aligned starter seed'),
  ('BATCH_ORC_STARTER_2026_02_26_A', 6, 'orc', 'daa''ima', 'Child or baby.', 'child; baby', 'mtoto', 'noun', 'both', 'family', 'Oromo starter sources for Orma review', 'reference-web', 'https://oromotoenglish.com/lessons/family-members', 'Curated Wave 1 Orma-aligned starter seed'),
  ('BATCH_ORC_STARTER_2026_02_26_A', 7, 'orc', 'nyaata', 'Food; meal.', 'food; meal', 'chakula', 'noun', 'both', 'food', 'Oromo starter sources for Orma review', 'reference-web', 'https://www.omniglot.com/language/phrases/oromo.htm', 'Curated Wave 1 Orma-aligned starter seed'),
  ('BATCH_ORC_STARTER_2026_02_26_A', 8, 'orc', 'aduu', 'Sun.', 'sun', 'jua', 'noun', 'both', 'nature', 'Oromo starter sources for Orma review', 'reference-web', 'https://en.wikipedia.org/wiki/Oromo_language', 'Curated Wave 1 Orma-aligned starter seed'),
  ('BATCH_ORC_STARTER_2026_02_26_A', 9, 'orc', 'roobaa', 'Rain.', 'rain', 'mvua', 'noun', 'both', 'nature', 'Oromo starter sources for Orma review', 'reference-web', 'https://www.omniglot.com/language/phrases/oromo.htm', 'Curated Wave 1 Orma-aligned starter seed'),
  ('BATCH_ORC_STARTER_2026_02_26_A', 10, 'orc', 'maqaa', 'Name.', 'name', 'jina', 'noun', 'both', 'culture', 'Oromo starter sources for Orma review', 'reference-web', 'https://www.omniglot.com/language/phrases/oromo.htm', 'Curated Wave 1 Orma-aligned starter seed'),

  -- orc (Orma) phrases
  ('BATCH_ORC_STARTER_2026_02_26_A', 11, 'orc', 'Akkam?', 'A common greeting used to say hello or ask how someone is.', 'Hello; how are you?', 'Habari?; hujambo?', 'phrase', 'both', 'culture', 'Oromo starter sources for Orma review', 'reference-web', 'https://www.omniglot.com/language/phrases/oromo.htm', 'Curated Wave 1 Orma-aligned starter seed'),
  ('BATCH_ORC_STARTER_2026_02_26_A', 12, 'orc', 'Jirtaa?', 'A conversational phrase asking how someone is doing.', 'How are you?', 'Habari yako?', 'phrase', 'both', 'culture', 'Oromo starter sources for Orma review', 'reference-web', 'https://www.omniglot.com/language/phrases/oromo.htm', 'Curated Wave 1 Orma-aligned starter seed'),
  ('BATCH_ORC_STARTER_2026_02_26_A', 13, 'orc', 'Nagaa.', 'A reply or greeting expressing peace and well-being.', 'I am fine; peace.', 'Niko salama; amani.', 'phrase', 'both', 'culture', 'Oromo starter sources for Orma review', 'reference-web', 'https://www.omniglot.com/language/phrases/oromo.htm', 'Curated Wave 1 Orma-aligned starter seed'),
  ('BATCH_ORC_STARTER_2026_02_26_A', 14, 'orc', 'Galatoomi.', 'An expression of thanks.', 'Thank you.', 'Asante.', 'phrase', 'both', 'culture', 'Oromo starter sources for Orma review', 'reference-web', 'https://www.omniglot.com/language/phrases/oromo.htm', 'Curated Wave 1 Orma-aligned starter seed'),
  ('BATCH_ORC_STARTER_2026_02_26_A', 15, 'orc', 'Nagaan buli.', 'A farewell or night blessing meaning sleep or remain in peace.', 'Good night; go in peace.', 'Usiku mwema; lala salama.', 'phrase', 'both', 'culture', 'Oromo starter sources for Orma review', 'reference-web', 'https://www.omniglot.com/language/phrases/oromo.htm', 'Curated Wave 1 Orma-aligned starter seed')
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
--   'BATCH_PKO_STARTER_2026_02_26_A',
--   'BATCH_SXB_STARTER_2026_02_26_A',
--   'BATCH_ORC_STARTER_2026_02_26_A'
-- )
-- group by batch_label, language_code
-- order by batch_label;
