-- 037_language_registry_luhya_kalenjin_subgroups.sql
-- Purpose:
-- 1) Register Luhya and Kalenjin subgroup languages as first-class language records.
-- 2) Keep them inactive first (is_active = false) for controlled rollout.
-- 3) Preserve existing umbrella records (`luy`, `kal`) while enabling future finer-grained coverage.
--
-- Scope:
-- Luhya group:
-- - bxk  Bukusu
-- - ida  Idakho-Isukha-Tiriki
-- - rag  Logooli / Maragoli
-- - lts  Lutachoni
-- - lkb  Lukabaras
-- - lks  Olushisa
-- - lto  Olutsotso
-- - lwg  Oluwanga
-- - lrm  Olumarama
-- - lsm  Samia
-- - lko  Olukhayo
-- - lri  Olumarachi
-- - nyd  Olunyole
-- - nle  Nyala
--
-- Kalenjin group:
-- - sgc  Kipsigis
-- - niq  Nandi
-- - tuy  Tugen
-- - eyo  Keiyo
-- - tec  Terik
-- - enb  Markweeta
--
-- Existing separate Kalenjin-related records already in registry and therefore not repeated here:
-- - pko  Pokot
-- - spy  Sabaot
-- - oki  Okiek
-- - omt  Omotik

begin;

with proposed(code, name, native_name, is_active) as (
  values
    ('bxk', 'Bukusu', 'Lubukusu', false),
    ('ida', 'Idakho-Isukha-Tiriki', 'Luidakho', false),
    ('rag', 'Logooli', 'Lulogooli', false),
    ('lts', 'Lutachoni', 'Lutachoni', false),
    ('lkb', 'Lukabaras', 'Lukabarasi', false),
    ('lks', 'Olushisa', 'Olushisa', false),
    ('lto', 'Olutsotso', 'Olutsotso', false),
    ('lwg', 'Oluwanga', 'Oluwanga', false),
    ('lrm', 'Olumarama', 'Olumarama', false),
    ('lsm', 'Samia', 'Olusaamia', false),
    ('lko', 'Olukhayo', 'Olukhayo', false),
    ('lri', 'Olumarachi', 'Olumarachi', false),
    ('nyd', 'Olunyole', 'Olunyole', false),
    ('nle', 'Nyala', 'Lunyala', false),
    ('sgc', 'Kipsigis', 'Kipsigis', false),
    ('niq', 'Nandi', 'Nandi', false),
    ('tuy', 'Tugen', 'Tugen', false),
    ('eyo', 'Keiyo', 'Keiyo', false),
    ('tec', 'Terik', 'Terik', false),
    ('enb', 'Markweeta', 'Markweeta', false)
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

-- Verification 1: confirm subgroup registry additions
-- select code, name, native_name, is_active
-- from public.languages
-- where code in (
--   'bxk', 'ida', 'rag', 'lts', 'lkb', 'lks', 'lto', 'lwg', 'lrm', 'lsm',
--   'lko', 'lri', 'nyd', 'nle', 'sgc', 'niq', 'tuy', 'eyo', 'tec', 'enb'
-- )
-- order by name;

-- Verification 2: see all registered-but-inactive subgroup additions
-- select code, name, native_name
-- from public.languages
-- where code in (
--   'bxk', 'ida', 'rag', 'lts', 'lkb', 'lks', 'lto', 'lwg', 'lrm', 'lsm',
--   'lko', 'lri', 'nyd', 'nle', 'sgc', 'niq', 'tuy', 'eyo', 'tec', 'enb'
-- )
--   and coalesce(is_active, false) = false
-- order by name;
