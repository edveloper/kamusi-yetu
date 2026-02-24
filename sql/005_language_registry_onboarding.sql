-- 005_language_registry_onboarding.sql
-- Purpose:
-- 1) Register next expansion batch of languages.
-- 2) Keep them inactive first (is_active = false) for controlled rollout.
-- 3) Avoid changing existing production language codes in this step.

begin;

with proposed(code, name, native_name, is_active) as (
  values
    ('x-sheng', 'Sheng', 'Sheng', false),
    ('x-ke-hin', 'Kenyan Hindustani', 'Hindustani (Kenyan)', false),
    ('guz', 'Gusii', 'Ekegusii', false),
    ('mer', 'Meru', 'Kimeru', false),
    ('ebu', 'Embu', 'Kiembu', false),
    ('mas', 'Maasai', 'Maa', false),
    ('x-ke-trk', 'Turkana', 'Ng''aturkana', false),
    ('som', 'Somali', 'Af-Soomaali', false),
    ('orm', 'Borana Oromo', 'Afaan Oromoo', false),
    ('x-ke-pok', 'Pokomo', 'Kipokomo', false),
    ('dav', 'Taita', 'Kitaita', false),
    ('tvs', 'Taveta', 'Kitaveta', false),
    ('saq', 'Samburu', 'Samburu', false),
    ('rel', 'Rendille', 'Rendille', false),
    ('x-ke-kur', 'Kuria', 'Ekikuria', false),
    ('nyf', 'Giriama', 'Kigiryama', false),
    ('dig', 'Digo', 'Chidigo', false),
    ('dug', 'Duruma', 'Kiduruma', false),
    ('coh', 'Chonyi', 'Kichonyi', false),
    ('rra', 'Rabai', 'Kirabai', false)
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

-- Verification:
-- select id, code, name, native_name, is_active
-- from public.languages
-- where code in (
--   'x-sheng','x-ke-hin','guz','mer','ebu','mas','x-ke-trk',
--   'som','orm','x-ke-pok','dav','tvs','saq','rel','x-ke-kur',
--   'nyf','dig','dug','coh','rra'
-- )
-- order by name;
