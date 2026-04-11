-- 057_activate_kalenjin_subgroup_wave1_kipsigis_nandi.sql
-- Purpose:
-- Activate Kipsigis and Nandi after their starter wave has been
-- staged, validated, and imported successfully.

begin;

update public.languages
set is_active = true
where lower(code) in ('sgc', 'niq');

commit;

-- Verification:
-- select code, name, native_name, is_active
-- from public.languages
-- where lower(code) in ('sgc', 'niq')
-- order by code;
