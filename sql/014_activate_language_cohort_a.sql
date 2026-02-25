-- 014_activate_language_cohort_a.sql
-- Purpose:
-- Activate the first rollout cohort of newly onboarded languages so they appear on the website.
--
-- Cohort A:
-- - x-sheng      (Sheng)
-- - x-ke-hin     (Kenyan Hindustani)
-- - guz          (Gusii)
-- - mer          (Meru)
-- - ebu          (Embu)
--
-- Safe behavior:
-- - Only flips is_active from false -> true for listed codes.
-- - Does not modify existing active languages.

begin;

with cohort(code) as (
  values
    ('x-sheng'),
    ('x-ke-hin'),
    ('guz'),
    ('mer'),
    ('ebu')
)
update public.languages l
set is_active = true
from cohort c
where lower(l.code) = lower(c.code)
  and coalesce(l.is_active, false) = false;

commit;

-- Verification 1: confirm cohort activation status
-- select code, name, native_name, is_active
-- from public.languages
-- where lower(code) in ('x-sheng', 'x-ke-hin', 'guz', 'mer', 'ebu')
-- order by name;

-- Verification 2: see all currently active languages
-- select code, name, native_name
-- from public.languages
-- where is_active = true
-- order by name;
