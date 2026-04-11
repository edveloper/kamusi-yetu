-- 049_activate_luhya_subgroup_wave1_olutsotso.sql
-- Purpose:
-- Activate Olutsotso after its first subgroup starter wave has been
-- staged, validated, and imported successfully.

begin;

update public.languages
set is_active = true
where lower(code) = 'lto';

commit;

-- Verification:
-- select code, name, native_name, is_active
-- from public.languages
-- where lower(code) = 'lto';
