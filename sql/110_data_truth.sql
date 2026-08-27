-- 110_data_truth.sql
-- Wave 2: stop publishing placeholder and corrupted data as "verified".
--
-- ############################################################################
-- #  DEPLOY ORDER: RUN THIS MIGRATION *BEFORE* DEPLOYING THE MATCHING CODE.  #
-- #                                                                          #
-- #  The application now filters public queries on needs_orthography_review,  #
-- #  which this migration creates. Deploying the code first makes every       #
-- #  public query fail with 42703 (undefined column) — homepage stats,        #
-- #  search, translate and entry pages all return errors.                     #
-- #                                                                          #
-- #  Correct order:  1. run this file   2. deploy                             #
-- #  Verify first:   select needs_orthography_review from public.entries      #
-- #                  limit 1;                                                 #
-- ############################################################################
--
-- Findings this addresses (see audit):
--   KY-01  1,199 entries (18.7%) carry the literal definition
--          "Definition pending curation." and are marked verified.
--   KY-03  358 headwords (5.6%) are orthographically corrupted. Only 12 can be
--          repaired mechanically; the rest need a native speaker. The source
--          spreadsheets and CSVs in this repo are ALSO corrupted, so there is
--          no clean copy to re-import from — the loss happened upstream of the
--          repo. We therefore quarantine rather than guess: inventing spellings
--          in a language-preservation corpus is the exact harm to avoid.
--   KY-06  1,522 rows have a part of speech sitting in the category column.
--   KY-07  3,381 rows (52.9%) have normalized_headword = NULL, and the rows
--          that do have it were written by a different normaliser than the app
--          uses, so diacritic-insensitive search silently fails.
--
-- Safe to run once, top to bottom. Every step reports what it changed.

begin;

-- =========================================================================
-- 1) A HONEST STATUS FOR SEEDED DATA
--    'seeded' means: machine-imported, publicly readable nowhere, not counted,
--    awaiting a human. It is distinct from 'pending' (a human submitted it and
--    it is queued for review).
-- =========================================================================

do $$
declare
  con_name text;
begin
  -- Widen whatever CHECK currently constrains validation_status.
  select conname into con_name
    from pg_constraint
   where conrelid = 'public.entries'::regclass
     and contype = 'c'
     and pg_get_constraintdef(oid) ilike '%validation_status%';

  if con_name is not null then
    execute format('alter table public.entries drop constraint %I', con_name);
  end if;

  alter table public.entries
    add constraint entries_validation_status_check
    check (validation_status in ('pending','verified','flagged','disputed','seeded'));
end $$;

-- Reclassify the placeholder rows.
with moved as (
  update public.entries
     set validation_status = 'seeded',
         updated_at = now()
   where validation_status = 'verified'
     and lower(btrim(primary_definition)) = 'definition pending curation.'
  returning 1
)
select count(*) as reclassified_as_seeded from moved;


-- =========================================================================
-- 2) QUARANTINE CORRUPTED ORTHOGRAPHY
--    Flagged rows stay in the database (they hold real lexical information)
--    but leave public view until a speaker of that language confirms the
--    spelling. This becomes the first queue in the elicitation UI.
-- =========================================================================

alter table public.entries
  add column if not exists needs_orthography_review boolean not null default false;

-- U+FFFD is unambiguous corruption.
update public.entries
   set needs_orthography_review = true
 where headword like '%' || U&'\FFFD' || '%';

-- '?' between two letters is corruption ("K?lala" was "Kĩlala").
update public.entries
   set needs_orthography_review = true
 where headword ~ '[[:alpha:]]\?[[:alpha:]]';

-- A trailing '?' is only corruption when the entry is NOT a question. Entries
-- whose gloss ends in '?' or which are phrases keep their legitimate mark.
update public.entries e
   set needs_orthography_review = true
 where e.headword ~ '\?$'
   and e.headword !~ '[[:alpha:]]\?[[:alpha:]]'
   and coalesce(lower(e.part_of_speech), '') <> 'phrase'
   and coalesce(btrim(e.english_translation), '') !~ '\?$'
   and coalesce(btrim(e.swahili_translation), '') !~ '\?$';

