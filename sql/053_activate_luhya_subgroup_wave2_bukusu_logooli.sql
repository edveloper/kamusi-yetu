-- 053_activate_luhya_subgroup_wave2_bukusu_logooli.sql
-- Purpose:
-- Activate Bukusu and Logooli after their starter wave has been
-- staged, validated, and imported successfully.

begin;

update public.languages
set is_active = true
where lower(code) in ('bxk', 'rag');

commit;

-- Verification:
-- select code, name, native_name, is_active
-- from public.languages
-- where lower(code) in ('bxk', 'rag')
-- order by code;
