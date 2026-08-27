-- 112_concept_spine.sql
-- Wave 5: give the corpus a concept layer, and derive the first one from the
-- data that is already here.
--
-- THE PROBLEM
-- The translation graph is joined on strings. The pivot asks: does any target
-- entry have an english_translation whose text matches this source entry's?
-- That is why the Kikuyu row glossed "Mother in Kikuyu" is a dead end - it will
-- never match a Dholuo row glossed "mother". Every gloss variation, synonym,
-- plural or stray article silently severs an edge in the graph.
--
-- THE FIX
-- Entries point at a concept. Translation equivalence becomes a join:
--
--     where target.concept_id = source.concept_id and target.language_id = $1
--
-- exact, indexable, and correct by construction.
--
-- WHERE THE CONCEPTS COME FROM
-- Not an external download. 225 English glosses in this corpus are already
-- shared by two or more languages - that shared usage IS the evidence of a
-- concept, and it covers about 68% of entries. Concepticon and Open English
-- WordNet can be layered on later through source_list and external_ref, which
-- are here waiting; nothing about this migration blocks that.
--
-- DEPLOY ORDER: run this before deploying the code that reads concept_id.

begin;

-- =========================================================================
-- 1) CONCEPT KEY
--    Stricter than lk_normalize: also strips the leading article or "to" that
--    makes "to drink", "drink" and "The drink" look like three concepts.
-- =========================================================================

create or replace function public.lk_concept_key(input text)
returns text
language sql
immutable
strict
parallel safe
as $$
  select nullif(
    btrim(regexp_replace(
      regexp_replace(public.lk_normalize(input), '^(to|a|an|the)\s+', '', 'i'),
      '\s+', ' ', 'g')),
    '');
$$;


-- =========================================================================
-- 2) CONCEPTS
-- =========================================================================

create table if not exists public.concepts (
  id          uuid primary key default gen_random_uuid(),

  -- The normalised join key. This is what entries match on.
  concept_key text not null unique,

  -- Human-facing labels: what a contributor is shown when asked to supply a
  -- word. Both bridges, because some contributors read Swahili more comfortably
  -- than English and elicitation should meet them where they are.
  gloss_en text,
  gloss_sw text,

  domain text,   -- maps to the existing CATEGORIES ids

  -- Provenance, for concepts imported later from a published list.
  source_list  text not null default 'derived_from_corpus',
  external_ref text,

  -- Lower rank = ask for this first. Seeded from how many languages already
  -- have the concept, which is a real signal of how core it is.
  priority_rank integer not null default 1000,

  created_at timestamptz not null default now(),

  constraint concepts_has_a_label check (gloss_en is not null or gloss_sw is not null)
);

create index if not exists idx_concepts_priority on public.concepts (priority_rank);
create index if not exists idx_concepts_domain   on public.concepts (domain);

comment on table public.concepts is
  'Language-independent meanings. Entries in different languages that share a concept are translation equivalents by construction, not by string matching.';


-- =========================================================================
-- 3) DERIVE THE FIRST CONCEPT SET
--    A gloss used for entries in two or more distinct languages is treated as
--    evidence of a shared concept. Single-language glosses are skipped: they
--    may be real, but there is nothing yet to corroborate them.
-- =========================================================================

with candidates as (
  select
    public.lk_concept_key(e.english_translation) as key,
    count(distinct e.language_id)                as language_count,
    -- the most frequent surface form becomes the label
    mode() within group (order by btrim(e.english_translation)) as gloss_en,
    mode() within group (order by btrim(e.swahili_translation)) as gloss_sw,
    mode() within group (order by e.category)                   as domain
  from public.entries e
  where e.validation_status = 'verified'
    and not e.needs_orthography_review
    and public.lk_concept_key(e.english_translation) is not null
  group by 1
  having count(distinct e.language_id) >= 2
)
insert into public.concepts (concept_key, gloss_en, gloss_sw, domain, priority_rank, source_list)
select
  key,
  gloss_en,
  nullif(gloss_sw, ''),
  nullif(domain, ''),
  -- most widely attested concepts get the lowest rank, so they are asked first
  row_number() over (order by language_count desc, key),
  'derived_from_corpus'
