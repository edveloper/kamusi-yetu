-- 061_activate_kalenjin_subgroup_wave2_tugen.sql
-- Purpose:
-- Activate Tugen after its starter wave has been staged, validated, and imported successfully.

begin;

update public.languages
set is_active = true
where lower(code) = 'tuy';

commit;

-- Verification:
-- select code, name, native_name, is_active
-- from public.languages
-- where lower(code) = 'tuy';
