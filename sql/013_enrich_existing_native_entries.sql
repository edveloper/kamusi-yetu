-- 013_enrich_existing_native_entries.sql
-- Purpose:
-- Enrich existing native-language entries using vetted Phase 3 data you already reviewed.
-- - Updates existing rows by id (no new row insertion).
-- - Sets stronger English gloss + definition text.
-- - Optionally backfills Swahili translation through bridge_lexicon when unambiguous.

begin;

-- ==========================================
-- A) Curated enrichment for existing rows
-- ==========================================
with curated(id, english_translation, primary_definition) as (
  values
    -- Dholuo
    ('13b8e5df-57ff-4225-b73c-cdbf55a882eb'::uuid, 'bone; last born child (informal)', 'Formally means bone. Informally can also refer to the last-born child.'),
    ('bf1b03af-895a-48c8-a047-cd285e9c13db'::uuid, 'love', 'Love; the deep affection between people.'),
    ('f6d39c59-a9d6-4c53-b303-c0d7d66949b7'::uuid, 'ugali', 'Ugali; thick maize meal porridge often eaten with fish or meat.'),
    ('64686cef-12cb-4f46-b84b-c2924517718f'::uuid, 'hoe', 'A hoe; a primary tool for traditional farming.'),
    ('5a4008d7-5010-49f5-9c23-d590b003c45b'::uuid, 'God', 'God; provider of life.'),
    ('1647de4d-4c83-44b1-8fd4-52b3550cef3a'::uuid, 'fish', 'Fish; a central staple of the Luo diet and economy.'),
    ('01f47971-63ee-4a5e-adcb-abc4a2447749'::uuid, 'medicine', 'Medicine; traditionally derived from trees and herbs.'),

    -- Kalenjin
    ('adc61237-1ebf-4ed1-a46f-7a107a7f1254'::uuid, 'sun', 'The sun; historically representing the Supreme Being.'),
    ('e8f6cab3-e2de-4581-9eaf-7cb0a6ed51a9'::uuid, 'traditional fireplace; hearth', 'A traditional fireplace or hearth; center of the home.'),
    ('fb64af12-635f-4052-bd0d-0a3f96ea0f80'::uuid, 'ugali', 'Ugali; a primary source of energy.'),
    ('c7d2dbca-6af1-4757-81d8-cc2a899c8d5c'::uuid, 'white', 'White; also found in personal names describing light complexion.'),
    ('ae921b08-8ca8-4a36-834e-f1db1afcebd6'::uuid, 'life', 'Life; the state of being alive.'),
    ('9b208721-aadb-43da-8f49-602286065d4b'::uuid, 'how are you?', 'How are you? A common greeting.'),
    ('b068eb8b-1725-4fa3-bc25-5ba23f4f35d0'::uuid, 'cow', 'A cow; central unit of wealth and culture.'),

    -- Kamba
    ('85a32968-6765-4b59-bfd4-c64432e407b3'::uuid, 'traditional basket; kiondo', 'A traditional basket (kiondo), known for intricate weaving.'),
    ('528c40a4-2cf2-4cbd-b457-3db9fab16240'::uuid, 'water', 'Water; an essential resource in semi-arid Kamba lands.'),
    ('04c95e4c-6010-43e1-9e52-34b6f15c6450'::uuid, 'elder', 'An elder; a person of wisdom and community standing.'),
    ('14a21302-48ba-4441-8756-fbc80b6c6e4e'::uuid, 'mother', 'Mother; a term of high respect for maternal figures.'),
    ('f51343ef-4fd0-4db9-b6f2-254fa04a8105'::uuid, 'beehive', 'A beehive; honey is a significant cultural and economic product.'),

    -- Luhya
    ('4d8d921d-82d3-41a5-b178-4f89aba17d9f'::uuid, 'children', 'Children; offspring of a family.'),
    ('1c6f8d92-f776-405f-9c4e-968bab7ad7a1'::uuid, 'home', 'Home; the central place of belonging.'),
    ('3929534c-903a-4000-aa91-5ea35caebab3'::uuid, 'chicken', 'Chicken; a culturally important dish for welcoming guests.'),
    ('88913718-a2f2-4749-999c-fcb493a2ac4b'::uuid, 'peace greeting', 'A greeting meaning peace; philosophy of peaceful coexistence.'),
    ('0acf66b1-effd-49b0-b38a-c29d8c3ac8f2'::uuid, 'farmer', 'A farmer; one who works the soil.'),
    ('12e373b6-9795-4e21-9fa6-a253d40292ea'::uuid, 'unity', 'Unity; coming together as one.'),
    ('dff94a06-9966-45b3-9938-dcceee6b5351'::uuid, 'how are you?', 'How are you? A common greeting.')
)
update public.entries e
set
  english_translation = c.english_translation,
  primary_definition = c.primary_definition,
  updated_at = now()
from curated c
where e.id = c.id;

-- ==========================================
-- B) Backfill SW translation from bridge_lexicon
-- ==========================================
-- For enriched rows still missing swahili_translation:
-- english_translation -> bridge_lexicon.english_term -> swahili_term
-- only when exactly one candidate exists.

