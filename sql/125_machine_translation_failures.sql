-- 125: machine translations that could not be given.
--
-- One row per day, language pair and reason, with a count. It shows how often
-- people are turned away, for example when the Space's daily GPU allowance has
-- run out ('quota'), so we can decide whether a bigger allowance is worth it.
-- No text is kept, only counts. Written by the server (service role) through
-- record_machine_translation_failure. Safe to run more than once.

begin;

create table if not exists public.machine_translation_failures (
  day          date not null default current_date,
  source_code  text not null,
  target_code  text not null,
  reason       text not null check (reason in ('quota', 'busy', 'unavailable')),
  count        integer not null default 1,
  primary key (day, source_code, target_code, reason)
);
alter table public.machine_translation_failures enable row level security;
-- No policies: only the server reads and writes it.

create or replace function public.record_machine_translation_failure(p_source text, p_target text, p_reason text)
returns void
language sql
security definer
set search_path = public
as $$
  insert into public.machine_translation_failures (source_code, target_code, reason)
  values (p_source, p_target, p_reason)
  on conflict (day, source_code, target_code, reason)
  do update set count = machine_translation_failures.count + 1;
$$;
revoke all on function public.record_machine_translation_failure(text, text, text) from public, anon, authenticated;

commit;
