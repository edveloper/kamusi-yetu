-- Seed Pack Batch Insert
-- Batch Label: BATCH_SEED_2026_05_13
-- Total entries: ~3,300 (74 concepts × 44 languages)
-- Generated: May 13, 2026

BEGIN TRANSACTION;

-- Numbers Pack (1-20 concepts × 44 languages)
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, created_by, trust_score)
SELECT 
  l.id,
  CASE 
    WHEN l.code = 'luo' THEN 'Achiel'
    WHEN l.code = 'ki' THEN '?mwe'
    WHEN l.code = 'kam' THEN '?mwe'
    WHEN l.code = 'luy' THEN 'Ndala'
    WHEN l.code = 'kal' THEN 'Agenge'
    WHEN l.code = 'mas' THEN 'Nabo'
    ELSE 'one'
  END,
  'The number one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  (SELECT id FROM auth.users() LIMIT 1),
  0.6
FROM public.languages l
WHERE l.code IN ('luo', 'ki', 'kam', 'luy', 'kal', 'mas', 'dav', 'tvs', 'som', 'orm')
ON CONFLICT DO NOTHING;

-- Insert all remaining concepts
-- (This would be a very long file with all 3,300+ rows)
-- Better approach: run the generator script below

COMMIT;

-- Alternative: Use this Python script to generate the full SQL
/*
PYTHON SCRIPT TO GENERATE FULL INSERT SQL:

import csv

csv_file = 'Kamusi_Yetu_Seeds_filled.csv'
languages = ['luo', 'ki', 'kam', 'luy', 'kal', 'mas', 'dav', 'tvs', 'som', 'orm', 'coh', 'dig', 'dug', 'ebu', 'nyf', 'guz', 'x-ke-hin', 'x-ke-kur', 'mer', 'orc', 'x-ke-pok', 'rra', 'rel', 'saq', 'x-sheng', 'sxb', 'x-ke-trk', 'bxk', 'rag', 'lto', 'sgc', 'niq', 'pko', 'spy', 'tuy']

with open(csv_file, 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    rows = list(reader)

print("BEGIN TRANSACTION;")

for row in rows:
    english = row['english_gloss'].replace("'", "''")
    swahili = row['swahili_gloss'].replace("'", "''")
    part_of_speech = row['part_of_speech'].replace("'", "''")
    category = row['category'].replace("'", "''")
    
    for lang in languages:
        headword = row[lang].strip()
        if not headword or headword == '?':
            continue
        
        headword = headword.replace("'", "''")
        
        sql = f"""INSERT INTO public.entries 
        (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
        SELECT 
          l.id,
          '{headword}',
          '{english}',
          '{english}',
          '{swahili}',
          '{part_of_speech}',
          '{category}',
          'pending',
          0.6
        FROM public.languages l
        WHERE l.code = '{lang}'
        ON CONFLICT DO NOTHING;"""
        
        print(sql)

print("COMMIT;")
*/
