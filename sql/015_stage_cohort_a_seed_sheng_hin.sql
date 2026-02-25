-- 015_stage_cohort_a_seed_sheng_hin.sql
-- Purpose:
-- Stage real starter entries (no placeholders) for:
-- - x-sheng
-- - x-ke-hin (Kenyan Hindustani)
--
-- Output batches:
-- - BATCH_SHENG_STARTER_2026_02_25_A
-- - BATCH_HIN_STARTER_2026_02_25_A

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- x-sheng
  ('BATCH_SHENG_STARTER_2026_02_25_A', 1, 'x-sheng', 'niaje', 'A common urban greeting meaning "what is up?" or "how are you?"', 'what is up?; how are you?', 'sasa?; habari?', 'phrase', 'informal', 'culture', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SHENG_STARTER_2026_02_25_A', 2, 'x-sheng', 'fiti', 'Fine; good; okay.', 'fine; good', 'nzuri', 'adjective', 'informal', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SHENG_STARTER_2026_02_25_A', 3, 'x-sheng', 'dem', 'A girl or young woman; also used for girlfriend in informal speech.', 'girl; young woman', 'msichana', 'noun', 'informal', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SHENG_STARTER_2026_02_25_A', 4, 'x-sheng', 'manzi', 'A girl or young woman in colloquial speech.', 'girl; young woman', 'msichana', 'noun', 'informal', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SHENG_STARTER_2026_02_25_A', 5, 'x-sheng', 'msee', 'A man; an older person; also used for "guy/dude" depending on context.', 'man; dude', 'jamaa; mzee', 'noun', 'informal', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SHENG_STARTER_2026_02_25_A', 6, 'x-sheng', 'wasee', 'People; guys; the group one belongs to.', 'people; guys', 'watu; jamaa', 'noun', 'informal', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SHENG_STARTER_2026_02_25_A', 7, 'x-sheng', 'mbogi', 'A crew, clique, or social group.', 'crew; clique', 'kundi; marafiki', 'noun', 'informal', 'culture', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SHENG_STARTER_2026_02_25_A', 8, 'x-sheng', 'chapaa', 'Money (colloquial).', 'money', 'pesa', 'noun', 'informal', 'business', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SHENG_STARTER_2026_02_25_A', 9, 'x-sheng', 'tao', 'Town center, especially the city CBD.', 'town; city center', 'mji; katikati ya jiji', 'noun', 'informal', 'business', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SHENG_STARTER_2026_02_25_A', 10, 'x-sheng', 'keja', 'Home or house.', 'home; house', 'nyumba; nyumbani', 'noun', 'informal', 'home', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SHENG_STARTER_2026_02_25_A', 11, 'x-sheng', 'rada', 'Awareness of what is going on; useful information.', 'awareness; information', 'taarifa; uelewa wa hali', 'noun', 'informal', 'culture', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_SHENG_STARTER_2026_02_25_A', 12, 'x-sheng', 'noma', 'Intense, difficult, or very impressive depending on context.', 'intense; difficult; impressive', 'kali; ngumu; ya kuvutia', 'adjective', 'informal', 'culture', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),

  -- x-ke-hin (Kenyan Hindustani)
  ('BATCH_HIN_STARTER_2026_02_25_A', 1, 'x-ke-hin', 'namaste', 'A respectful greeting used when meeting someone.', 'greeting', 'salamu', 'interjection', 'both', 'culture', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_HIN_STARTER_2026_02_25_A', 2, 'x-ke-hin', 'dhanyavaad', 'Thank you; expression of gratitude.', 'thank you', 'asante', 'interjection', 'both', 'culture', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_HIN_STARTER_2026_02_25_A', 3, 'x-ke-hin', 'chai', 'Tea, usually prepared hot.', 'tea', 'chai', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_HIN_STARTER_2026_02_25_A', 4, 'x-ke-hin', 'roti', 'Flatbread commonly eaten with vegetables or curry.', 'flatbread', 'mkate mwembamba', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_HIN_STARTER_2026_02_25_A', 5, 'x-ke-hin', 'dal', 'Cooked lentil dish; staple protein food.', 'lentil stew', 'mchuzi wa dengu', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_HIN_STARTER_2026_02_25_A', 6, 'x-ke-hin', 'masala', 'Spice blend used in cooking.', 'spice blend', 'mchanganyiko wa viungo', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_HIN_STARTER_2026_02_25_A', 7, 'x-ke-hin', 'dukaan', 'Shop or store.', 'shop; store', 'duka', 'noun', 'both', 'business', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_HIN_STARTER_2026_02_25_A', 8, 'x-ke-hin', 'bazaar', 'Market area where goods are sold.', 'market', 'soko', 'noun', 'both', 'business', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_HIN_STARTER_2026_02_25_A', 9, 'x-ke-hin', 'sabzi', 'Vegetables used for cooking.', 'vegetables', 'mboga', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_HIN_STARTER_2026_02_25_A', 10, 'x-ke-hin', 'mithai', 'Sweets or sweetmeats.', 'sweets', 'pipi; vitamu', 'noun', 'both', 'food', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_HIN_STARTER_2026_02_25_A', 11, 'x-ke-hin', 'dosti', 'Friendship; close social bond.', 'friendship', 'urafiki', 'noun', 'both', 'family', 'Kamusi curated starter', 'internal', null, 'Manual curated seed'),
  ('BATCH_HIN_STARTER_2026_02_25_A', 12, 'x-ke-hin', 'shanti', 'Peace; calm state without conflict.', 'peace', 'amani', 'noun', 'both', 'culture', 'Kamusi curated starter', 'internal', null, 'Manual curated seed')
on conflict do nothing;

commit;

-- Verification
-- select batch_label, language_code, count(*) as rows
-- from public.entry_import_staging
-- where batch_label in ('BATCH_SHENG_STARTER_2026_02_25_A', 'BATCH_HIN_STARTER_2026_02_25_A')
-- group by batch_label, language_code
-- order by batch_label;
