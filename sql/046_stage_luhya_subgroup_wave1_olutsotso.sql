-- 046_stage_luhya_subgroup_wave1_olutsotso.sql
-- Purpose:
-- Stage the first Luhya subgroup starter wave using Olutsotso.
--
-- Covered in this wave:
-- - lto (Olutsotso)
--
-- Target:
-- - 10 starter words
-- - 5 starter phrases
--
-- Notes:
-- - Olutsotso is used first because it has a stronger phrase and dictionary
--   surface than the other subgroup candidates currently available.
-- - These are curated starter entries for moderator and partner review.

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  -- lto (Olutsotso) words
  ('BATCH_LTO_STARTER_2026_02_26_A', 1, 'lto', 'Olusi', 'Napier grass.', 'napier grass', 'majani ya napier', 'noun', 'both', 'nature', 'Lughayangu Olutsotso dictionary', 'reference-web', 'https://lughayangu.com/olutsotso/olusi', 'Curated first Luhya subgroup starter seed'),
  ('BATCH_LTO_STARTER_2026_02_26_A', 2, 'lto', 'Ingokho', 'Hen or chicken.', 'hen; chicken', 'kuku', 'noun', 'both', 'nature', 'Lughayangu Olutsotso dictionary', 'reference-web', 'https://lughayangu.com/olutsotso/ingokho', 'Curated first Luhya subgroup starter seed'),
  ('BATCH_LTO_STARTER_2026_02_26_A', 3, 'lto', 'Olwa', 'While; during the time that.', 'while', 'wakati; ilhali', 'conjunction', 'both', 'grammar', 'Lughayangu Olutsotso dictionary', 'reference-web', 'https://lughayangu.com/olutsotso/olwa', 'Curated first Luhya subgroup starter seed'),
  ('BATCH_LTO_STARTER_2026_02_26_A', 4, 'lto', 'Olunga', 'A good cook; someone who cooks well.', 'good cook', 'mpishi mzuri', 'noun', 'both', 'home', 'Lughayangu Olutsotso dictionary', 'reference-web', 'https://lughayangu.com/olutsotso/olunga', 'Curated first Luhya subgroup starter seed'),
  ('BATCH_LTO_STARTER_2026_02_26_A', 5, 'lto', 'Oluya', 'Sweat.', 'sweat', 'jasho', 'noun', 'both', 'body', 'Lughayangu Olutsotso dictionary', 'reference-web', 'https://lughayangu.com/olutsotso/oluya', 'Curated first Luhya subgroup starter seed'),
  ('BATCH_LTO_STARTER_2026_02_26_A', 6, 'lto', 'Thitaru', 'Three.', 'three', 'tatu', 'numeral', 'both', 'numbers', 'Lughayangu Olutsotso dictionary', 'reference-web', 'https://lughayangu.com/olutsotso/thitaru', 'Curated first Luhya subgroup starter seed'),
  ('BATCH_LTO_STARTER_2026_02_26_A', 7, 'lto', 'Ikhasi', 'Female.', 'female', 'jike; wa kike', 'adjective', 'both', 'family', 'Lughayangu Olutsotso dictionary', 'reference-web', 'https://lughayangu.com/olutsotso/ikhasi', 'Curated first Luhya subgroup starter seed'),
  ('BATCH_LTO_STARTER_2026_02_26_A', 8, 'lto', 'Eshisina', 'Stem of a plant or tree.', 'stem', 'shina', 'noun', 'both', 'nature', 'Lughayangu Olutsotso dictionary', 'reference-web', 'https://lughayangu.com/olutsotso/eshisina', 'Curated first Luhya subgroup starter seed'),
  ('BATCH_LTO_STARTER_2026_02_26_A', 9, 'lto', 'Ingwe', 'Leopard.', 'leopard', 'chui', 'noun', 'both', 'nature', 'Lughayangu Olutsotso dictionary', 'reference-web', 'https://lughayangu.com/Olutsotso/ingwe', 'Curated first Luhya subgroup starter seed'),
  ('BATCH_LTO_STARTER_2026_02_26_A', 10, 'lto', 'Emisi', 'Root of a plant or tree.', 'root', 'mzizi', 'noun', 'both', 'nature', 'Lughayangu Olutsotso dictionary', 'reference-web', 'https://lughayangu.com/olutsotso/emisi', 'Curated first Luhya subgroup starter seed'),

  -- lto (Olutsotso) phrases
  ('BATCH_LTO_STARTER_2026_02_26_A', 11, 'lto', 'Orio muno', 'An expression of thanks.', 'Thank you.', 'Asante.', 'phrase', 'both', 'culture', 'Common phrases in Olutsotso', 'reference-web', 'https://lughayangu.com/post/common-phrases-in-olutsotso', 'Curated first Luhya subgroup starter seed'),
  ('BATCH_LTO_STARTER_2026_02_26_A', 12, 'lto', 'Mbera', 'An apology or expression of regret.', 'I am sorry.', 'Samahani.', 'phrase', 'both', 'culture', 'Common phrases in Olutsotso', 'reference-web', 'https://lughayangu.com/post/common-phrases-in-olutsotso', 'Curated first Luhya subgroup starter seed'),
  ('BATCH_LTO_STARTER_2026_02_26_A', 13, 'lto', 'Itsa anoo', 'An instruction calling someone closer.', 'Come here.', 'Njoo hapa.', 'phrase', 'both', 'culture', 'Common phrases in Olutsotso', 'reference-web', 'https://lughayangu.com/post/common-phrases-in-olutsotso', 'Curated first Luhya subgroup starter seed'),
  ('BATCH_LTO_STARTER_2026_02_26_A', 14, 'lto', 'Iri sawa', 'A phrase used to say something is alright.', 'It is okay.', 'Ni sawa.', 'phrase', 'both', 'culture', 'Common phrases in Olutsotso', 'reference-web', 'https://lughayangu.com/post/common-phrases-in-olutsotso', 'Curated first Luhya subgroup starter seed'),
  ('BATCH_LTO_STARTER_2026_02_26_A', 15, 'lto', 'Thitsanga ingo', 'A phrase indicating the speaker is going home.', 'I am going home.', 'Ninaenda nyumbani.', 'phrase', 'both', 'culture', 'Common phrases in Olutsotso', 'reference-web', 'https://lughayangu.com/post/common-phrases-in-olutsotso', 'Curated first Luhya subgroup starter seed')
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
-- where batch_label = 'BATCH_LTO_STARTER_2026_02_26_A'
-- group by batch_label, language_code;
