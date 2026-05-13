BEGIN TRANSACTION;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Guok',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbwa',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbwa',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Embwa',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwambei',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olgirash',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbwa',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbwa',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Eey',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Saree',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbwa',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbwa',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbwa',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbwa',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbwa',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Embwa',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuttaa',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbwa',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olgirash',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbwa',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekuwan',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Embwa',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbwa',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwambei',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwambei',
  'dog',
  'dog',
  'mbwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Paka',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Paka',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Paka',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Epaka',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Paka',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olpusati',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Paka',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Paka',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bisad',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aduruu',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Paka',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Paka',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Paka',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Paka',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Paka',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Epaka',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Billi',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Paka',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olpusati',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Paka',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekuwan naitore',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Epaka',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Paka',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Paka',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Paka',
  'cat',
  'cat',
  'paka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Winyo',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndege',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndege',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Endege',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lelwet',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndege',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndege',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shimbir',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Simbiroo',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndege',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndege',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndege',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndege',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndege',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Endege',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chidhiya',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndege',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndege',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekolong',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Endege',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndege',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lelwet',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lelwet',
  'bird',
  'bird',
  'ndege',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhiang''',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''ombe',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''ombe',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Eng''ombe',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inkimet',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nkishu',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''ombe',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''ombe',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lo''',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sa''a',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''ombe',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''ombe',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''ombe',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''ombe',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''ombe',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Eng''ombe',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gaay',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''ombe',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nkishu',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''ombe',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Naitore',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Eng''ombe',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''ombe',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inkimet',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inkimet',
  'cow',
  'cow',
  'ng''ombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Diel',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbuzi',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbuzi',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Embuzi',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Imeet',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkine',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbuzi',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbuzi',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ri''o',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Re''ee',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbuzi',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbuzi',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbuzi',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbuzi',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbuzi',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Embuzi',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bakri',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbuzi',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkine',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbuzi',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ebei',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Embuzi',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbuzi',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Imeet',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Imeet',
  'goat',
  'goat',
  'mbuzi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rombo',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kondoo',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndoo',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekondoo',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maina',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kondoo',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kondoo',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ido',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hoolaa',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kondoo',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kondoo',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kondoo',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kondoo',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kondoo',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekondoo',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bhed',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kondoo',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kondoo',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekwara',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekondoo',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kondoo',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maina',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maina',
  'sheep',
  'sheep',
  'kondoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rech',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Samaki',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Samaki',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Esamaki',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Engek',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Samaki',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Samaki',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kalluun',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Qurxummii',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Samaki',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Samaki',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Samaki',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Samaki',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Samaki',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Esamaki',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Machli',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Samaki',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Samaki',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Engorok',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Esamaki',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Samaki',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Engek',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Engek',
  'fish',
  'fish',
  'samaki',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Thuol',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyoka',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyoka',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enyoka',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Embolio',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Oltim',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyoka',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyoka',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Abeeso',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bofa',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyoka',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyoka',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyoka',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyoka',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyoka',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enyoka',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Saamp',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyoka',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Oltim',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyoka',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Engiro',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enyoka',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyoka',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Embolio',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Embolio',
  'snake',
  'snake',
  'nyoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sibuor',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Simba',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Simba',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Esimba',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wareng',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olngatiata',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Simba',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Simba',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Libaax',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Leencaa',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Simba',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Simba',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Simba',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Simba',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Simba',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Esimba',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sher',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Simba',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olngatiata',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Simba',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngatuny',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Esimba',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Simba',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wareng',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wareng',
  'lion',
  'lion',
  'simba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lak',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndovu',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nduu',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enjovu',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tui',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Oltome',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tembo',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tembo',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Marood',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Arbaa',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tembo',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tembo',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tembo',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndovu',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tembo',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enjovu',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Haathi',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndovu',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Oltome',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tembo / Ndovu',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Etom',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enjovu',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tembo',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tui',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tui',
  'elephant',
  'elephant',
  'tembo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mchele',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?ceere',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?ceere',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omucere',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wali',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wali',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wali / Mchele',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wali',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bariis',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ruuzii',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wali',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wali',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wali',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?ceere',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wali',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omosima',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chaval',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?ceere',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wali',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wali',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wali',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omucere',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wali',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wali',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wali',
  'rice',
  'rice',
  'wali/mchele',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?kate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?kate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omukate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rootii',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daabboo',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?kate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omokate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Roti / Bread',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?kate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omukate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkate',
  'bread',
  'bread',
  'mkate',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pi',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maa?',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ma?',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amayi',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''etit',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkare',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maji',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maji',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Biyo',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bishaan',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maji',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maji',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maji',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maa?',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maji',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amache',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Paani',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maa?',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkare',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maji',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akuj',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amayi',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maji',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''etit',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''etit',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''atuk',
  'water',
  'water',
  'maji',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chak',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?kwa',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?kwa',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amafi',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mamus',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkushu',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maziwa',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maziwa',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Caano',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aannan',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maziwa',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maziwa',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maziwa',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?kwa',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maziwa',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amache',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Doodh',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?kwa',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkushu',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maziwa',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekicholong',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amafi',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maziwa',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mamus',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mamus',
  'milk',
  'milk',
  'maziwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ringo',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyama',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyama',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enyama',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chemeli',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkima',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyama',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyama',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hilib',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Foon',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyama',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyama',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyama',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyama',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyama',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enyama',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gosht',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyama',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkima',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyama',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ebeya',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enyama',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyama',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chemeli',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chemeli',
  'meat',
  'meat',
  'nyama',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Alot',
  'vegetables',
  'vegetables',
  'mboga',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?boga',
  'vegetables',
  'vegetables',
  'mboga',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mboga',
  'vegetables',
  'vegetables',
  'mboga',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Emboga',
  'vegetables',
  'vegetables',
  'mboga',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mboga',
  'vegetables',
  'vegetables',
  'mboga',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mboga',
  'vegetables',
  'vegetables',
  'mboga',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mboga',
  'vegetables',
  'vegetables',
  'mboga',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mboga',
  'vegetables',
  'vegetables',
  'mboga',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Khudaar',
  'vegetables',
  'vegetables',
  'mboga',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Muduraa',
  'vegetables',
  'vegetables',
  'mboga',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mboga',
  'vegetables',
  'vegetables',
  'mboga',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mboga',
  'vegetables',
  'vegetables',
  'mboga',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mboga',
  'vegetables',
  'vegetables',
  'mboga',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?boga',
  'vegetables',
  'vegetables',
  'mboga',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mboga',
  'vegetables',
  'vegetables',
  'mboga',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Emboga',
  'vegetables',
  'vegetables',
  'mboga',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sabzi',
  'vegetables',
  'vegetables',
  'mboga',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?boga',
  'vegetables',
  'vegetables',
  'mboga',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mboga',
  'vegetables',
  'vegetables',
  'mboga',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Emboga',
  'vegetables',
  'vegetables',
  'mboga',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mboga',
  'vegetables',
  'vegetables',
  'mboga',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olemo',
  'fruit',
  'fruit',
  'matunda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tunda',
  'fruit',
  'fruit',
  'matunda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tunda',
  'fruit',
  'fruit',
  'matunda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Etunda',
  'fruit',
  'fruit',
  'matunda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tunda',
  'fruit',
  'fruit',
  'matunda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'fruit',
  'fruit',
  'matunda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tunda / Matunda',
  'fruit',
  'fruit',
  'matunda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Matunda',
  'fruit',
  'fruit',
  'matunda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Khudaar macaan',
  'fruit',
  'fruit',
  'matunda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Fuduraa',
  'fruit',
  'fruit',
  'matunda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tunda',
  'fruit',
  'fruit',
  'matunda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tunda',
  'fruit',
  'fruit',
  'matunda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tunda',
  'fruit',
  'fruit',
  'matunda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tunda',
  'fruit',
  'fruit',
  'matunda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tunda',
  'fruit',
  'fruit',
  'matunda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Etunda',
  'fruit',
  'fruit',
  'matunda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Phal',
  'fruit',
  'fruit',
  'matunda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tunda',
  'fruit',
  'fruit',
  'matunda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Matunda',
  'fruit',
  'fruit',
  'matunda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Etunda',
  'fruit',
  'fruit',
  'matunda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tunda',
  'fruit',
  'fruit',
  'matunda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moo kich',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?ki',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?ki',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Uki',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mees',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Asali',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Asali',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Malab',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Damma',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Asali',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Asali',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Asali',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?ki',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Asali',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Oboaki',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shahad',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?ki',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Asali',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Emoru',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Uki',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Asali',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mees',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mees',
  'honey',
  'honey',
  'asali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chumbi',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chumvi',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nguu',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omunguu',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kimyet',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chumvi',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chumvi',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Cusbo',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soogidda',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chumvi',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chumvi',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chumvi',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chumvi',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chumvi',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omonguu',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Namak',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chumvi',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chumvi',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngatuk',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omunguu',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chumvi',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kimyet',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kimyet',
  'salt',
  'salt',
  'chumvi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mach',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwaki',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwaki',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omuliro',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngechek',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkidong''oi',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moto',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moto',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dab',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ibiddaa',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moto',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moto',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moto',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwaki',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moto',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omotooro',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aag',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwaki',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkidong''oi',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moto',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekeny',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omuliro',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moto',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngechek',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngechek',
  'fire',
  'fire',
  'moto',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wich',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?twe',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?twe',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omutwe',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kweet',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Engare',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kichwa',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kichwa',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Madax',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mataa',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kichwa',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kichwa',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kichwa',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?twe',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kichwa',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omosesa',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sar',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?twe',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Engolong',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kichwa / Dome',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Apuro',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omutwe',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kichwa',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kweet',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kweet',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akwaar',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kweet',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kweet',
  'head',
  'head',
  'kichwa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wang''',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Itho',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?tho',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Eliho',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moek',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkit',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Macho',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Macho',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Indhaha',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ija',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Macho',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Macho',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Macho',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?tho',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Macho',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amariiso',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aankhein',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?tho',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkit',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Macho',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekapu',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Eliho',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Macho',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moek',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moek',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aker',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moek',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moek',
  'eyes',
  'eyes',
  'macho',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'It',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?th?',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?th?',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Elimbe',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kurunet',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiitoi',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Masikio',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Masikio',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhegaha',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gurra',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Masikio',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Masikio',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Masikio',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?th?',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Masikio',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amoseke',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kaan',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?th?',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiitoi',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Masikio',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngikamarin',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Elimbe',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Masikio',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kurunet',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kurunet',
  'ears',
  'ears',
  'masikio',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Um',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Iny?',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?ny?',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inywe',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nguung',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkuuo',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pua',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pua',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'San',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Funyoo',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pua',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pua',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pua',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?ny?',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pua',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Empua',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Naak',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?ny?',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nkuuo',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pua',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekudu',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inywe',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pua',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nguung',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nguung',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nguung',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nguung',
  'nose',
  'nose',
  'pua',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhok',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kanua',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kanua',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olunwa',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nguut',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mdomo',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mdomo',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Afka',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Afaan',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mdomo',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mdomo',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mdomo',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kanua',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mdomo',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omonwa',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Munh',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kanua',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mdomo',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngikapur',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olunwa',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mdomo',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nguut',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nguut',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nguut',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nguut',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lak',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?no',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?no',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amino',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''omiet',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkilit',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Meno',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Meno',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ilkaha',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ilkaan',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Meno',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Meno',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Meno',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?no',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Meno',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ameno',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daant',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?no',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkilit',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Meno',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngikabang',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amino',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Meno',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''omiet',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''omiet',
  'teeth',
  'teeth',
  'meno',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lep',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'R?r?mi',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?limi',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olulimi',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Arawet',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ulimi',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ulimi',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Carrab',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Arraba',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ulimi',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ulimi',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ulimi',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?limi',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ulimi',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Orulimi',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jeebh',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?limi',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ulimi',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Elongit',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olulimi',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ulimi',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Arawet',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Arawet',
  'tongue',
  'tongue',
  'ulimi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olok',
  'throat',
  'throat',
  'koo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koo',
  'throat',
  'throat',
  'koo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koo',
  'throat',
  'throat',
  'koo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Okoo',
  'throat',
  'throat',
  'koo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ang''etunet',
  'throat',
  'throat',
  'koo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'throat',
  'throat',
  'koo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koo',
  'throat',
  'throat',
  'koo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koo',
  'throat',
  'throat',
  'koo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Cundhur',
  'throat',
  'throat',
  'koo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Qoonqee',
  'throat',
  'throat',
  'koo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koo',
  'throat',
  'throat',
  'koo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koo',
  'throat',
  'throat',
  'koo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koo',
  'throat',
  'throat',
  'koo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koo',
  'throat',
  'throat',
  'koo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koo',
  'throat',
  'throat',
  'koo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Okoo',
  'throat',
  'throat',
  'koo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gala',
  'throat',
  'throat',
  'koo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koo',
  'throat',
  'throat',
  'koo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koo',
  'throat',
  'throat',
  'koo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Okoo',
  'throat',
  'throat',
  'koo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koo',
  'throat',
  'throat',
  'koo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bat',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?guoko',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?kono',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amikono',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngalek',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mikono',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mikono',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gacmaha',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Harki',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mikono',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mikono',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mikono',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?guoko',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mikono',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amokono',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Haath',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?guoko',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mikono',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngakimuj',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amikono',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mikono',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngalek',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngalek',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngalek',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngalek',
  'hands',
  'hands',
  'mikono',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tielo',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?guu',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?guu',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amagulu',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suk',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Miguu',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Miguu',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Cagaha',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Miila',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Miguu',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Miguu',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Miguu',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?guu',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Miguu',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amagoro',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Paer',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?guu',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Miguu',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngikapur',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amagulu',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Miguu',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suk',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suk',
  'feet',
  'feet',
  'miguu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Eshati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shaati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Eshati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamiiz',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Eshati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shati',
  'shirt',
  'shirt',
  'shati',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Esuruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Surwaal',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruurii',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Esuruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Patloon',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali / Traus',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Esuruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suruali',
  'trousers',
  'trousers',
  'suruali',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gauni',
  'dress',
  'dress',
  'gauni',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gauni',
  'dress',
  'dress',
  'gauni',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gauni',
  'dress',
  'dress',
  'gauni',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Egauni',
  'dress',
  'dress',
  'gauni',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gauni',
  'dress',
  'dress',
  'gauni',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'dress',
  'dress',
  'gauni',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gauni',
  'dress',
  'dress',
  'gauni',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gauni',
  'dress',
  'dress',
  'gauni',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gawaan',
  'dress',
  'dress',
  'gauni',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Uffata',
  'dress',
  'dress',
  'gauni',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gauni',
  'dress',
  'dress',
  'gauni',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gauni',
  'dress',
  'dress',
  'gauni',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gauni',
  'dress',
  'dress',
  'gauni',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gauni',
  'dress',
  'dress',
  'gauni',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gauni',
  'dress',
  'dress',
  'gauni',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Egauni',
  'dress',
  'dress',
  'gauni',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Frok',
  'dress',
  'dress',
  'gauni',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gauni',
  'dress',
  'dress',
  'gauni',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gauni',
  'dress',
  'dress',
  'gauni',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Egauni',
  'dress',
  'dress',
  'gauni',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gauni',
  'dress',
  'dress',
  'gauni',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kofia',
  'hat',
  'hat',
  'kofia',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kofiya',
  'hat',
  'hat',
  'kofia',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kofiya',
  'hat',
  'hat',
  'kofia',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekofia',
  'hat',
  'hat',
  'kofia',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kofia',
  'hat',
  'hat',
  'kofia',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'hat',
  'hat',
  'kofia',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kofia',
  'hat',
  'hat',
  'kofia',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kofia',
  'hat',
  'hat',
  'kofia',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koofiyad',
  'hat',
  'hat',
  'kofia',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Fokkotaa',
  'hat',
  'hat',
  'kofia',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kofia',
  'hat',
  'hat',
  'kofia',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kofia',
  'hat',
  'hat',
  'kofia',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kofia',
  'hat',
  'hat',
  'kofia',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kofiya',
  'hat',
  'hat',
  'kofia',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kofia',
  'hat',
  'hat',
  'kofia',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekofia',
  'hat',
  'hat',
  'kofia',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Topi',
  'hat',
  'hat',
  'kofia',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kofiya',
  'hat',
  'hat',
  'kofia',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kofia',
  'hat',
  'hat',
  'kofia',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekofia',
  'hat',
  'hat',
  'kofia',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kofia',
  'hat',
  'hat',
  'kofia',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wuoch',
  'shoe',
  'shoe',
  'kiapu/viatu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kiatu',
  'shoe',
  'shoe',
  'kiapu/viatu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kiatu',
  'shoe',
  'shoe',
  'kiapu/viatu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekiatu',
  'shoe',
  'shoe',
  'kiapu/viatu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kiatu',
  'shoe',
  'shoe',
  'kiapu/viatu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'shoe',
  'shoe',
  'kiapu/viatu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kiatu',
  'shoe',
  'shoe',
  'kiapu/viatu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kiatu',
  'shoe',
  'shoe',
  'kiapu/viatu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kab',
  'shoe',
  'shoe',
  'kiapu/viatu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kophee',
  'shoe',
  'shoe',
  'kiapu/viatu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kiatu',
  'shoe',
  'shoe',
  'kiapu/viatu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kiatu',
  'shoe',
  'shoe',
  'kiapu/viatu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kiatu',
  'shoe',
  'shoe',
  'kiapu/viatu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kiatu',
  'shoe',
  'shoe',
  'kiapu/viatu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kiatu',
  'shoe',
  'shoe',
  'kiapu/viatu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekiatu',
  'shoe',
  'shoe',
  'kiapu/viatu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Juta',
  'shoe',
  'shoe',
  'kiapu/viatu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kiatu',
  'shoe',
  'shoe',
  'kiapu/viatu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kiatu / Shoe',
  'shoe',
  'shoe',
  'kiapu/viatu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekiatu',
  'shoe',
  'shoe',
  'kiapu/viatu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kiatu',
  'shoe',
  'shoe',
  'kiapu/viatu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ejaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaakeet',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaakeetii',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ejaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jacket',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ejaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaketi',
  'jacket',
  'jacket',
  'jaketi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koti',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koti',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koti',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekoti',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koti',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koti',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koti',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koti',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kood',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kootii',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koti',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koti',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koti',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koti',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koti',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekoti',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Coat',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koti',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koti',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koti / Coat',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koti',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekoti',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koti',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koti',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koti',
  'coat',
  'coat',
  'koti',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kitambaa',
  'scarf',
  'scarf',
  'kanga/kitambaa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kitambaa',
  'scarf',
  'scarf',
  'kanga/kitambaa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kitambaa',
  'scarf',
  'scarf',
  'kanga/kitambaa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekitambaa',
  'scarf',
  'scarf',
  'kanga/kitambaa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kitambaa',
  'scarf',
  'scarf',
  'kanga/kitambaa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'scarf',
  'scarf',
  'kanga/kitambaa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kitambaa / Kanga',
  'scarf',
  'scarf',
  'kanga/kitambaa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kitambaa',
  'scarf',
  'scarf',
  'kanga/kitambaa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shaalin',
  'scarf',
  'scarf',
  'kanga/kitambaa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suphee',
  'scarf',
  'scarf',
  'kanga/kitambaa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kitambaa',
  'scarf',
  'scarf',
  'kanga/kitambaa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kitambaa',
  'scarf',
  'scarf',
  'kanga/kitambaa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kitambaa',
  'scarf',
  'scarf',
  'kanga/kitambaa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kitambaa',
  'scarf',
  'scarf',
  'kanga/kitambaa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kitambaa',
  'scarf',
  'scarf',
  'kanga/kitambaa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekitambaa',
  'scarf',
  'scarf',
  'kanga/kitambaa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dupatta / Scarf',
  'scarf',
  'scarf',
  'kanga/kitambaa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kitambaa',
  'scarf',
  'scarf',
  'kanga/kitambaa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kitambaa',
  'scarf',
  'scarf',
  'kanga/kitambaa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekitambaa',
  'scarf',
  'scarf',
  'kanga/kitambaa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kitambaa',
  'scarf',
  'scarf',
  'kanga/kitambaa',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkanda',
  'belt',
  'belt',
  'upinde/mkanda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?kanda',
  'belt',
  'belt',
  'upinde/mkanda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkanda',
  'belt',
  'belt',
  'upinde/mkanda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omukanda',
  'belt',
  'belt',
  'upinde/mkanda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkanda',
  'belt',
  'belt',
  'upinde/mkanda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'belt',
  'belt',
  'upinde/mkanda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkanda',
  'belt',
  'belt',
  'upinde/mkanda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkanda',
  'belt',
  'belt',
  'upinde/mkanda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suun',
  'belt',
  'belt',
  'upinde/mkanda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Garbaannoo',
  'belt',
  'belt',
  'upinde/mkanda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkanda',
  'belt',
  'belt',
  'upinde/mkanda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkanda',
  'belt',
  'belt',
  'upinde/mkanda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkanda',
  'belt',
  'belt',
  'upinde/mkanda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?kanda',
  'belt',
  'belt',
  'upinde/mkanda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkanda',
  'belt',
  'belt',
  'upinde/mkanda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omokanda',
  'belt',
  'belt',
  'upinde/mkanda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Belt / Peti',
  'belt',
  'belt',
  'upinde/mkanda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?kanda',
  'belt',
  'belt',
  'upinde/mkanda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkanda / Belt',
  'belt',
  'belt',
  'upinde/mkanda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omukanda',
  'belt',
  'belt',
  'upinde/mkanda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkanda',
  'belt',
  'belt',
  'upinde/mkanda',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Esoksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sharaabadh',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sokisii',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Esoksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moje',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Esoksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soksi',
  'socks',
  'socks',
  'soksi',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pala',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K?isu',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K?isu',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekisu',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tililet',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olkejek',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kisu',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kisu',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mindi',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Qottoo',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kisu',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kisu',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kisu',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K?isu',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kisu',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekisu',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chaaku',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K?isu',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olkejek',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kisu',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekimat',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekisu',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kisu',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tililet',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tililet',
  'knife',
  'knife',
  'kisu',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bulo',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shoka',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shoka',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Eshoka',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taparet',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shoka',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shoka',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Faas',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Qottoo',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shoka',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shoka',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shoka',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shoka',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shoka',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Eshoka',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kulhari',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shoka',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shoka',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngikobong',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Eshoka',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shoka',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taparet',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taparet',
  'axe',
  'axe',
  'shoka',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyundo',
  'hammer',
  'hammer',
  'nyundo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyundo',
  'hammer',
  'hammer',
  'nyundo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyundo',
  'hammer',
  'hammer',
  'nyundo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enyundo',
  'hammer',
  'hammer',
  'nyundo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyundo',
  'hammer',
  'hammer',
  'nyundo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'hammer',
  'hammer',
  'nyundo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyundo',
  'hammer',
  'hammer',
  'nyundo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyundo',
  'hammer',
  'hammer',
  'nyundo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dukumo',
  'hammer',
  'hammer',
  'nyundo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kaasaa',
  'hammer',
  'hammer',
  'nyundo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyundo',
  'hammer',
  'hammer',
  'nyundo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyundo',
  'hammer',
  'hammer',
  'nyundo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyundo',
  'hammer',
  'hammer',
  'nyundo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyundo',
  'hammer',
  'hammer',
  'nyundo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyundo',
  'hammer',
  'hammer',
  'nyundo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enyundo',
  'hammer',
  'hammer',
  'nyundo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hatotha',
  'hammer',
  'hammer',
  'nyundo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyundo',
  'hammer',
  'hammer',
  'nyundo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyundo',
  'hammer',
  'hammer',
  'nyundo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enyundo',
  'hammer',
  'hammer',
  'nyundo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyundo',
  'hammer',
  'hammer',
  'nyundo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tol',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamba',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamba',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekamba',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kimnget',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamba',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamba',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Xadhig',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lubuu',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamba',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamba',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamba',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamba',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamba',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekamba',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rassi',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamba',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamba',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekamba',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamba',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kimnget',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kimnget',
  'rope',
  'rope',
  'kamba',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Endoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baaldi',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baaldii',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Endoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Balti',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Endoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndoo',
  'bucket',
  'bucket',
  'ndoo',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Agulu',
  'pot',
  'pot',
  'sufuria',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sufuria',
  'pot',
  'pot',
  'sufuria',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sufuria',
  'pot',
  'pot',
  'sufuria',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Esufuria',
  'pot',
  'pot',
  'sufuria',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sufuria',
  'pot',
  'pot',
  'sufuria',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'pot',
  'pot',
  'sufuria',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sufuria',
  'pot',
  'pot',
  'sufuria',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sufuria',
  'pot',
  'pot',
  'sufuria',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Digsi',
  'pot',
  'pot',
  'sufuria',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Biqilaa',
  'pot',
  'pot',
  'sufuria',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sufuria',
  'pot',
  'pot',
  'sufuria',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sufuria',
  'pot',
  'pot',
  'sufuria',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sufuria',
  'pot',
  'pot',
  'sufuria',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sufuria',
  'pot',
  'pot',
  'sufuria',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sufuria',
  'pot',
  'pot',
  'sufuria',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Esufuria',
  'pot',
  'pot',
  'sufuria',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bartan',
  'pot',
  'pot',
  'sufuria',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sufuria',
  'pot',
  'pot',
  'sufuria',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sufuria',
  'pot',
  'pot',
  'sufuria',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Esufuria',
  'pot',
  'pot',
  'sufuria',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sufuria',
  'pot',
  'pot',
  'sufuria',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karai',
  'pan',
  'pan',
  'karai',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karai',
  'pan',
  'pan',
  'karai',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karai',
  'pan',
  'pan',
  'karai',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekarai',
  'pan',
  'pan',
  'karai',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karai',
  'pan',
  'pan',
  'karai',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karai',
  'pan',
  'pan',
  'karai',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karai',
  'pan',
  'pan',
  'karai',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karai',
  'pan',
  'pan',
  'karai',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Macellin',
  'pan',
  'pan',
  'karai',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karaayii',
  'pan',
  'pan',
  'karai',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karai',
  'pan',
  'pan',
  'karai',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karai',
  'pan',
  'pan',
  'karai',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karai',
  'pan',
  'pan',
  'karai',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karai',
  'pan',
  'pan',
  'karai',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karai',
  'pan',
  'pan',
  'karai',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekarai',
  'pan',
  'pan',
  'karai',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tawaah',
  'pan',
  'pan',
  'karai',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karai',
  'pan',
  'pan',
  'karai',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karai',
  'pan',
  'pan',
  'karai',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekarai',
  'pan',
  'pan',
  'karai',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karai',
  'pan',
  'pan',
  'karai',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijiko',
  'spoon',
  'spoon',
  'kijiko',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijiko',
  'spoon',
  'spoon',
  'kijiko',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijiko',
  'spoon',
  'spoon',
  'kijiko',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekijiko',
  'spoon',
  'spoon',
  'kijiko',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijiko',
  'spoon',
  'spoon',
  'kijiko',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'spoon',
  'spoon',
  'kijiko',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijiko',
  'spoon',
  'spoon',
  'kijiko',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijiko',
  'spoon',
  'spoon',
  'kijiko',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Fandhaal',
  'spoon',
  'spoon',
  'kijiko',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sibiree',
  'spoon',
  'spoon',
  'kijiko',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijiko',
  'spoon',
  'spoon',
  'kijiko',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijiko',
  'spoon',
  'spoon',
  'kijiko',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijiko',
  'spoon',
  'spoon',
  'kijiko',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijiko',
  'spoon',
  'spoon',
  'kijiko',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijiko',
  'spoon',
  'spoon',
  'kijiko',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekijiko',
  'spoon',
  'spoon',
  'kijiko',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chammach',
  'spoon',
  'spoon',
  'kijiko',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijiko',
  'spoon',
  'spoon',
  'kijiko',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijiko',
  'spoon',
  'spoon',
  'kijiko',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekijiko',
  'spoon',
  'spoon',
  'kijiko',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijiko',
  'spoon',
  'spoon',
  'kijiko',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Uma',
  'fork',
  'fork',
  'uma',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Uma',
  'fork',
  'fork',
  'uma',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Uma',
  'fork',
  'fork',
  'uma',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Euma',
  'fork',
  'fork',
  'uma',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Uma',
  'fork',
  'fork',
  'uma',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Uma',
  'fork',
  'fork',
  'uma',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Uma',
  'fork',
  'fork',
  'uma',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Uma',
  'fork',
  'fork',
  'uma',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Fargeeto',
  'fork',
  'fork',
  'uma',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Foorkii',
  'fork',
  'fork',
  'uma',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Uma',
  'fork',
  'fork',
  'uma',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Uma',
  'fork',
  'fork',
  'uma',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Uma',
  'fork',
  'fork',
  'uma',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Uma',
  'fork',
  'fork',
  'uma',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Uma',
  'fork',
  'fork',
  'uma',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Euma',
  'fork',
  'fork',
  'uma',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kaanta',
  'fork',
  'fork',
  'uma',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Uma',
  'fork',
  'fork',
  'uma',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Uma / Fork',
  'fork',
  'fork',
  'uma',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Euma',
  'fork',
  'fork',
  'uma',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Uma',
  'fork',
  'fork',
  'uma',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kikombe',
  'cup',
  'cup',
  'kikombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kikombe',
  'cup',
  'cup',
  'kikombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kikombe',
  'cup',
  'cup',
  'kikombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekikombe',
  'cup',
  'cup',
  'kikombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kikombe',
  'cup',
  'cup',
  'kikombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'cup',
  'cup',
  'kikombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kikombe',
  'cup',
  'cup',
  'kikombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kikombe',
  'cup',
  'cup',
  'kikombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koob',
  'cup',
  'cup',
  'kikombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuphii',
  'cup',
  'cup',
  'kikombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kikombe',
  'cup',
  'cup',
  'kikombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kikombe',
  'cup',
  'cup',
  'kikombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kikombe',
  'cup',
  'cup',
  'kikombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kikombe',
  'cup',
  'cup',
  'kikombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kikombe',
  'cup',
  'cup',
  'kikombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekikombe',
  'cup',
  'cup',
  'kikombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kap',
  'cup',
  'cup',
  'kikombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kikombe',
  'cup',
  'cup',
  'kikombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kikombe',
  'cup',
  'cup',
  'kikombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekikombe',
  'cup',
  'cup',
  'kikombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kikombe',
  'cup',
  'cup',
  'kikombe',
  'noun',
  'noun',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chamo',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?ria',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K?ria',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kulya',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amchi',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aadol',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kula',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kula',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Cunida',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyaachuu',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kula',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kula',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kula',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?ria',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kula',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Orya',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Khaana khaanaa',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?ria',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aadol',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kula',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ayam',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kulya',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kula',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amchi',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amchi',
  'eat',
  'eat',
  'kula',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Madho',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?nyua',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K?nyua',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kunywa',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Machi',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Anyit',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kunywa',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kunywa',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Cabida',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhuguu',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kunywa',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kunywa',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kunywa',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?nyua',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kunywa',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Onywa',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Piinaa',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?nyua',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Anyit',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kunywa',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amam',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kunywa',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kunywa',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Machi',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Machi',
  'drink',
  'drink',
  'kunywa',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nindo',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?ikara',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K?lala',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kulala',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nech',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aiser',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kulala',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kulala',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Seexasho',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ciisuu',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kulala',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kulala',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kulala',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K?lala',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kulala',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olala',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sonaa',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K?lala',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aiser',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lala',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akiruk',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kulala',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kulala',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nech',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nech',
  'sleep',
  'sleep',
  'kulala',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aa',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?uka',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K?uka',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuamuka',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Yoch',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aitore',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuamka',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuamka',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Toosasho',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ka''uu',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuamka',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuamka',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuamka',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K?uka',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuamka',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Oamuka',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jagnaaa',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K?uka',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aitore',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amka',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuamuka',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuamka',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Yoch',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Yoch',
  'wake/wake up',
  'wake/wake up',
  'kuamka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wuotho',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?tembea',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kwona',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kutembea',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tuiyei',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Atembea',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kutembea',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kutembea',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Socodka',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Deemuu',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kutembea',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kutembea',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kutembea',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?tembea',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kutembea',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Otembera',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chalnaa',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?tembea',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Atembea',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tembea',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akwat',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kutembea',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kutembea',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tuiyei',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tuiyei',
  'walk',
  'walk',
  'kutembea',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ringo',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?kimbia',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kwona ng?',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kukimbia',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tigei',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akimbia',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kukimbia',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kukimbia',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Orodka',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Fiiguu',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kukimbia',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kukimbia',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kukimbia',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?kimbia',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kukimbia',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Okimbia',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dournaa',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?kimbia',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akimbia',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kimbia',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Apal',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kukimbia',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kukimbia',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tigei',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tigei',
  'run',
  'run',
  'kukimbia',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lam',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?ruka',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuruka',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuruka',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Timei',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aruka',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuruka',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuruka',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Boodashada',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Waraabuu',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuruka',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuruka',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuruka',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuruka',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuruka',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Oruka',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kudnaa',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuruka',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aruka',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ruka',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuruka',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuruka',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Timei',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Timei',
  'jump',
  'jump',
  'kuruka',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bed',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?ikara',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kwikala',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuketi',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Neyei',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Adung',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuketi',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuketi',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Fadhiisasho',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Teessuu',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuketi',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuketi',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuketi',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?ikara',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuketi',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Oikara',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baithnaa',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?ikara',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Adung',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Keti',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akung',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuketi',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuketi',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Neyei',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Neyei',
  'sit',
  'sit',
  'kuketi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chung''',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?simama',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kusimama',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kusimama',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngei',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Asimama',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kusimama',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kusimama',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taagan',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhaabachuu',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kusimama',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kusimama',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kusimama',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?simama',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kusimama',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Osimama',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Khardaa honaa',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?simama',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Asimama',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Simama',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Atur',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kusimama',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kusimama',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngei',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngei',
  'stand',
  'stand',
  'kusimama',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tij',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?kora wira',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kwosa',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kufanya kazi',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Konyei',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Afanya kazi',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kufanya kazi',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kufanya kazi',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shaqada',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hojii',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kufanya kazi',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kufanya kazi',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kufanya kazi',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?kora wira',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kufanya kazi',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Okora ebiakwa',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kaam karnaa',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?kora wira',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Afanya kazi',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Fanya kazi',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aros',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kufanya kazi',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kufanya kazi',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Konyei',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Konyei',
  'work',
  'work',
  'kufanya kazi',
  'verb',
  'verb',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maduong''',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nene',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nene',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enene',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suge',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nabo',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kubwa',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kubwa',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Weyn',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Guddaa',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kubwa',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kubwa',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kubwa',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nene',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kubwa',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nene',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baraa',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nene',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nabo',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kubwa / Mkubwa',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akwap',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enene',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kubwa',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suge',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suge',
  'big',
  'big',
  'kubwa',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Matin',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nini',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nini',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enini',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bek',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Keri',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndogo',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndogo',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Yar',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Xiqqaa',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndogo',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndogo',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndogo',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nini',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndogo',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nini',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chhotaa',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nini',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Keri',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndogo / Kadogo',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngikelio',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enini',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndogo',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bek',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bek',
  'small',
  'small',
  'ndogo',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maber',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wega',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wea',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obulweka',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Imet',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sidai',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nzuri',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nzuri',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wanaagsan',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gaarii',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nzuri',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nzuri',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nzuri',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wega',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nzuri',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bwangu',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Achchaa',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wega',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sidai',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Poa / Sawa',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ber',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obulweka',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nzuri',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Imet',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Imet',
  'good',
  'good',
  'nzuri',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Marach',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Thiiri',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbii',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ebibi',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mising',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Oolcher',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbaya',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbaya',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Xun',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Badaa',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbaya',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbaya',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbaya',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Thiiri',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbaya',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rieba',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bura',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Thiiri',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Oolcher',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbaya / Baya',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ebibi',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbaya',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mising',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mising',
  'bad',
  'bad',
  'mbaya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Liet',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?noru',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wea',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obushishi',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Momeet',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moto',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moto',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kulul',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ho''aa',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moto',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moto',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moto',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?noru',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moto',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omotooro',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Garm',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?noru',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moto',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekeny',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obushishi',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moto',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Momeet',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Momeet',
  'hot',
  'hot',
  'moto',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngich',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Th??',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Th?',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obusiisi',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Komoywet',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baridi',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baridi',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Qabow',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Qabanaawaa',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baridi',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baridi',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baridi',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Th??',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baridi',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ebisiisi',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Thandaa',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Th??',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baridi',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obusiisi',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baridi',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Komoywet',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Komoywet',
  'cold',
  'cold',
  'baridi',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Manyien',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?eru',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?eru',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Empya',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Psaet',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mpya',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mpya',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Cusub',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Haaraa',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mpya',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mpya',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mpya',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?eru',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mpya',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Empya',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nayaa',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?eru',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mpya',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Empya',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mpya',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Psaet',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Psaet',
  'new',
  'new',
  'mpya',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Machon',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?th?',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K??',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekhosi',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngwenyit',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kale / Zamani',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kale',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gabow',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moofaa',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kale',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kale',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kale',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?th?',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kale',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekhosi',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Puraanaa',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?th?',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Zamani / Kale',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekhosi',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kale',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngwenyit',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngwenyit',
  'old',
  'old',
  'kale/mzee',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Piyo',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nduhar?ru',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng?',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obulayi',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ketit',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Toromu',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Haraka',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Haraka',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhaqso',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Saffisaa',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Haraka',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Haraka',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Haraka',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nduhar?ru',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Haraka',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Haraka',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaldii',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nduhar?ru',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Toromu',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Haraka',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngikatum',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obulayi',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Haraka',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ketit',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ketit',
  'fast',
  'fast',
  'haraka',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mos',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pokapoka',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pookapoka',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obushishi',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Komit',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nkiama',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Polepole',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Polepole',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gaabis',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gidgiddaa',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Polepole',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Polepole',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Polepole',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pokapoka',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Polepole',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Polepole',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhiire',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pokapoka',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pole / Polepole',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obushishi',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Polepole',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Komit',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;
INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Komit',
  'slow',
  'slow',
  'polepole',
  'adjective',
  'adjective',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

COMMIT;