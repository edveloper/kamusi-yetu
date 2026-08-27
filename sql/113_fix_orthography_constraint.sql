-- 113_fix_orthography_constraint.sql
-- Corrects a mistake in 110_data_truth.sql.
--
-- WHAT WENT WRONG
-- 110 added:
--
--   alter table public.entries
--     add constraint entries_headword_no_replacement_char
--     check (headword not like '%<U+FFFD>%') not valid;
--
-- The intent was "block NEW corruption, leave the existing 80 rows alone".
-- NOT VALID does not mean that. It only skips the one-off validation scan at
-- creation time; the constraint still applies to every INSERT *and every
-- UPDATE* from then on. So any update touching a corrupted row fails:
--
--   ERROR: new row for relation "entries" violates check constraint
--          "entries_headword_no_replacement_char"
--
-- 112 hit this while backfilling concept_id and rolled back entirely.
--
-- The deeper problem is that it also made the rows unrepairable. A moderator
-- correcting "Aa'h<U+FFFD>ey" to its real spelling has to UPDATE that row, and
-- the constraint would have rejected it - breaking the quarantine queue the
-- flag exists to create.
--
-- THE FIX
-- Tie the rule to the quarantine flag instead of to the table as a whole:
-- corrupted text is permitted only while the row is marked for review.
--
--   new clean row                        -> passes
--   new corrupted row, not flagged       -> rejected (the original intent)
--   existing corrupted row, flagged      -> passes, and can be updated
--   repaired row (clean text, unflagged) -> passes
--
-- Run this, then re-run 112_concept_spine.sql. 112 is idempotent - it rolled
-- back cleanly, so there is nothing to undo first.

begin;

alter table public.entries
  drop constraint if exists entries_headword_no_replacement_char;

-- Every row currently holding U+FFFD was flagged by 110, so this validates
-- immediately against the existing data. No NOT VALID needed this time.
alter table public.entries
  add constraint entries_headword_no_replacement_char
  check (
    headword not like '%' || U&'\FFFD' || '%'
    or needs_orthography_review
  );

comment on constraint entries_headword_no_replacement_char on public.entries is
  'Corrupted headwords may exist only while quarantined. Blocks new corruption from entering the corpus unnoticed, while still allowing moderators to repair the rows already flagged.';

commit;

-- Confirm: should return 80 rows, all with needs_orthography_review = true.
-- select count(*) filter (where needs_orthography_review) as flagged,
--        count(*) as total
--   from public.entries
--  where headword like '%' || U&'\FFFD' || '%';