with target_rows as (
  select e.id, e.english_translation
  from public.entries e
  where e.id in (
    '13b8e5df-57ff-4225-b73c-cdbf55a882eb'::uuid,
    'bf1b03af-895a-48c8-a047-cd285e9c13db'::uuid,
    'f6d39c59-a9d6-4c53-b303-c0d7d66949b7'::uuid,
    '64686cef-12cb-4f46-b84b-c2924517718f'::uuid,
    '5a4008d7-5010-49f5-9c23-d590b003c45b'::uuid,
    '1647de4d-4c83-44b1-8fd4-52b3550cef3a'::uuid,
    '01f47971-63ee-4a5e-adcb-abc4a2447749'::uuid,
    'adc61237-1ebf-4ed1-a46f-7a107a7f1254'::uuid,
    'e8f6cab3-e2de-4581-9eaf-7cb0a6ed51a9'::uuid,
    'fb64af12-635f-4052-bd0d-0a3f96ea0f80'::uuid,
    'c7d2dbca-6af1-4757-81d8-cc2a899c8d5c'::uuid,
    'ae921b08-8ca8-4a36-834e-f1db1afcebd6'::uuid,
    '9b208721-aadb-43da-8f49-602286065d4b'::uuid,
    'b068eb8b-1725-4fa3-bc25-5ba23f4f35d0'::uuid,
    '85a32968-6765-4b59-bfd4-c64432e407b3'::uuid,
    '528c40a4-2cf2-4cbd-b457-3db9fab16240'::uuid,
    '04c95e4c-6010-43e1-9e52-34b6f15c6450'::uuid,
    '14a21302-48ba-4441-8756-fbc80b6c6e4e'::uuid,
    'f51343ef-4fd0-4db9-b6f2-254fa04a8105'::uuid,
    '4d8d921d-82d3-41a5-b178-4f89aba17d9f'::uuid,
    '1c6f8d92-f776-405f-9c4e-968bab7ad7a1'::uuid,
    '3929534c-903a-4000-aa91-5ea35caebab3'::uuid,
    '88913718-a2f2-4749-999c-fcb493a2ac4b'::uuid,
    '0acf66b1-effd-49b0-b38a-c29d8c3ac8f2'::uuid,
    '12e373b6-9795-4e21-9fa6-a253d40292ea'::uuid,
    'dff94a06-9966-45b3-9938-dcceee6b5351'::uuid
  )
    and nullif(trim(coalesce(e.swahili_translation, '')), '') is null
    and nullif(trim(coalesce(e.english_translation, '')), '') is not null
),
candidates as (
  select
    t.id as entry_id,
    b.swahili_term,
    row_number() over (
      partition by t.id
      order by b.confidence desc, b.updated_at desc, b.created_at desc
    ) as rn,
    count(*) over (partition by t.id) as cnt
  from target_rows t
  join public.bridge_lexicon b
    on b.normalized_english = lower(trim(regexp_replace(t.english_translation, '\s+', ' ', 'g')))
)
update public.entries e
set
  swahili_translation = c.swahili_term,
  updated_at = now()
from candidates c
where e.id = c.entry_id
  and c.rn = 1
  and c.cnt = 1;

commit;

-- Verification:
-- select id, headword, english_translation, swahili_translation, primary_definition
-- from public.entries
-- where id in (
--   '13b8e5df-57ff-4225-b73c-cdbf55a882eb'::uuid,
--   'bf1b03af-895a-48c8-a047-cd285e9c13db'::uuid,
--   'f6d39c59-a9d6-4c53-b303-c0d7d66949b7'::uuid,
--   '64686cef-12cb-4f46-b84b-c2924517718f'::uuid,
--   '5a4008d7-5010-49f5-9c23-d590b003c45b'::uuid,
--   '1647de4d-4c83-44b1-8fd4-52b3550cef3a'::uuid,
--   '01f47971-63ee-4a5e-adcb-abc4a2447749'::uuid,
--   'adc61237-1ebf-4ed1-a46f-7a107a7f1254'::uuid,
--   'e8f6cab3-e2de-4581-9eaf-7cb0a6ed51a9'::uuid,
--   'fb64af12-635f-4052-bd0d-0a3f96ea0f80'::uuid,
--   'c7d2dbca-6af1-4757-81d8-cc2a899c8d5c'::uuid,
--   'ae921b08-8ca8-4a36-834e-f1db1afcebd6'::uuid,
--   '9b208721-aadb-43da-8f49-602286065d4b'::uuid,
--   'b068eb8b-1725-4fa3-bc25-5ba23f4f35d0'::uuid,
--   '85a32968-6765-4b59-bfd4-c64432e407b3'::uuid,
--   '528c40a4-2cf2-4cbd-b457-3db9fab16240'::uuid,
--   '04c95e4c-6010-43e1-9e52-34b6f15c6450'::uuid,
--   '14a21302-48ba-4441-8756-fbc80b6c6e4e'::uuid,
--   'f51343ef-4fd0-4db9-b6f2-254fa04a8105'::uuid,
--   '4d8d921d-82d3-41a5-b178-4f89aba17d9f'::uuid,
--   '1c6f8d92-f776-405f-9c4e-968bab7ad7a1'::uuid,
--   '3929534c-903a-4000-aa91-5ea35caebab3'::uuid,
--   '88913718-a2f2-4749-999c-fcb493a2ac4b'::uuid,
--   '0acf66b1-effd-49b0-b38a-c29d8c3ac8f2'::uuid,
--   '12e373b6-9795-4e21-9fa6-a253d40292ea'::uuid,
--   'dff94a06-9966-45b3-9938-dcceee6b5351'::uuid
-- )
-- order by headword;