-- A '?' anywhere else in the string (leading, or mid-string next to a space).
update public.entries
   set needs_orthography_review = true
 where headword like '%?%'
   and needs_orthography_review = false
   and headword !~ '^[^?]*\?$';

create index if not exists idx_entries_orthography_review
  on public.entries (language_id)
  where needs_orthography_review;

select count(*) as flagged_for_orthography_review
  from public.entries where needs_orthography_review;

-- Block the corruption from ever being written again.
alter table public.entries
  drop constraint if exists entries_headword_no_replacement_char;
alter table public.entries
  add constraint entries_headword_no_replacement_char
  check (headword not like '%' || U&'\FFFD' || '%') not valid;


-- =========================================================================
-- 3) ONE NORMALISER, IN THE DATABASE
--    Replaces the TypeScript normalizeText() as the source of truth. Written
--    as an IMMUTABLE expression so it can back a generated column and an index.
--    Strips the diacritics actually used in Kenyan orthographies, folds case,
--    drops punctuation, collapses whitespace.
-- =========================================================================

create or replace function public.lk_normalize(input text)
returns text
language sql
immutable
strict
parallel safe
as $$
  select btrim(regexp_replace(
    regexp_replace(
      lower(translate(
        input,
        'ĩĨũŨẽẼãÃõÕáÁàÀâÂéÉèÈêÊíÍìÌîÎóÓòÒôÔúÚùÙûÛñÑçÇ',
        'iIuUeEaAoOaAaAaAeEeEeEiIiIiIoOoOoOuUuUuUnNcC'
      )),
      '[^a-z0-9 ]', ' ', 'g'),
    '\s+', ' ', 'g'));
$$;

-- Rebuild normalized_headword as a generated column so it can never drift.
do $$
begin
  if exists (
    select 1 from information_schema.columns
     where table_schema='public' and table_name='entries'
       and column_name='normalized_headword'
       and is_generated = 'NEVER'
  ) then
    alter table public.entries drop column normalized_headword;
  end if;

  if not exists (
    select 1 from information_schema.columns
     where table_schema='public' and table_name='entries'
       and column_name='normalized_headword'
  ) then
    alter table public.entries
      add column normalized_headword text
      generated always as (public.lk_normalize(headword)) stored;
  end if;
end $$;

create index if not exists idx_entries_normalized_headword
  on public.entries (language_id, normalized_headword);

-- Now that normalisation is consistent, duplicates are detectable. Report them
-- rather than deleting: which of a pair to keep is an editorial decision.
select e.language_id,
       e.normalized_headword,
       count(*) as copies,
       array_agg(e.headword order by e.created_at) as variants,
       array_agg(e.id      order by e.created_at) as ids
  from public.entries e
 group by e.language_id, e.normalized_headword
having count(*) > 1
 order by count(*) desc;


-- =========================================================================
-- 4) DECONTAMINATE THE CATEGORY COLUMN
--    Part-of-speech values leaked into category during import.
-- =========================================================================

with pos as (
  select unnest(array['noun','verb','adjective','adverb','pronoun',
                      'preposition','conjunction','interjection','phrase']) as v
),
fixed as (
  update public.entries e
     set part_of_speech = coalesce(nullif(btrim(e.part_of_speech), ''), lower(btrim(e.category))),
         category = null,
         updated_at = now()
   where lower(btrim(e.category)) in (select v from pos)
  returning 1
)
select count(*) as category_values_moved_to_part_of_speech from fixed;

commit;


-- =========================================================================
-- 5) WHAT THE PUBLIC NUMBERS BECOME
--    Run after committing. These are the figures the site should report.
-- =========================================================================

-- select
--   count(*) filter (where validation_status = 'verified'
--                      and not needs_orthography_review)            as publicly_verified,
--   count(*) filter (where validation_status = 'seeded')            as awaiting_curation,
--   count(*) filter (where needs_orthography_review)                as awaiting_orthography,
--   count(*) filter (where validation_status = 'verified'
--                      and not needs_orthography_review
--                      and language_id not in (
--                        select id from public.languages where code = 'en'))
--                                                                   as excluding_english
-- from public.entries;
