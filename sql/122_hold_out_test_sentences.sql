-- 122: keep the translation test sentences out of example suggestions.
--
-- The translation test (scripts/translation-test.mjs) scores the translator on
-- a fixed slice of source_sentences: those whose text_key starts with '00',
-- about 1 in 256 (lib/translation/evaluation.ts, HOLD_OUT_PREFIX). If those
-- sentences could be added as examples, the test would one day be checking the
-- translator against answers it had been given. So sentences_with_word, which
-- feeds the "Real sentences" box and the Most Used Words page, skips them.
--
-- Changes one function. No data is touched. Safe to run more than once.

begin;

create or replace function public.sentences_with_word(p_language uuid, p_word text, p_limit integer default 6)
returns setof public.source_sentences
language sql
stable
as $$
  select s.*
    from public.source_sentences s
   where s.language_id = p_language
     and s.search @@ plainto_tsquery('simple', public.lk_normalize(p_word))
     and s.text_key not like '00%'   -- held out for the translation test
   order by length(s.text)
   limit least(greatest(coalesce(p_limit, 6), 1), 20);
$$;

commit;

-- Check afterwards (should be 0: no example so far is a held-out sentence):
-- select count(*) from public.entry_usage_examples
--  where md5(lower(example_text)) like '00%'
--    and source_name in ('AfriVoices-KE', 'KenTrans', 'Common Voice');
