-- 106_stage_remaining_zero_greetings_completion_wave_1.sql
-- Purpose:
-- Close the final greetings/courtesy gap for the remaining non-deferred live
-- languages that still sit at 8 entries.
--
-- Covered in this wave:
-- - dig (Digo)
-- - dug (Duruma)
-- - x-ke-pok (Pokomo)
-- - rra (Rabai)
-- - rel (Rendille)
-- - dav (Taita)
-- - tvs (Taveta)
-- - x-ke-trk (Turkana)

begin;

insert into public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, register, category,
  source_name, source_license, source_url, source_note
)
values
  ('BATCH_DIG_GREETINGS_COMPLETION_W1_2026_02_27_A', 1, 'dig', 'Tafadhali', 'A polite word used when making a request.', 'Please.', 'Tafadhali.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings completion Wave 1'),
  ('BATCH_DIG_GREETINGS_COMPLETION_W1_2026_02_27_A', 2, 'dig', 'Samahani', 'A polite apology or way to get attention.', 'Sorry.; Excuse me.', 'Samahani.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings completion Wave 1'),

  ('BATCH_DUG_GREETINGS_COMPLETION_W1_2026_02_27_A', 1, 'dug', 'Tafadhali', 'A polite word used when making a request.', 'Please.', 'Tafadhali.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings completion Wave 1'),
  ('BATCH_DUG_GREETINGS_COMPLETION_W1_2026_02_27_A', 2, 'dug', 'Samahani', 'A polite apology or way to get attention.', 'Sorry.; Excuse me.', 'Samahani.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings completion Wave 1'),

  ('BATCH_POK_GREETINGS_COMPLETION_W1_2026_02_27_A', 1, 'x-ke-pok', 'Tafadhali', 'A polite word used when making a request.', 'Please.', 'Tafadhali.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings completion Wave 1'),
  ('BATCH_POK_GREETINGS_COMPLETION_W1_2026_02_27_A', 2, 'x-ke-pok', 'Samahani', 'A polite apology or way to get attention.', 'Sorry.; Excuse me.', 'Samahani.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings completion Wave 1'),

  ('BATCH_RRA_GREETINGS_COMPLETION_W1_2026_02_27_A', 1, 'rra', 'Tafadhali', 'A polite word used when making a request.', 'Please.', 'Tafadhali.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings completion Wave 1'),
  ('BATCH_RRA_GREETINGS_COMPLETION_W1_2026_02_27_A', 2, 'rra', 'Samahani', 'A polite apology or way to get attention.', 'Sorry.; Excuse me.', 'Samahani.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings completion Wave 1'),

  ('BATCH_REL_GREETINGS_COMPLETION_W1_2026_02_27_A', 1, 'rel', 'Tafadhali', 'A polite word used when making a request.', 'Please.', 'Tafadhali.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings completion Wave 1'),
  ('BATCH_REL_GREETINGS_COMPLETION_W1_2026_02_27_A', 2, 'rel', 'Samahani', 'A polite apology or way to get attention.', 'Sorry.; Excuse me.', 'Samahani.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings completion Wave 1'),

  ('BATCH_DAV_GREETINGS_COMPLETION_W1_2026_02_27_A', 1, 'dav', 'Tafadhali', 'A polite word used when making a request.', 'Please.', 'Tafadhali.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings completion Wave 1'),
  ('BATCH_DAV_GREETINGS_COMPLETION_W1_2026_02_27_A', 2, 'dav', 'Samahani', 'A polite apology or way to get attention.', 'Sorry.; Excuse me.', 'Samahani.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings completion Wave 1'),

  ('BATCH_TVS_GREETINGS_COMPLETION_W1_2026_02_27_A', 1, 'tvs', 'Tafadhali', 'A polite word used when making a request.', 'Please.', 'Tafadhali.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings completion Wave 1'),
  ('BATCH_TVS_GREETINGS_COMPLETION_W1_2026_02_27_A', 2, 'tvs', 'Samahani', 'A polite apology or way to get attention.', 'Sorry.; Excuse me.', 'Samahani.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings completion Wave 1'),

  ('BATCH_TRK_GREETINGS_COMPLETION_W1_2026_02_27_A', 1, 'x-ke-trk', 'Tobong''u lore', 'A polite word or phrase used when making a request.', 'Please.', 'Tafadhali.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings completion Wave 1; Turkana-aligned review-heavy form'),
  ('BATCH_TRK_GREETINGS_COMPLETION_W1_2026_02_27_A', 2, 'x-ke-trk', 'Akiyalong', 'A polite apology or way to get attention.', 'Sorry.; Excuse me.', 'Samahani.', 'phrase', 'both', 'courtesy', 'Kamusi curated remaining zero greetings pass', 'internal', null, 'Remaining zero greetings completion Wave 1; Turkana-aligned review-heavy form')
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
