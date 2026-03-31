-- 041_activate_wave1_languages.sql
-- Purpose:
-- Activate the first standalone rollout wave after starter packs have been
-- staged, validated, and applied successfully.
--
-- Wave 1:
-- - pko  (Pokot)
-- - sxb  (Suba / Olusuba)
-- - orc  (Orma)
--
-- Safe behavior:
-- - Only flips is_active from false -> true for listed codes.
-- - Does not modify existing active languages.

begin;

with wave(code) as (
  values
    ('pko'),
    ('sxb'),
    ('orc')
)
update public.languages l
set is_active = true
from wave w
where lower(l.code) = lower(w.code)
  and coalesce(l.is_active, false) = false;

commit;

-- Verification 1: confirm Wave 1 activation status
-- select code, name, native_name, is_active
-- from public.languages
-- where lower(code) in ('pko', 'sxb', 'orc')
-- order by name;

-- Verification 2: confirm live entry counts for Wave 1
-- select l.code, l.name, count(*) as rows
-- from public.entries e
-- join public.languages l on l.id = e.language_id
-- where lower(l.code) in ('pko', 'sxb', 'orc')
-- group by l.code, l.name
-- order by l.code;
