BEGIN TRANSACTION;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Achiel',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?mwe',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?mwe',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndala',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Agenge',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nabo',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Imweri',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Imweri',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K�w',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tokko',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwenga',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwenga',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwenga',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Imwe',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwenga',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Eyemo',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ek',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Umwi',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Imwe',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tokko',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mosi',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwenga',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K�w',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rel'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nab�',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Endala',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Apeyi',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Silala',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mulala',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mulala',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'lto'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Agenge',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Agenge',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akeng''',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akeenge',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Agenge',
  'one',
  'one',
  'moja',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ariyo',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ig?r?',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?l?',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chibili',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aeng�',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Are',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Iwi',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Iwi',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'L�ba',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lama',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbiri',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbiri',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbiri',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ig?r?',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbiri',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ibiri',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Do',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Abere',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ig?r?',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lama',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbiri',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbiri',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'L�mba',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rel'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ar�',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Iwiri',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng�arei',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chibili',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Vaviri',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Vaviri',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'lto'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aeng�',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aeng''',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Oyeng''',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ayeng''',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aeng''',
  'two',
  'two',
  'mbili',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Adek',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ithat?',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Itat?',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chitaru',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Somok',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Uni',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Idadu',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Idadu',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'S�ddex',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sadi',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tahu',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndahu',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tahu',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ithat?',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tahu',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Isato',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Teen',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Atatu',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ithat?',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sadi',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tahu',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tahu',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'S�yyah',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rel'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Un�',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Isatu',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng�uni',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chitaru',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Vavadu',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Varahu',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'lto'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Somok',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Somok',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Somok',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Somok',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Somok',
  'three',
  'three',
  'tatu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ang''wen',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inya',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inya',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chinne',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ang�wan',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ong''wan',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inya',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inya',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '�far',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Afur',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inne',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nne',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nne',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inya',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inne',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ine',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Char',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Anne',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inya',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Afur',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inne',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nne',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Afar',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rel'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ong''w�n',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ine',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng�omon',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chinne',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Vane',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Vanne',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'lto'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ang�wan',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ang''wan',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ang''wan',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ang''wan',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ang''wan',
  'four',
  'four',
  'nne',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Abich',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ithano',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Itano',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chirano',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mut',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Imiet',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Isanu',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Isanu',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sh�n',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shan',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tsano',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tsano',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tsano',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ithano',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tsano',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Isano',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Panch',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Atano',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ithano',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shan',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tsano',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tsano',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chan',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rel'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Imy�t',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Itanu',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng�akan',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chirano',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Vatanu',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Vatanu',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'lto'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mut',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mut',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mut',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mut',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mut',
  'five',
  'five',
  'tano',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Auchiel',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ithathat?',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Thanthat?',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sita',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lo',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ile',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Irandadu',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Irandadu',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'L�x',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaya',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sita',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tandahu',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tandahu',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ithathat?',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Thandahu',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Isasato',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Cheh',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Itandatu',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ithathat?',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaha',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tandahu',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Thandahu',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'L�h',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rel'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Il�',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mukaga',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng�akan-ka-peyi',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sita',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mutandatu',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mutandatu',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'lto'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lo',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lo',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lo',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lo',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lo',
  'six',
  'six',
  'sita',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Abiriyo',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?gwanja',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Muonza',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Saba',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tisap',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nabishana',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mfungade',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mfungade',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Toddob�',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Torba',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mfungade',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Fungahe',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Fungahe',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?gwanja',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Fungahe',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Isabato',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Saat',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ifungate',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?gwanja',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Torba',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Fungahe',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Fungahe',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Toddob�',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rel'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'S�pua',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Musamvu',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng�akan-ka-arei',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Saba',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mutandatu na mulala',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Murunana',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'lto'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tisap',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tisap',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tisap',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tisap',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tisap',
  'seven',
  'seven',
  'saba',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aboro',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inyanya',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyanya',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Munane',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sisit',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Isiet',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wanya',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inyanya',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sidd�ed',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Saddeet',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyanya',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nane',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nane',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inyanya',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nane',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inyanya',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aath',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inyanya',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inyanya',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Saddeet',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nane',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nane',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Siyy�et',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rel'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Isy�t',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Munana',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng�akan-ka-uni',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Munane',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Munane',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Munane',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'lto'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sisit',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sisit',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sisit',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sisit',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sisit',
  'eight',
  'eight',
  'nane',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ochiko',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kenda',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Keenda',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nasienda',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sokol',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Naaudo',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ikenda',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ikenda',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sagaal',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sagal',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kenda',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chenda',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chenda',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kenda',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chenda',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ikenda',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nau',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ikenda',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kenda',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sagal',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kenda',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chenda',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sag�al',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rel'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Saall',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kenda',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng�akan-ka-omon',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nasienda',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chenda',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chenda',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'lto'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sokol',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sokol',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sokol',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sokol',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sokol',
  'nine',
  'nine',
  'tisa',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Apar',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ik?mi',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?k?mi',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Likhumi',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tomon',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ikumi',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ikumi',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Toban',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kudhan',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kumi',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kumi',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kumi',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ik?mi',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kumi',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ikumi',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Das',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ikumi',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ik?mi',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kudhan',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kumi',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kumi',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tomon',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rel'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tom�n',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ikumi',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng�otomon',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Likhumi',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Likumi',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Likumi',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'lto'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Toman',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman',
  'ten',
  'ten',
  'kumi',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Piero ariyo',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo ?r?',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Miongo ?l?',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamakhumi kabili',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tiptem',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tik�tam',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi awi',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi iwi',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Laba�tan',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Digdama',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi mbiri',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo miiri',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo mbiri',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo ?r?',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi mbiri',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi abiri',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bees',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi abere',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo ?r?',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Digdama',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo miiri',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi mbiri',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lab�tan',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rel'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tik�tam',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi awiri',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akumi-arei',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamakhumi kabili',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi vaviri',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi vaviri',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'lto'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tiptem',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tiptem',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tiptem',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tiptem',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tiptem',
  'twenty',
  'twenty',
  'ishirini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Piero adek',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo ithat?',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Miongo itat?',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamakhumi kataru',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sosom',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Osom',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi adadu',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi idadu',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'S�ddon',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soddoma',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi tahu',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo midahu',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo tahu',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo ithat?',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi tahu',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi asato',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tees',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi atatu',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo ithat?',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soddoma',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo mitahu',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi tahu',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'S�don',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rel'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Os�m',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi asatu',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akumi-uni',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamakhumi kataru',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi vavadu',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi varahu',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'lto'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sosom',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sosom',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sosom',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sosom',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sosom',
  'thirty',
  'thirty',
  'thelathini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Piero ang''wen',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo inya',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Miongo inya',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamakhumi kanne',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Artam',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Artam',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi aminya',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi inya',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Af�rtan',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Afurtama',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi inne',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo mine',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo nne',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo inya',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi inne',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi ane',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chalis',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi anne',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo inya',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Afurtama',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo minne',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi nne',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Af�rtan',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rel'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Art�m',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi ane',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akumi-omon',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamakhumi kanne',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi vane',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi vanne',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'lto'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Artam',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Artam',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Artam',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Artam',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Artam',
  'forty',
  'forty',
  'arobaini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Piero abich',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo ithano',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Miongo itano',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamakhumi karano',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Konom',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Onom',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi asanu',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi isanu',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K�nton',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shantama',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi tsano',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo mitsano',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo tsano',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo ithano',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi tsano',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi asano',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pachas',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi atano',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo ithano',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shantama',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo mitsano',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi tsano',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Konton',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rel'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'On�m',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi atanu',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akumi-akan',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamakhumi karano',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi vatanu',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi vatanu',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'lto'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Konom',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Konom',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Konom',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Konom',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Konom',
  'fifty',
  'fifty',
  'hamsini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Piero auchiel',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo ithathat?',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Miongo thanthat?',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamakhumi sita',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-wokik Lo',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tomon-on-ile',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi arandadu',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi irandadu',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'L�xdan',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaatama',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi sita',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo mitandahu',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo tandahu',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo ithathat?',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi thandahu',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi asasato',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Saath',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi itandatu',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo ithathat?',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaatama',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo mitandahu',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi thandahu',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lihdan',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rel'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tomon-on-ile',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi mukaga',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akumi-akan-ka-peyi',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamakhumi sita',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi mutandatu',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi mutandatu',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'lto'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-wokik Lo',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-wokik Lo',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-cho-Lo',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-wokik Lo',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-wokik Lo',
  'sixty',
  'sixty',
  'sitini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Piero abiriyo',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo m?gwanja',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Miongo muonza',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamakhumi saba',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-wokik Tisap',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tomon-on-nabishana',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi mfungade',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi mfungade',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Toddoba�tan',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Torbatama',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi mfungade',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo mifungahe',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo fungahe',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo m?gwanja',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi fungahe',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi asabato',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sattar',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi ifungate',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo m?gwanja',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Torbatama',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo mifungahe',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi fungahe',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Toddobat�n',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rel'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tomon-on-nabish�na',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi musamvu',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akumi-akan-ka-arei',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamakhumi saba',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi saba',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi murunana',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'lto'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-wokik Tisap',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-wokik Tisap',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-cho-Tisap',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-wokik Tisap',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-wokik Tisap',
  'seventy',
  'seventy',
  'sabini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Piero aboro',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo inyanya',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Miongo nyanya',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamakhumi munane',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-wokik Sisit',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tomon-on-isiet',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi wanya',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi inyanya',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sidde�tan',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Saddeetama',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi nyanya',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo minane',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo nane',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo inyanya',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi nane',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi anyanya',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Assi',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi nyanya',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo inyanya',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Saddeetama',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo minane',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi nane',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Siyyeet�n',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rel'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tomon-on-isy�t',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi munana',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akumi-akan-ka-uni',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamakhumi munane',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi munane',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi munane',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'lto'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-wokik Sisit',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-wokik Sisit',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-cho-Sisit',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-wokik Sisit',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-wokik Sisit',
  'eighty',
  'eighty',
  'themanini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Piero ochiko',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo kenda',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Miongo keenda',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamakhumi tisa',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-wokik Sokol',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tomon-on-naaudo',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi ikenda',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi ikenda',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Saga�shan',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sagaltama',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi kenda',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo chenda',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo chenda',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo kenda',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi chenda',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi akenda',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nabbe',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi kenda',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rongo kenda',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sagaltama',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mirongo kenda',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Makumi chenda',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sagaash�n',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rel'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tomon-on-naa�do',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi kenda',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akumi-akan-ka-omon',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kamakhumi tisa',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi tisa',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Amakumi tisa',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'lto'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-wokik Sokol',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-wokik Sokol',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-cho-Sokol',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-wokik Sokol',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taman-wokik Sokol',
  'ninety',
  'ninety',
  'tisini',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mia achiel',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Igana r?mwe',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Yiana ?mwe',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Igana',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bokool',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Igana',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mia imweri',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Igana',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Boq�l',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhibba',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Igana mwenga',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gana mwenga',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gana mwenga',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Igana r?mwe',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Igana mwenga',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ria eyemo',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sau',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Igana rimwi',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Igana r?mwe',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhibba',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gana mosi',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Igana mwenga',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bog�l',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rel'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ig�na',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Imyanda ibili',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akumi-ka-tomon',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mia achiel',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mia mulala',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Igana lilala',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'lto'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bogol',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bogol',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pokol',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bogol',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bogol',
  'hundred',
  'hundred',
  'mia',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Alufu achiel',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngiri ?mwe',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngili ?mwe',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Elfu ndala',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kisiereet',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Elfu nabo',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngiri imweri',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngiri imweri',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K�n',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuma',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngiri mwenga',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Magana kumi',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Magana kumi',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngiri ?mwe',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngiri mwenga',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Alufu eyemo',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hazaar',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Eng''iri emwi',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngiri ?mwe',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kuma',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Elfu mosi',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngiri mwenga',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K�n',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rel'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Elfu nab�',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ikana limo',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Elfu',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Elfu ndala',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Elfu mulala',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Elfu ndala',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'lto'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kisiereet',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kisiereet',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Elif',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kisiereet',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kisiereet',
  'thousand',
  'thousand',
  'elfu',
  'number',
  'numbers',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Misawa',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'W? mwega',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'N? mwa??',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mulembe',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chamgei',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Supa (to young) / Entasupa (to elders)',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shimboni',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mashimba',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Is-ka-waran / Salaam',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akkam',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Heyo',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kpashara',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Zhaze',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'W? mwega',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'U dze / Heyo',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bwakire',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Namaste',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Buya',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M??ga / Naare',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akkam',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwaa naghea?',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Zhaze',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aa''h�ey',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rel'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kejua / Supa',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Igake / Gatie',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyai',
  'hello',
  'hello',
  'habari',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Iyier maber?',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'W?ra mwega?',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'W? muvoo?',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bushire',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chamgei mising',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kejaa enkakenya',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wamuka nesa?',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wamuka nesa?',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Subax wanaagsan',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akkam bulte?',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dzalamukadze?',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mudzalamukadze?',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mudzalamukadze?',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K?r? k?thieri?',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mudzalamukadze?',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bwakire mbuya?',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suprabhat',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwakire?',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M??ga r?k?r?',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akkam bulte?',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mudzalamukadze?',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Serian iteperie',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Vukieye / Wukiere',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ejok',
  'good morning',
  'good morning',
  'habari ya asubuhi',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Idhi nade?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?horo waku?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?voo waku?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Oriena?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Yamonei?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ira supat?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Unadi?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Unadi?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'See tahay?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akkam jirtu?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'U dze?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'U dze?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'U dze?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?horo waku?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'U dze?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Igwaki? / Naki?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kaise ho?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Orakire?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?kari at?a?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akkam jirta?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Poisho?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'U dze?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aji itiu iye?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ogi igake?',
  'how are you?',
  'how are you?',
  'habari yako?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Adhi maber',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nd? mwega',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'N? m?voo',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nendiomulamu',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Achamgei / Mamogi',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kara supat',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nadichao',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nadishao',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Waan ladnahay',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nagaa / Dansa',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ni mndzima',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ni mndzima',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ni mndzima',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nd? mwega',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ni mndzima',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nd? mwega',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Main thik hoon',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndarekere',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nd? ?mwega',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nagaa dha',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Poisho nyoman',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ni mndzima',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Keisidai',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndagia Vuroothu',
  'I am fine',
  'I am fine',
  'niko sawa',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Erokamano',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Niwega',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'N? m?vea',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wanyala / Nasia',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kongoi',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ashe',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Washu mbe',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Washu mbe',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Waad mahadsantahay',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Galatoomi',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ratsankulume',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ratsankulume',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ratsankulume',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Niwega',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ratsankulume',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbuya mono',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shukriya',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mbuya muno',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ibwega / Ekaa',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Galatoomi',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ratsankulume',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ashe',
  'thank you',
  'thank you',
  'asante',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng�uono',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pole',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pole',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kalaa / Pole',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mutyo',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pole',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pole',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pole',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'iga raali ahaw',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhiifama',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pole',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pole',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pole',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pole',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pole',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pole',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maaf kijiye',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pole',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shililia / Pole',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhiifama',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pole',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tapalikaaki',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pole',
  'sorry',
  'sorry',
  'pole',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karibu',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?ka mwega',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?ka nesa',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karibu',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karibu',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karibu',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karibu',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karibu',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soo dhawoow',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Anaadhufu',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karibu',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karibu',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karibu',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karibu',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karibu',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karibu',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karibu / Swagat',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karibu',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karib?',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baga nagaan dhufte!',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karibu',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-pok'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karibu',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karibu',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Karibu',
  'welcome',
  'welcome',
  'karibu',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Oriti',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tigwo na wega',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enda nesa',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Khukhani khandi',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Seiseri',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olesere',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kwenda nesa',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kwenda nesa',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nabad gelyo',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nagaan',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kwaheri',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kwaheri',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kwaheri',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tigwo na wega',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kwaheri',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tigwo n�omoguo',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Alvida / Phir milenge',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tigwa n�omoguo',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tigwa bwega',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nagaatti',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kwaheri',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ikidua',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tuwonane lunyima',
  'goodbye',
  'goodbye',
  'kwaheri',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sxb'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyingi ng�a?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'W?tagwo at?a?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'W?tagwa ata?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lisina lio nina?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nee kainenyi?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kaji eji?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Uitwa ni?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Uitwa ni?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Magacaa?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maqaan kee eennu?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dzina rako nani?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dzina rako nani?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dzina rako nani?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'W?tagwo at?a?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dzina rako nani?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rigeta r?ao n�er?e?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aapka naam kya hai?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Riitwa riao n�erenge?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?r?twa at?a?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maqaan kee eennu?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dzina rako nani?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijuai nkarna?',
  'what is your name?',
  'what is your name?',
  'jina lako nani?',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyinga en...',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nj?tagwo...',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nj?tagwa...',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lisina lianje ni...',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kainennyu ko...',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kaji nanu...',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Netwa...',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Netwa...',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Magacaygu waa...',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maqaan koo...',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dzina rangu ni...',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dzina rangu ni...',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dzina rangu ni...',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nj?tagwo...',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dzina rangu ni...',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rigeta r?ane n�...',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mera naam... hai',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Riitwa riane n�...',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nj?tagwo...',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maqaan koo...',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dzina rangu ni...',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kaaji nanu nkarna...',
  'my name is',
  'my name is',
  'jina langu ni',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akucha',
  'excuse me',
  'excuse me',
  'pole pole',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Njokera',
  'excuse me',
  'excuse me',
  'pole pole',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngethe',
  'excuse me',
  'excuse me',
  'pole pole',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mukwai',
  'excuse me',
  'excuse me',
  'pole pole',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tuaku',
  'excuse me',
  'excuse me',
  'pole pole',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngethe',
  'excuse me',
  'excuse me',
  'pole pole',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngethe',
  'excuse me',
  'excuse me',
  'pole pole',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'iga raali ahaw',
  'excuse me',
  'excuse me',
  'pole pole',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maaloo',
  'excuse me',
  'excuse me',
  'pole pole',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngethe',
  'excuse me',
  'excuse me',
  'pole pole',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngethe',
  'excuse me',
  'excuse me',
  'pole pole',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngethe',
  'excuse me',
  'excuse me',
  'pole pole',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Atat?',
  'excuse me',
  'excuse me',
  'pole pole',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngethe',
  'excuse me',
  'excuse me',
  'pole pole',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Atat?',
  'excuse me',
  'excuse me',
  'pole pole',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suniye',
  'excuse me',
  'excuse me',
  'pole pole',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Atat?',
  'excuse me',
  'excuse me',
  'pole pole',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Atat?',
  'excuse me',
  'excuse me',
  'pole pole',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhiifama',
  'excuse me',
  'excuse me',
  'pole pole',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngethe',
  'excuse me',
  'excuse me',
  'pole pole',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tapalikaaki',
  'excuse me',
  'excuse me',
  'pole pole',
  'phrase',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ase',
  'please',
  'please',
  'tafadhali',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndak?thaitha',
  'please',
  'please',
  'tafadhali',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwa',
  'please',
  'please',
  'tafadhali',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Samahani',
  'please',
  'please',
  'tafadhali',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwa',
  'please',
  'please',
  'tafadhali',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwa',
  'please',
  'please',
  'tafadhali',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Fadlan',
  'please',
  'please',
  'tafadhali',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maaloo',
  'please',
  'please',
  'tafadhali',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwa',
  'please',
  'please',
  'tafadhali',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwa',
  'please',
  'please',
  'tafadhali',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwa',
  'please',
  'please',
  'tafadhali',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndak?thaitha',
  'please',
  'please',
  'tafadhali',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwa',
  'please',
  'please',
  'tafadhali',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ta kwanera',
  'please',
  'please',
  'tafadhali',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kripya',
  'please',
  'please',
  'tafadhali',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ta kwanera',
  'please',
  'please',
  'tafadhali',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-kur'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ntethia bai',
  'please',
  'please',
  'tafadhali',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maaloo',
  'please',
  'please',
  'tafadhali',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwa',
  'please',
  'please',
  'tafadhali',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rra'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aateleja',
  'please',
  'please',
  'tafadhali',
  'interjection',
  'conversation',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wuon',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baba',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tata',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Papa / Tata',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baba',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Papaa',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baba',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baba',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aabe',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Abbaa',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baba',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baba',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baba',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baba',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baba',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baba',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pitaji / Baap',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baba',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baba',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Msee / Mzae',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Apese',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tata',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baba',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baba',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baba',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Paf',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baba',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baba',
  'father',
  'father',
  'baba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Min',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maitu',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwaitu',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mama',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mama',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enana',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mama',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mama',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hooyo',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Haadha',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mama',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mama',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mama',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mama',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mama',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mama',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maa / Mata',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mama',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mama',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mami / Mzae',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akwi',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mama',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mama',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mama',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mama',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mam',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mama',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mama',
  'mother',
  'mother',
  'mama',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Owadwa',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?r? wa ita',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?tie wangu',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Om?khasi / Omunyali',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soiyet',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Oloikie',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndugu',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndugu',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Walaal',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obboleessa',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndugu wa kiume',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndugu wa kiume',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndugu wa kiume',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?r? wa ita',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndugu wa kiume',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omonto omorumo',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bhai',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?r? wa ita',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nkamurat',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Buda / Bro',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Napolon',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Om�khasi',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndugu wa kiume',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soiyet',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soiyet',
  'brother',
  'brother',
  'kaka',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyamin',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?ir?tu wa ita',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwanake wangu',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Om�khasi',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Soiyet che kiche',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enaiposha',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndugu wa kike',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndugu wa kike',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Walaal',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obboleettii',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndugu wa kike',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndugu wa kike',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndugu wa kike',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?ir?tu wa ita',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndugu wa kike',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omonto omogichiani',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Behen',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?ir?tu wa ita',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nkamurai',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sista / Dada',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Om�khasi',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndugu wa kike',
  'sister',
  'sister',
  'dada',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wuoda',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?r? wakwa',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwanangu wa kiume',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omwana omukhasi',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lakwet',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olayiani',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwanangu wa kiume',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwanangu wa kiume',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wiil',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ilma',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwana wa kiume',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwana wa kiume',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwana wa kiume',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?r? wakwa',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwana wa kiume',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omwana omorumo',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Beta',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?r? wakwa',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nkera',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mtoto wa kiume',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omwana omukhasi',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwana wa kiume',
  'son',
  'son',
  'mtoto wa kiume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyara',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?ir?tu wakwa',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwanangu wa kike',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omwana omukali',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lakwet che kiche',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Entito',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwanangu wa kike',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwanangu wa kike',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gabadh',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Intala',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwana wa kike',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwana wa kike',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwana wa kike',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?ir?tu wakwa',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwana wa kike',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omwana omogichiani',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Beti',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?ir?tu wakwa',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nkerai',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mtoto wa kike',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omwana omukali',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwana wa kike',
  'daughter',
  'daughter',
  'mtoto wa kike',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyithindo',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwana',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwana',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omwana',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lakwet',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkerai',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwana',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwana',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Cunug',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daa',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwana',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwana',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwana',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwana',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwana',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omwana',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bacha',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwana',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nkerai',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwanangu / Mtoi',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekwee',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omwana',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mwana',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lakwet',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lakwet',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lakwet',
  'child',
  'child',
  'mtoto',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kwaro',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?g?',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Umau',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kokha',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kogo',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koko�',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Babu',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Babu',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Awoowe',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akaakayyoo',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Babu',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Babu',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Babu',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?g?',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Babu',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omogocha',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dada / Nana',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?k?',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kokoroi',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Babu',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kokha',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Babu',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kogo',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kogo',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kogo',
  'grandfather',
  'grandfather',
  'babu',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dayo',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?c?',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Umau',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kokha',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kogo',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Koko�',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bibi',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bibi',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ayeeyo',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akaakayyoo',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bibi',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bibi',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bibi',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?c?',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bibi',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omokoro',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nani / Dadi',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'G?c?',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kokoroi',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyanya',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kokha',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bibi',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kogo',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kogo',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kogo',
  'grandmother',
  'grandmother',
  'nyanya',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chuora',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?menyeri wakwa',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?menyeri wangu',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omwami wange',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kimwa',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mume wangu',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mume wangu',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ninkayga',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Abbaan warraa',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mume',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mume',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mume',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?menyeri wakwa',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mume',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omogaaka',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pati / Shohar',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?menyeri wakwa',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olkiteng',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Babe / Dado',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omwami',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mume',
  'husband',
  'husband',
  'mume',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mienda',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?tumia wakwa',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?tumia wangu',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omukali wange',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kiptalam',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mke wangu',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mke wangu',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Naag',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Haadha warraa',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mke',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mke',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mke',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?tumia wakwa',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mke',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omogocha',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Patni / Biwi',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?tumia wakwa',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bibi / Dem',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omukali',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mke',
  'wife',
  'wife',
  'mke',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Osiepna',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rata',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rata',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Om�liranwa',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chepcheta',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Osiepei',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rafiki',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rafiki',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Saaxiib',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hiriyaa',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rafiki',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rafiki',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rafiki',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rata',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rafiki',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omokora',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dost / Yaar',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rata',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nkamurai',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Msee / Mfriend',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Om�liranwa',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rafiki',
  'friend',
  'friend',
  'rafiki',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wuonwa',
  'uncle',
  'uncle',
  'mjomba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?hiki',
  'uncle',
  'uncle',
  'mjomba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?hiki',
  'uncle',
  'uncle',
  'mjomba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omukasa',
  'uncle',
  'uncle',
  'mjomba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kibuyot',
  'uncle',
  'uncle',
  'mjomba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olkiama',
  'uncle',
  'uncle',
  'mjomba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mjomba',
  'uncle',
  'uncle',
  'mjomba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mjomba',
  'uncle',
  'uncle',
  'mjomba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Adeer',
  'uncle',
  'uncle',
  'mjomba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Angafa',
  'uncle',
  'uncle',
  'mjomba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mjomba',
  'uncle',
  'uncle',
  'mjomba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mjomba',
  'uncle',
  'uncle',
  'mjomba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mjomba',
  'uncle',
  'uncle',
  'mjomba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?hiki',
  'uncle',
  'uncle',
  'mjomba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mjomba',
  'uncle',
  'uncle',
  'mjomba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omogaka',
  'uncle',
  'uncle',
  'mjomba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chacha / Mama',
  'uncle',
  'uncle',
  'mjomba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?hiki',
  'uncle',
  'uncle',
  'mjomba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mjomba',
  'uncle',
  'uncle',
  'mjomba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omukasa',
  'uncle',
  'uncle',
  'mjomba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mjomba',
  'uncle',
  'uncle',
  'mjomba',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Miyo',
  'aunt',
  'aunt',
  'shangazi',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Msipukani',
  'aunt',
  'aunt',
  'shangazi',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Msipukani',
  'aunt',
  'aunt',
  'shangazi',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omuka',
  'aunt',
  'aunt',
  'shangazi',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kibuyotap kiche',
  'aunt',
  'aunt',
  'shangazi',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enaiposha',
  'aunt',
  'aunt',
  'shangazi',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shangazi',
  'aunt',
  'aunt',
  'shangazi',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shangazi',
  'aunt',
  'aunt',
  'shangazi',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Eddo',
  'aunt',
  'aunt',
  'shangazi',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obboletti',
  'aunt',
  'aunt',
  'shangazi',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shangazi',
  'aunt',
  'aunt',
  'shangazi',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shangazi',
  'aunt',
  'aunt',
  'shangazi',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shangazi',
  'aunt',
  'aunt',
  'shangazi',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Senge',
  'aunt',
  'aunt',
  'shangazi',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shangazi',
  'aunt',
  'aunt',
  'shangazi',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omokoro',
  'aunt',
  'aunt',
  'shangazi',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chachi / Mausi',
  'aunt',
  'aunt',
  'shangazi',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Senge',
  'aunt',
  'aunt',
  'shangazi',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shangazi',
  'aunt',
  'aunt',
  'shangazi',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omuka',
  'aunt',
  'aunt',
  'shangazi',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Shangazi',
  'aunt',
  'aunt',
  'shangazi',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jabedo',
  'neighbor',
  'neighbor',
  'jirani',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?ciiar?',
  'neighbor',
  'neighbor',
  'jirani',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?ti? wa th?',
  'neighbor',
  'neighbor',
  'jirani',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Om�liranwa',
  'neighbor',
  'neighbor',
  'jirani',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Cheptai',
  'neighbor',
  'neighbor',
  'jirani',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olkiama',
  'neighbor',
  'neighbor',
  'jirani',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jirani',
  'neighbor',
  'neighbor',
  'jirani',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jirani',
  'neighbor',
  'neighbor',
  'jirani',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Xaafad',
  'neighbor',
  'neighbor',
  'jirani',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ollaa',
  'neighbor',
  'neighbor',
  'jirani',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jirani',
  'neighbor',
  'neighbor',
  'jirani',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jirani',
  'neighbor',
  'neighbor',
  'jirani',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jirani',
  'neighbor',
  'neighbor',
  'jirani',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?ciiar?',
  'neighbor',
  'neighbor',
  'jirani',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jirani',
  'neighbor',
  'neighbor',
  'jirani',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omokiamatata',
  'neighbor',
  'neighbor',
  'jirani',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Padosi',
  'neighbor',
  'neighbor',
  'jirani',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?ciiar?',
  'neighbor',
  'neighbor',
  'jirani',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jirani',
  'neighbor',
  'neighbor',
  'jirani',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Om�liranwa',
  'neighbor',
  'neighbor',
  'jirani',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jirani',
  'neighbor',
  'neighbor',
  'jirani',
  'noun',
  'family',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wich',
  'head',
  'head',
  'kichwa',
  'noun',
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kichwa / D�me',
  'head',
  'head',
  'kichwa',
  'noun',
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wang''',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Itho',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?tho',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Eliho',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moek',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jicho',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jicho',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Il',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ija',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jicho',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jicho',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jicho',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?tho',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jicho',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Eriiso',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ankh',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?tho',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkit',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Macho',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekapu',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Eliho',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jicho',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moek',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moek',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aker',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moek',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moek',
  'eye',
  'eye',
  'jicho',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Um',
  'nose',
  'nose',
  'pua',
  'noun',
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'nose',
  'nose',
  'pua',
  'noun',
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mdomo',
  'mouth',
  'mouth',
  'kinywa',
  'noun',
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
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
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'But',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Guoko',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?kono',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omukono',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngalek',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkono',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkono',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gacanka',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Harka',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkono',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkono',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkono',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Guoko',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkono',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omokono',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Haath',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Guoko',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkono',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngakimuj',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omukono',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mkono',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngalek',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngalek',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngkol',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngalek',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngalek',
  'hand',
  'hand',
  'mkono',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tielo',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K?g?r?',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K?g?r?',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Okugulu',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''etit',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mguu',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mguu',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Lug',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Luka',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mguu',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mguu',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mguu',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K?g?r?',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mguu',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Okogoro',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Taang',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K?g?r?',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mguu',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekuron',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Okugulu',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mguu',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''etit',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''etit',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''etit',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ng''etit',
  'leg',
  'leg',
  'mguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tielo',
  'foot',
  'foot',
  'kiguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ruui',
  'foot',
  'foot',
  'kiguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ru?',
  'foot',
  'foot',
  'kiguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Okugulu',
  'foot',
  'foot',
  'kiguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Suk',
  'foot',
  'foot',
  'kiguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'foot',
  'foot',
  'kiguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mguu / Ukweli',
  'foot',
  'foot',
  'kiguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mguu',
  'foot',
  'foot',
  'kiguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Cagaha',
  'foot',
  'foot',
  'kiguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Miila',
  'foot',
  'foot',
  'kiguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mguu',
  'foot',
  'foot',
  'kiguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mguu',
  'foot',
  'foot',
  'kiguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mguu',
  'foot',
  'foot',
  'kiguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ruui',
  'foot',
  'foot',
  'kiguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mguu',
  'foot',
  'foot',
  'kiguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Okogoro okogaato',
  'foot',
  'foot',
  'kiguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Paer',
  'foot',
  'foot',
  'kiguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ruui',
  'foot',
  'foot',
  'kiguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mguu',
  'foot',
  'foot',
  'kiguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Okugulu',
  'foot',
  'foot',
  'kiguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mguu',
  'foot',
  'foot',
  'kiguu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chuny',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngoro',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngoro',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omwoyo',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Iit',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moyo',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moyo',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Wadne',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Onnaa',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moyo',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moyo',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moyo',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngoro',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moyo',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omwoyo',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dil',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngoro',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moyo',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekwata',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omwoyo',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Moyo',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Iit',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Iit',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Iit',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Iit',
  'heart',
  'heart',
  'moyo',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ich',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inda',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?nda',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inda',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kibo',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tumbo',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tumbo',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Calool',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Garaa',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tumbo',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tumbo',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tumbo',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inda',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tumbo',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Eenda',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pet',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inda',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tumbo',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekapel',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Inda',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tumbo',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kibo',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kibo',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kibo',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kibo',
  'stomach',
  'stomach',
  'tumboni',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Tuo',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rimu',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ndawa',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obulwaye',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chemosit',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ugonjwa',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ugonjwa',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bukaan',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhukkuba',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ugonjwa',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ugonjwa',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ugonjwa',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rimu',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ugonjwa',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obosio',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bimaar',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?rimu',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mgonjwa',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Akilit',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obulwaye',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ugonjwa',
  'sick',
  'sick',
  'mgonjwa',
  'adjective',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rem',
  'pain',
  'pain',
  'maumivu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'R?r?',
  'pain',
  'pain',
  'maumivu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '?th?na',
  'pain',
  'pain',
  'maumivu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obulumbi',
  'pain',
  'pain',
  'maumivu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sorit',
  'pain',
  'pain',
  'maumivu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'pain',
  'pain',
  'maumivu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maumivu',
  'pain',
  'pain',
  'maumivu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maumivu',
  'pain',
  'pain',
  'maumivu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Xanuun',
  'pain',
  'pain',
  'maumivu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhukkubbii',
  'pain',
  'pain',
  'maumivu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maumivu',
  'pain',
  'pain',
  'maumivu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maumivu',
  'pain',
  'pain',
  'maumivu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maumivu',
  'pain',
  'pain',
  'maumivu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'R?r?',
  'pain',
  'pain',
  'maumivu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maumivu',
  'pain',
  'pain',
  'maumivu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obosio',
  'pain',
  'pain',
  'maumivu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dard',
  'pain',
  'pain',
  'maumivu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'R?r?',
  'pain',
  'pain',
  'maumivu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maumivu',
  'pain',
  'pain',
  'maumivu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obulumbi',
  'pain',
  'pain',
  'maumivu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Maumivu',
  'pain',
  'pain',
  'maumivu',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Laktar',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktari',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktari',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omudokotera',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktari',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktari',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktari',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktari',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhakhtar',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Doktora',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktari',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktari',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktari',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktari',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktari',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omodokotera',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktar',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktari',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktari',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktari / Daktare',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktari',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omudokotera',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktari',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktari',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktari',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktari',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktari',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Daktari',
  'doctor',
  'doctor',
  'daktari',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Osuptal',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Isbitaal',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitaala',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Aspataal',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Hospitali',
  'hospital',
  'hospital',
  'hospitali',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Yath',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omutima',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawo',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Qoricha',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Egesambwe',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawaai',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dawa',
  'medicine',
  'medicine',
  'dawa',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Remo',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Thakame',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sakame',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omusayi',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Temeet',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Damu',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Damu',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhiig',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhiigaa',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Damu',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Damu',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Damu',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Thakame',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Damu',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omosaye',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Khoon',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Thakame',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Damu',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngabirir',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Omusayi',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Damu',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Temeet',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Temeet',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Temeet',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Temeet',
  'blood',
  'blood',
  'mkwaju',
  'noun',
  'health',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Mmachachach',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?tune',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?tune',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ebumba',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngurwet',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Emuny',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyekundu',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyekundu',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Cas',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Diimaadha',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyekundu',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyekundu',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyekundu',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?tune',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyekundu',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Saa',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Laal',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?tune',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Emuny',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyekundu',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Etodonit',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Eritunda',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyekundu',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngurwet',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngurwet',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngurwet',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ngurwet',
  'red',
  'red',
  'nyekundu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Buluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Buluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Buluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Buluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Buluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Buluug',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Cuqulicha',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Buluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Buluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Neela',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Buluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Buluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Buluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Buluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Buluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Buluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Buluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Buluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Buluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Buluu',
  'blue',
  'blue',
  'bluu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Achoo',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K?anjiru',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijani',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obukola',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sigisteet',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Etasim',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijani',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijani',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Cagaar',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Magaaricha',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijani',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijani',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijani',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K?anjiru',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijani',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obukola',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Haraa',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'K?anjiru',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Etasim',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijani',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Echur',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Obukola',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijani',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sigisteet',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sigisteet',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sigisteet',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sigisteet',
  'green',
  'green',
  'kijani',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Odo',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Njano',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Njano',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enjofu',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Murei',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Entim',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Njano',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Njano',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Jaallo',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Keellaadha',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Njano',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Njano',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Njano',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Njano',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Njano',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enjofu',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Peela',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Njano',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Entim',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Njano',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Apalangit',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enjofu',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Njano',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Murei',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Murei',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Murei',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Murei',
  'yellow',
  'yellow',
  'njano',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rateng''',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?iru',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?iru',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Oluusi',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kirrochet',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nkidong''oi',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyeusi',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyeusi',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Madow',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gurraadha',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyeusi',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyeusi',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyeusi',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?iru',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyeusi',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Egito',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kaala',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?iru',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nkidong''oi',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyeusi',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekiloit',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Oluusi',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyeusi',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kirrochet',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kirrochet',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kirrochet',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kirrochet',
  'black',
  'black',
  'nyeusi',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Achol',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?theru',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?theru',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Erufu',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chumeet',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Keputiei',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyeupe',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyeupe',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Cad',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Adaadhaa',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyeupe',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyeupe',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyeupe',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?theru',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyeupe',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Erufu',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Safed',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?theru',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Keputiei',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'saq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyeupe',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Ekokoit',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-trk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Erufu',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Nyeupe',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chumeet',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chumeet',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chumeet',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chumeet',
  'white',
  'white',
  'nyeupe',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chkumbe',
  'orange',
  'orange',
  'machungwa',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?c?ngwa',
  'orange',
  'orange',
  'machungwa',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?c?ngwa',
  'orange',
  'orange',
  'machungwa',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Erufu ebumba',
  'orange',
  'orange',
  'machungwa',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Chepngotunet',
  'orange',
  'orange',
  'machungwa',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olng''arua',
  'orange',
  'orange',
  'machungwa',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rangi ya machungwa',
  'orange',
  'orange',
  'machungwa',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rangi ya machungwa',
  'orange',
  'orange',
  'machungwa',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Oranjo',
  'orange',
  'orange',
  'machungwa',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Burtukaanaa',
  'orange',
  'orange',
  'machungwa',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rangi ya machungwa',
  'orange',
  'orange',
  'machungwa',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rangi ya machungwa',
  'orange',
  'orange',
  'machungwa',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rangi ya machungwa',
  'orange',
  'orange',
  'machungwa',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?c?ngwa',
  'orange',
  'orange',
  'machungwa',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rangi ya machungwa',
  'orange',
  'orange',
  'machungwa',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Oranje',
  'orange',
  'orange',
  'machungwa',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Naarangi',
  'orange',
  'orange',
  'machungwa',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'M?c?ngwa',
  'orange',
  'orange',
  'machungwa',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Orange',
  'orange',
  'orange',
  'machungwa',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Rangi ya machungwa',
  'orange',
  'orange',
  'machungwa',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Zambarau',
  'purple',
  'purple',
  'zambarau',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'R???',
  'purple',
  'purple',
  'zambarau',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Zambarau',
  'purple',
  'purple',
  'zambarau',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Zambarau',
  'purple',
  'purple',
  'zambarau',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Zambarau',
  'purple',
  'purple',
  'zambarau',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Olng''arua',
  'purple',
  'purple',
  'zambarau',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Zambarau',
  'purple',
  'purple',
  'zambarau',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Zambarau',
  'purple',
  'purple',
  'zambarau',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Guduud',
  'purple',
  'purple',
  'zambarau',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhaamuu',
  'purple',
  'purple',
  'zambarau',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Zambarau',
  'purple',
  'purple',
  'zambarau',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Zambarau',
  'purple',
  'purple',
  'zambarau',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Zambarau',
  'purple',
  'purple',
  'zambarau',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Zambarau',
  'purple',
  'purple',
  'zambarau',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Zambarau',
  'purple',
  'purple',
  'zambarau',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Zambarau',
  'purple',
  'purple',
  'zambarau',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Baingani',
  'purple',
  'purple',
  'zambarau',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Zambarau',
  'purple',
  'purple',
  'zambarau',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Purple / Zambarau',
  'purple',
  'purple',
  'zambarau',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Zambarau',
  'purple',
  'purple',
  'zambarau',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kahawa',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'R???',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kahawia',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kahawia',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sirgat',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkare',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kahawia',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kahawia',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bunni',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gurraacha',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kahawia',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kahawia',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kahawia',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kahawia',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kahawia',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kahawia',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Bhoora',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kahawia',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kahawia',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kahawia',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sirgat',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sirgat',
  'brown',
  'brown',
  'kahawia',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gr',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kah??',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijivu',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijivu',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sendet',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkidoini',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijivu',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijivu',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Cawlan',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Garaa',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijivu',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijivu',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijivu',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kah??',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijivu',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijivu',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Salaati',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kah??',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Grey',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Kijivu',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sendet',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sendet',
  'gray',
  'gray',
  'kijivu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinkii',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Casaan fudud',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Diimaadha haphicha',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Gulabi',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Pinki',
  'pink',
  'pink',
  'nyambingu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luo'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Thharabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ki'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kam'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'luy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'kal'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Enkiama e dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mas'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dav'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tvs'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dahab',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'som'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Warqee',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'orm'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'coh'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dig'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'dug'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'ebu'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'nyf'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'guz'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Sona',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-ke-hin'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'mer'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'x-sheng'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'bxk'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'rag'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'sgc'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'niq'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'pko'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'spy'
ON CONFLICT (language_id, headword) DO NOTHING;

INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  'Dhahabu',
  'gold',
  'gold',
  'dhahabu',
  'adjective',
  'colors',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = 'tuy'
ON CONFLICT (language_id, headword) DO NOTHING;

COMMIT;