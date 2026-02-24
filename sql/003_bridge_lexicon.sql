-- 003_bridge_lexicon.sql
-- Purpose: Add EN<->SW bridge lexicon for mixed pivot translation paths:
-- source -> swahili -> english -> target OR source -> english -> swahili -> target

begin;

create table if not exists public.bridge_lexicon (
  id uuid primary key default gen_random_uuid(),
  swahili_term text not null,
  english_term text not null,
  normalized_swahili text generated always as (
    lower(trim(regexp_replace(swahili_term, '\s+', ' ', 'g')))
  ) stored,
  normalized_english text generated always as (
    lower(trim(regexp_replace(english_term, '\s+', ' ', 'g')))
  ) stored,
  confidence numeric(5,4) not null default 0.9000,
  source text not null default 'manual', -- manual|derived|import
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint bridge_lexicon_confidence_range check (confidence >= 0 and confidence <= 1)
);

create unique index if not exists uq_bridge_lexicon_norm_pair
  on public.bridge_lexicon(normalized_swahili, normalized_english);

create index if not exists idx_bridge_lexicon_norm_sw
  on public.bridge_lexicon(normalized_swahili);

create index if not exists idx_bridge_lexicon_norm_en
  on public.bridge_lexicon(normalized_english);

drop trigger if exists trg_bridge_lexicon_updated_at on public.bridge_lexicon;
create trigger trg_bridge_lexicon_updated_at
before update on public.bridge_lexicon
for each row execute function public.set_updated_at_now();

-- Seed a starter list of high-frequency pairs.
insert into public.bridge_lexicon (swahili_term, english_term, confidence, source)
values
  ('maji', 'water', 0.98, 'manual'),
  ('chakula', 'food', 0.98, 'manual'),
  ('mama', 'mother', 0.99, 'manual'),
  ('baba', 'father', 0.99, 'manual'),
  ('mtoto', 'child', 0.98, 'manual'),
  ('nyumba', 'house', 0.98, 'manual'),
  ('kitabu', 'book', 0.98, 'manual'),
  ('mtu', 'person', 0.98, 'manual'),
  ('rafiki', 'friend', 0.97, 'manual'),
  ('mwalimu', 'teacher', 0.97, 'manual'),
  ('shule', 'school', 0.97, 'manual'),
  ('kanisa', 'church', 0.96, 'manual'),
  ('pesa', 'money', 0.97, 'manual'),
  ('kazi', 'work', 0.97, 'manual'),
  ('siku', 'day', 0.97, 'manual'),
  ('usiku', 'night', 0.97, 'manual'),
  ('mwaka', 'year', 0.97, 'manual'),
  ('wakati', 'time', 0.97, 'manual'),
  ('mkono', 'hand', 0.97, 'manual'),
  ('jicho', 'eye', 0.97, 'manual'),
  ('kichwa', 'head', 0.97, 'manual'),
  ('moyo', 'heart', 0.97, 'manual'),
  ('jua', 'sun', 0.97, 'manual'),
  ('mvua', 'rain', 0.97, 'manual'),
  ('mti', 'tree', 0.97, 'manual'),
  ('gari', 'car', 0.97, 'manual'),
  ('barabara', 'road', 0.97, 'manual'),
  ('kula', 'eat', 0.98, 'manual'),
  ('kunywa', 'drink', 0.98, 'manual'),
  ('kwenda', 'go', 0.98, 'manual'),
  ('kuja', 'come', 0.98, 'manual'),
  ('kuona', 'see', 0.98, 'manual'),
  ('kusikia', 'hear', 0.98, 'manual'),
  ('kusema', 'speak', 0.98, 'manual'),
  ('kusoma', 'read', 0.98, 'manual'),
  ('kuandika', 'write', 0.98, 'manual'),
  ('kutembea', 'walk', 0.98, 'manual'),
  ('kukimbia', 'run', 0.98, 'manual'),
  ('kukaa', 'sit', 0.98, 'manual'),
  ('kusimama', 'stand', 0.98, 'manual'),
  ('kulala', 'sleep', 0.98, 'manual'),
  ('kuamka', 'wake', 0.98, 'manual'),
  ('kutoa', 'give', 0.97, 'manual'),
  ('kuchukua', 'take', 0.97, 'manual'),
  ('kujua', 'know', 0.97, 'manual'),
  ('kufikiria', 'think', 0.97, 'manual'),
  ('kutaka', 'want', 0.97, 'manual'),
  ('nzuri', 'good', 0.97, 'manual'),
  ('mbaya', 'bad', 0.97, 'manual'),
  ('kubwa', 'big', 0.97, 'manual'),
  ('ndogo', 'small', 0.97, 'manual'),
  ('moto', 'hot', 0.97, 'manual'),
  ('baridi', 'cold', 0.97, 'manual'),
  ('mpya', 'new', 0.97, 'manual'),
  ('furaha', 'happy', 0.96, 'manual'),
  ('huzuni', 'sad', 0.96, 'manual')
on conflict (normalized_swahili, normalized_english) do nothing;

commit;
