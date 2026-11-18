-- 123: sentence memory for the Translate page.
--
-- When someone types a sentence, the dictionary cannot translate it, but the
-- source sentences (sql/121) often hold a real sentence pair that is close.
-- similar_sentences finds the closest ones, scoring shared words by how rare
-- they are, so sharing "changamoto" counts for far more than sharing "na".
--
--   p_language  the language whose sentences are searched
--   p_text      what was typed
--   p_side      'text' to search the sentences themselves (typed in Dholuo,
--               say), 'translation' to search their English or Kiswahili
--               translations (typed in Kiswahili, looking for Dholuo)
--   p_bridge    'en' or 'sw': only pairs with a translation in that language
--   p_limit     at most 10
--
-- Returns each pair with score: the share of the typed words' weight it
-- covers, 0 to 1. The page decides what is close enough to show.
--
-- Held-out test sentences (text_key starting '00', sql/122) are never
-- returned, or the translation test would be grading answers it was given.
--
-- Adds one generated column and its index (the table is rewritten once, a few
-- seconds at today's size). Safe to run more than once.

begin;

alter table public.source_sentences
  add column if not exists translation_search tsvector
  generated always as (
    to_tsvector('simple', public.lk_normalize(coalesce(translation_en, '') || ' ' || coalesce(translation_sw, '')))
  ) stored;

create index if not exists idx_source_sentences_translation_search
  on public.source_sentences using gin (translation_search);

create or replace function public.similar_sentences(
  p_language uuid,
  p_text text,
  p_side text default 'text',
  p_bridge text default 'sw',
  p_limit integer default 3
)
returns table (
  id uuid,
  text text,
  translation_en text,
  translation_sw text,
  source text,
  source_origin text,
  source_url text,
  licence text,
  score real
)
language plpgsql
stable
set search_path = public
as $$
declare
  col   text := case when p_side = 'translation' then 'translation_search' else 'search' end;
  words text[];
  dfs   integer[] := '{}';
  word  text;
  df    integer;
begin
  select array_agg(t.x) into words
    from (select distinct x
            from unnest(string_to_array(public.lk_normalize(coalesce(p_text, '')), ' ')) as x
           where length(x) >= 2
           limit 20) t;
  if words is null then
    return;
  end if;

  -- How common is each word? Counting stops at 5,000, which is plenty to
  -- tell "na" from "changamoto".
  foreach word in array words loop
    execute format(
      'select count(*) from (select 1 from public.source_sentences s
         where s.language_id = $1 and s.%I @@ to_tsquery(''simple'', $2) limit 5000) t', col)
      into df using p_language, word;
    dfs := dfs || df;
  end loop;

  return query execute format($q$
    with w as (
      select u.word, u.df, ln(5001.0 / (u.df + 1)) as weight
        from unnest($3::text[], $4::integer[]) as u(word, df)
       where u.df > 0
    ),
    rare as (select w.word from w order by w.df limit 4),
    cand as (
      select s.*
        from public.source_sentences s
       where s.language_id = $1
         and s.text_key not like '00%%'
         and s.%1$I @@ to_tsquery('simple', (select string_agg(rare.word, ' | ') from rare))
         and case when $5 = 'en' then s.translation_en is not null else s.translation_sw is not null end
       limit 3000
    ),
    scored as (
      select c.*,
             (select coalesce(sum(w.weight), 0) from w where c.%1$I @@ to_tsquery('simple', w.word)) as sc
        from cand c
    ),
    -- Typed words no sentence has (a name, a typo, a word the data lacks)
    -- still count against the score, at the average weight, so a pair is
    -- never called a full match while part of what was typed is missing.
    total as (
      select (select coalesce(sum(w.weight), 0) from w)
           + (cardinality($3::text[]) - (select count(*) from w))
             * coalesce((select avg(w.weight) from w), 0) as weight
    )
    select sc2.id, sc2.text, sc2.translation_en, sc2.translation_sw, sc2.source,
           sc2.source_origin, sc2.source_url, sc2.licence,
           (sc2.sc / nullif((select total.weight from total), 0))::real
      from scored sc2
     order by sc2.sc desc, length(sc2.text)
     limit $2
  $q$, col)
  using p_language, least(greatest(coalesce(p_limit, 3), 1), 10), words, dfs, p_bridge;
end;
$$;

commit;