from candidates
on conflict (concept_key) do nothing;

-- Swahili-only concepts: a gloss with no English side still names a meaning.
with candidates as (
  select
    public.lk_concept_key(e.swahili_translation) as key,
    count(distinct e.language_id)                as language_count,
    mode() within group (order by btrim(e.swahili_translation)) as gloss_sw,
    mode() within group (order by e.category)                   as domain
  from public.entries e
  where e.validation_status = 'verified'
    and not e.needs_orthography_review
    and public.lk_concept_key(e.english_translation) is null
    and public.lk_concept_key(e.swahili_translation) is not null
  group by 1
  having count(distinct e.language_id) >= 2
)
insert into public.concepts (concept_key, gloss_sw, domain, priority_rank, source_list)
select key, gloss_sw, nullif(domain, ''),
       1000 + row_number() over (order by language_count desc, key),
       'derived_from_corpus'
from candidates
on conflict (concept_key) do nothing;

select count(*) as concepts_created from public.concepts;


-- =========================================================================
-- 4) LINK ENTRIES
-- =========================================================================

alter table public.entries
  add column if not exists concept_id uuid references public.concepts(id) on delete set null;

create index if not exists idx_entries_concept
  on public.entries (concept_id, language_id)
  where concept_id is not null;

-- The join that replaces the whole string-matching pivot.
create index if not exists idx_entries_concept_lookup
  on public.entries (concept_id, language_id, validation_status)
  where concept_id is not null and not needs_orthography_review;

-- Match on English first; it is the more reliable bridge in this corpus.
update public.entries e
   set concept_id = c.id
  from public.concepts c
 where e.concept_id is null
   and c.concept_key = public.lk_concept_key(e.english_translation);

-- Then Swahili, for entries with no English side.
update public.entries e
   set concept_id = c.id
  from public.concepts c
 where e.concept_id is null
   and c.concept_key = public.lk_concept_key(e.swahili_translation);

select
  count(*) filter (where concept_id is not null) as entries_linked,
  count(*)                                       as entries_total,
  round(100.0 * count(*) filter (where concept_id is not null) / nullif(count(*), 0), 1) as percent_linked
from public.entries
where validation_status = 'verified' and not needs_orthography_review;


-- =========================================================================
-- 4b) PROVENANCE ON ENTRIES
--    A linguist will not build on data whose origin cannot be traced, and the
--    elicitation flow needs somewhere to record that a word came from a
--    speaker rather than a spreadsheet. entry_suggestions already had these
--    two columns; entries did not.
-- =========================================================================

alter table public.entries
  add column if not exists source_type text,
  add column if not exists source_reference text;

do $$
begin
  if not exists (
    select 1 from pg_constraint
     where conrelid = 'public.entries'::regclass and conname = 'entries_source_type_check'
  ) then
    alter table public.entries
      add constraint entries_source_type_check
      check (source_type is null or source_type in
        ('seed_pack','elicited','community','expert_review','published_source','import'));
  end if;
end $$;

-- Everything already here arrived through a bulk seed.
update public.entries
   set source_type = 'seed_pack'
 where source_type is null and created_by is null;

update public.entries
   set source_type = 'community'
 where source_type is null and created_by is not null;

create index if not exists idx_entries_source_type on public.entries (source_type);


-- =========================================================================
-- 5) THE GAP QUEUE
--    What a speaker of language X is asked for next: concepts that other
--    languages already have and theirs does not, most widely attested first.
--    This is the elicitation loop - it replaces a blank thirteen-field form
--    with a prioritised list of real gaps.
-- =========================================================================

create or replace view public.concept_gaps as
select
  l.id   as language_id,
  l.code as language_code,
  l.name as language_name,
  c.id   as concept_id,
  c.concept_key,
  c.gloss_en,
  c.gloss_sw,
  c.domain,
  c.priority_rank
from public.languages l
cross join public.concepts c
where l.is_active
  and not exists (
    select 1
      from public.entries e
     where e.language_id = l.id
       and e.concept_id  = c.id
       and e.validation_status in ('verified', 'pending')
       and not e.needs_orthography_review
  );

