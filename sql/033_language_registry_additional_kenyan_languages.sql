-- 033_language_registry_additional_kenyan_languages.sql
-- Purpose:
-- 1) Register additional standalone Kenyan languages not yet in the current registry.
-- 2) Keep them inactive first (is_active = false) for controlled rollout.
-- 3) Preserve existing codes and avoid changing already-registered languages.
--
-- Scope:
-- - pko  (Pokot)
-- - spy  (Sabaot)
-- - sxb  (Suba / Olusuba)
-- - bob  (Aweer / Boni)
-- - orc  (Orma)
-- - oki  (Okiek)
-- - muu  (Yaaku)
-- - omt  (Omotik)
-- - elo  (El Molo)

begin;

with proposed(code, name, native_name, is_active) as (
  values
    ('pko', 'Pokot', 'Pökoot', false),
    ('spy', 'Sabaot', 'Sabaot', false),
    ('sxb', 'Suba', 'Olusuba', false),
    ('bob', 'Aweer', 'Aweer', false),
    ('orc', 'Orma', 'Orma', false),
    ('oki', 'Okiek', 'Okiek', false),
    ('muu', 'Yaaku', 'Yaaku', false),
    ('omt', 'Omotik', 'Omotik', false),
    ('elo', 'El Molo', 'El Molo', false)
)
insert into public.languages (code, name, native_name, is_active)
select p.code, p.name, p.native_name, p.is_active
from proposed p
where not exists (
  select 1
  from public.languages l
  where lower(l.code) = lower(p.code)
);

commit;

-- Verification 1: confirm the new registry additions
-- select id, code, name, native_name, is_active
-- from public.languages
-- where code in ('pko', 'spy', 'sxb', 'bob', 'orc', 'oki', 'muu', 'omt', 'elo')
-- order by name;

-- Verification 2: see only registered-but-inactive languages
-- select code, name, native_name
-- from public.languages
-- where coalesce(is_active, false) = false
-- order by name;
