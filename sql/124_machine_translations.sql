-- 124: machine translations (NLLB-200) and what speakers say about them.
--
-- The Translate page asks the LughaKonnect Space (services/translate-space/)
-- for a machine translation when the dictionary has no checked answer. Every
-- answer is saved here so the same request is instant next time and the free
-- GPU allowance is not spent twice.
--
-- NLLB-200 is licensed CC BY-NC 4.0. Its output is shown free, labelled, and
-- is never copied into entries, examples or source_sentences, which are CC BY.
-- That is why it lives in its own table.
--
-- machine_translation_feedback holds speakers' verdicts and their own better
-- versions. A better version is the speaker's own sentence; once a reviewer
-- accepts it, it can become a sentence pair in the dictionary's data.
--
-- Both tables are written and read only by the server (service role), after
-- it has checked who is signing in. Moderators can read the feedback.
-- Safe to run more than once.

begin;

create table if not exists public.machine_translations (
  id            uuid primary key default gen_random_uuid(),
  source_code   text not null,
  target_code   text not null,
  source_text   text not null check (length(source_text) between 1 and 400),
  text_key      text generated always as (md5(lower(source_text))) stored,
  translation   text not null,
  model         text not null,
  hits          integer not null default 1,
  created_at    timestamptz not null default now(),
  last_used_at  timestamptz not null default now(),
  constraint machine_translations_unique unique (source_code, target_code, model, text_key)
);
create index if not exists idx_machine_translations_created on public.machine_translations (created_at);
alter table public.machine_translations enable row level security;
-- No policies: browsers cannot read or write it. The server uses the service role.

create table if not exists public.machine_translation_feedback (
  id                      uuid primary key default gen_random_uuid(),
  machine_translation_id  uuid not null references public.machine_translations(id) on delete cascade,
  -- Kept without attribution if the account is deleted, like contributions.
  user_id                 uuid references auth.users(id) on delete set null,
  verdict                 text not null check (verdict in ('right', 'wrong')),
  better_text             text check (better_text is null or length(better_text) between 1 and 400),
  status                  text not null default 'pending' check (status in ('pending', 'accepted', 'rejected')),
  created_at              timestamptz not null default now(),
  constraint machine_translation_feedback_once unique (machine_translation_id, user_id)
);
alter table public.machine_translation_feedback enable row level security;

drop policy if exists machine_translation_feedback_moderators_read on public.machine_translation_feedback;
create policy machine_translation_feedback_moderators_read on public.machine_translation_feedback
  for select using (public.is_moderator(auth.uid()));

commit;