comment on view public.concept_gaps is
  'Concepts a given active language does not yet have. Ordered by priority_rank, this is the contribution queue.';

-- Per-language completeness: turns the four maturity tiers from adjectives
-- into arithmetic.
create or replace view public.language_concept_coverage as
select
  l.id   as language_id,
  l.code as language_code,
  l.name as language_name,
  (select count(*) from public.concepts) as concepts_total,
  count(distinct e.concept_id) filter (
    where e.validation_status = 'verified' and not e.needs_orthography_review
  ) as concepts_covered,
  round(
    100.0 * count(distinct e.concept_id) filter (
      where e.validation_status = 'verified' and not e.needs_orthography_review
    ) / nullif((select count(*) from public.concepts), 0), 1
  ) as percent_covered
from public.languages l
left join public.entries e on e.language_id = l.id and e.concept_id is not null
where l.is_active
group by l.id, l.code, l.name;


-- =========================================================================
-- 6) TRANSLATION GAPS
--    Every failed lookup is a speaker telling you exactly which word, in which
--    pair, is missing. That was being discarded on every miss.
-- =========================================================================

create table if not exists public.translation_gaps (
  id uuid primary key default gen_random_uuid(),
  query_text          text not null,
  normalized_query    text generated always as (public.lk_normalize(query_text)) stored,
  source_language_id  uuid references public.languages(id) on delete cascade,
  target_language_id  uuid references public.languages(id) on delete cascade,
  hit_count           integer not null default 1,
  last_seen_at        timestamptz not null default now(),
  created_at          timestamptz not null default now(),
  resolved_entry_id   uuid references public.entries(id) on delete set null
);

create unique index if not exists uq_translation_gaps_query
  on public.translation_gaps (normalized_query, source_language_id, target_language_id);
create index if not exists idx_translation_gaps_demand
  on public.translation_gaps (hit_count desc, last_seen_at desc)
  where resolved_entry_id is null;

create or replace function public.record_translation_gap(
  p_query text,
  p_source uuid,
  p_target uuid
) returns void
language sql
security definer
set search_path = public
as $$
  insert into public.translation_gaps (query_text, source_language_id, target_language_id)
  select p_query, p_source, p_target
  where public.lk_normalize(p_query) is not null and public.lk_normalize(p_query) <> ''
  on conflict (normalized_query, source_language_id, target_language_id)
  do update set hit_count = public.translation_gaps.hit_count + 1,
                last_seen_at = now();
$$;


-- =========================================================================
-- 7) ROW LEVEL SECURITY
-- =========================================================================

alter table public.concepts          enable row level security;
alter table public.translation_gaps  enable row level security;

drop policy if exists concepts_public_select on public.concepts;
create policy concepts_public_select on public.concepts
  for select to anon, authenticated using (true);

-- Gaps are written only through the security-definer function above, and read
-- by moderators deciding what to prioritise.
drop policy if exists translation_gaps_select_moderator on public.translation_gaps;
create policy translation_gaps_select_moderator on public.translation_gaps
  for select to authenticated
  using (exists (
    select 1 from public.user_profiles p
     where p.id = auth.uid()
       and lower(coalesce(p.role,'')) in ('moderator','admin','guardian')
  ));

commit;


-- =========================================================================
-- 8) CHECK THE RESULT
-- =========================================================================
-- select count(*) from public.concepts;
-- select * from public.language_concept_coverage order by percent_covered desc;
-- select gloss_en, count(*) from public.concept_gaps group by 1 order by 2 desc limit 20;
--
-- NEXT, WHEN YOU IMPORT A PUBLISHED LIST
-- Concepticon and Open English WordNet slot in through source_list and
-- external_ref. Insert new rows with source_list = 'concepticon' and set
-- priority_rank from the published list. Existing derived concepts can then be
-- merged into them by concept_key. Both are CC BY; PanLex is CC0. Wiktionary
-- is CC BY-SA and must not be merged into entries - see LICENSE-CORPUS.md.
