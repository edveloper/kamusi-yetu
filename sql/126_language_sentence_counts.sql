-- 126: how many sentences each language has, for the public pages.
--
-- source_sentences is readable only by signed-in users (sql/121), but the
-- Coverage, home and About pages show how far each language has come towards
-- machine translation, and sentence pairs are the main measure of that. This
-- returns counts only, never text. Safe to run more than once.

begin;

create or replace function public.language_sentence_counts()
returns table (language_id uuid, sentences bigint, sentence_pairs bigint)
language sql
stable
security definer
set search_path = public
set statement_timeout = '20s'
as $$
  select
    s.language_id,
    count(*) as sentences,
    count(*) filter (where s.translation_sw is not null or s.translation_en is not null) as sentence_pairs
  from public.source_sentences s
  group by s.language_id;
$$;

revoke all on function public.language_sentence_counts() from public;
grant execute on function public.language_sentence_counts() to anon, authenticated;

commit;
