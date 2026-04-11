-- 045_activate_sabaot_wave2.sql
-- Purpose:
-- Activate Sabaot after its Wave 2 starter pack has been staged,
-- validated, and imported successfully.

begin;

update public.languages
set
  is_active = true
where lower(code) = 'spy';

commit;

-- Verification:
-- select code, name, native_name, is_active
-- from public.languages
-- where lower(code) = 'spy';
