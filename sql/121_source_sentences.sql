-- 121_source_sentences.sql
--
-- Phase 4: real sentences from openly licensed datasets, and the words they
-- show the dictionary is missing.
--
--   source_sentences     Sentences in a language with their English or
--                        Kiswahili translation, from AfriVoices-KE and KenTrans
--                        (both CC BY 4.0). Signed-in contributors and reviewers
--                        can search them; they are not published as a list.
--                        Filled by scripts/import-sources.mjs.
--   headword_candidates  The most frequent words in those sentences that the
--                        dictionary does not have yet, per language. The gaps
--                        page offers them; adding the word ticks it off.
--   sentences_with_word  Up to N sentences containing a word, short ones first,
--                        for the entry form's example suggestions.
--
-- Safe to run more than once. Contains no data; the importer adds it.

begin;

create table if not exists public.source_sentences (
  id              uuid primary key default gen_random_uuid(),
  language_id     uuid not null references public.languages(id) on delete cascade,
  text            text not null,
  translation_en  text,
  translation_sw  text,
  source          text not null,             -- 'AfriVoices-KE', 'KenTrans'
  source_url      text,
  source_origin   text,                      -- where the dataset took the prompt from
  source_ref      text,                      -- the row's id in the source dataset
  licence         text not null default 'CC-BY-4.0',
  kind            text not null check (kind in ('read', 'spontaneous', 'parallel')),
  domain          text,
  dialect         text,
  created_at      timestamptz not null default now(),
  search          tsvector generated always as (to_tsvector('simple', public.lk_normalize(text))) stored,
  text_key        text generated always as (md5(lower(text))) stored,
  constraint source_sentences_unique_text unique (language_id, text_key)
);

create index if not exists idx_source_sentences_search on public.source_sentences using gin (search);
create index if not exists idx_source_sentences_language on public.source_sentences (language_id);

alter table public.source_sentences enable row level security;
drop policy if exists source_sentences_read_signed_in on public.source_sentences;
create policy source_sentences_read_signed_in on public.source_sentences
  for select to authenticated using (true);


create table if not exists public.headword_candidates (
  id           uuid primary key default gen_random_uuid(),
  language_id  uuid not null references public.languages(id) on delete cascade,
  word         text not null,                -- the most common spelling seen
  word_key     text not null,                -- lk_normalize(word), for matching
  frequency    integer not null,
  rank         integer not null,
  status       text not null default 'open'
               check (status in ('open', 'added', 'not_a_word')),
  entry_id     uuid references public.entries(id) on delete set null,
  updated_at   timestamptz not null default now(),
  constraint headword_candidates_unique unique (language_id, word_key)
);

create index if not exists idx_headword_candidates_open
  on public.headword_candidates (language_id, rank) where status = 'open';

alter table public.headword_candidates enable row level security;
drop policy if exists headword_candidates_read_signed_in on public.headword_candidates;
create policy headword_candidates_read_signed_in on public.headword_candidates
  for select to authenticated using (true);
drop policy if exists headword_candidates_update_moderator on public.headword_candidates;
create policy headword_candidates_update_moderator on public.headword_candidates
  for update to authenticated
  using (public.is_moderator(auth.uid()))
  with check (public.is_moderator(auth.uid()));

-- Adding an entry ticks its word off the list, whoever adds it and however.
create or replace function public.tick_headword_candidate()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  update public.headword_candidates
     set status = 'added', entry_id = new.id, updated_at = now()
   where language_id = new.language_id
     and word_key = public.lk_normalize(new.headword)
     and status = 'open';
  return new;
end;
$$;

drop trigger if exists trg_tick_headword_candidate on public.entries;
create trigger trg_tick_headword_candidate
  after insert or update of headword on public.entries
  for each row execute function public.tick_headword_candidate();


create or replace function public.sentences_with_word(p_language uuid, p_word text, p_limit integer default 6)
returns setof public.source_sentences
language sql
stable
as $$
  select s.*
    from public.source_sentences s
   where s.language_id = p_language
     and s.search @@ plainto_tsquery('simple', public.lk_normalize(p_word))
   order by length(s.text)
   limit least(greatest(coalesce(p_limit, 6), 1), 20);
$$;

commit;
