-- 116_lock_down_roles_and_review_status.sql
--
-- Closes the holes found in the November 2026 audit, confirmed against the
-- live pg_policies output:
--
--   1. user_profiles: "Users can update own profile" checks only the row id,
--      so any signed-in user could set their own role to 'admin' and with it
--      gain approval rights over every language. The insert policies had the
--      same gap at sign-up.
--   2. entries: insert and own-pending-update policies check only created_by,
--      so a contributor could submit an entry already marked 'verified', or
--      flip their own pending entry to 'verified'.
--   3. entry_suggestions: an anonymous visitor could read every suggestion,
--      which means row level security is not enabled on the table at all.
--   4. recordings: the insert policy never constrained validation_status, so
--      a recording could arrive already approved.
--   5. entry_usage_examples: no insert policy existed, so examples typed on
--      the contribute page were silently dropped (16 examples in the corpus).
--   6. saved_words: readable by anyone. Nothing in the app needs that now.
--
-- Approach: rather than column grants (which would break the app's
-- select('*') calls), BEFORE triggers reset privileged columns whenever the
-- write comes from an ordinary browser session (the anon or authenticated
-- database roles). The moderation API uses the service role, and security
-- definer functions run as their owner, so both pass through untouched.
--
-- Safe to run more than once.

begin;

-- ---------------------------------------------------------------------------
-- Helper: one definition of "moderator", used everywhere below. Earlier
-- policies disagreed (some omitted 'guardian', one omitted 'admin').
-- ---------------------------------------------------------------------------
create or replace function public.is_moderator(p_user uuid)
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1 from public.user_profiles p
     where p.id = p_user
       and lower(coalesce(p.role, '')) in ('moderator', 'admin', 'guardian')
  );
$$;

create or replace function public.is_browser_session()
returns boolean
language sql
stable
as $$
  select current_user in ('anon', 'authenticated');
$$;


-- ---------------------------------------------------------------------------
-- 1) user_profiles: nobody grants themselves a role or reputation
-- ---------------------------------------------------------------------------
create or replace function public.guard_profile_privileges()
returns trigger
language plpgsql
as $$
begin
  if public.is_browser_session() then
    if tg_op = 'INSERT' then
      new.role := 'user';
      new.reputation := 0;
    else
      new.id := old.id;
      new.role := old.role;
      new.reputation := old.reputation;
    end if;
  end if;
  return new;
end;
$$;

drop trigger if exists trg_guard_profile_privileges on public.user_profiles;
create trigger trg_guard_profile_privileges
  before insert or update on public.user_profiles
  for each row execute function public.guard_profile_privileges();

-- Duplicate policy twins. Policies OR together, so each twin only widens.
drop policy if exists "Users can insert their own profile" on public.user_profiles;
drop policy if exists "Users can update their own profile" on public.user_profiles;
drop policy if exists "Users can view all profiles"        on public.user_profiles;
drop policy if exists "Users can view own profile"         on public.user_profiles;

drop policy if exists "Users can update own profile" on public.user_profiles;
create policy "Users can update own profile" on public.user_profiles
  for update to authenticated
  using (auth.uid() = id)
  with check (auth.uid() = id);


-- ---------------------------------------------------------------------------
-- 2) entries: contributors cannot approve, score or re-attribute entries
-- ---------------------------------------------------------------------------
create or replace function public.guard_entry_review_fields()
returns trigger
language plpgsql
as $$
begin
  if public.is_browser_session() and not public.is_moderator(auth.uid()) then
    if tg_op = 'INSERT' then
      new.validation_status := 'pending';
      new.trust_score := 0;
      new.created_by := auth.uid();
      new.reviewed_by := null;
      new.reviewed_at := null;
      new.review_note := null;
      new.source_type := 'community';
    else
      new.validation_status := old.validation_status;
      new.trust_score := old.trust_score;
      new.created_by := old.created_by;
      new.reviewed_by := old.reviewed_by;
      new.reviewed_at := old.reviewed_at;
      new.review_note := old.review_note;
      new.source_type := old.source_type;
      new.needs_orthography_review := old.needs_orthography_review;
    end if;
  end if;
  return new;
end;
$$;

drop trigger if exists trg_guard_entry_review_fields on public.entries;
create trigger trg_guard_entry_review_fields
  before insert or update on public.entries
  for each row execute function public.guard_entry_review_fields();

drop policy if exists "Users can insert entries"                   on public.entries;
drop policy if exists "Users can update their own pending entries" on public.entries;
drop policy if exists "Users can view own entries"                 on public.entries;

drop policy if exists "Moderators can update all entries" on public.entries;
create policy "Moderators can update all entries" on public.entries
  for update to authenticated
  using (public.is_moderator(auth.uid()))
  with check (public.is_moderator(auth.uid()));

drop policy if exists "Moderators can view all entries" on public.entries;
create policy "Moderators can view all entries" on public.entries
  for select to authenticated
  using (public.is_moderator(auth.uid()));


-- ---------------------------------------------------------------------------
-- 3) entry_suggestions: switch row level security on, with real policies
-- ---------------------------------------------------------------------------
alter table public.entry_suggestions enable row level security;

create or replace function public.guard_suggestion_review_fields()
returns trigger
language plpgsql
as $$
begin
  if public.is_browser_session() and not public.is_moderator(auth.uid()) then
    if tg_op = 'INSERT' then
      new.suggested_by := auth.uid();
      new.status := 'pending';
      new.reviewed_by := null;
      new.reviewed_at := null;
    else
      new.suggested_by := old.suggested_by;
      new.status := old.status;
      new.reviewed_by := old.reviewed_by;
      new.reviewed_at := old.reviewed_at;
    end if;
  end if;
  return new;
end;
$$;

drop trigger if exists trg_guard_suggestion_review_fields on public.entry_suggestions;
create trigger trg_guard_suggestion_review_fields
  before insert or update on public.entry_suggestions
  for each row execute function public.guard_suggestion_review_fields();

drop policy if exists moderator_select_entry_suggestions on public.entry_suggestions;
drop policy if exists moderator_update_entry_suggestions on public.entry_suggestions;

drop policy if exists entry_suggestions_insert_own on public.entry_suggestions;
create policy entry_suggestions_insert_own on public.entry_suggestions
  for insert to authenticated
  with check (auth.uid() = suggested_by);

drop policy if exists entry_suggestions_select_own_or_moderator on public.entry_suggestions;
create policy entry_suggestions_select_own_or_moderator on public.entry_suggestions
  for select to authenticated
  using (auth.uid() = suggested_by or public.is_moderator(auth.uid()));

drop policy if exists entry_suggestions_update_moderator on public.entry_suggestions;
create policy entry_suggestions_update_moderator on public.entry_suggestions
  for update to authenticated
  using (public.is_moderator(auth.uid()))
  with check (public.is_moderator(auth.uid()));


-- ---------------------------------------------------------------------------
-- 4) recordings: always arrive pending
-- ---------------------------------------------------------------------------
create or replace function public.guard_recording_review_fields()
returns trigger
language plpgsql
as $$
begin
  if public.is_browser_session() then
    new.validation_status := 'pending';
    new.reviewed_by := null;
    new.reviewed_at := null;
    new.reject_reason := null;
    new.is_withdrawn := false;
  end if;
  return new;
end;
$$;

drop trigger if exists trg_guard_recording_review_fields on public.recordings;
create trigger trg_guard_recording_review_fields
  before insert on public.recordings
  for each row execute function public.guard_recording_review_fields();


-- ---------------------------------------------------------------------------
-- 5) entry_usage_examples: contributors can add them, always pending
-- ---------------------------------------------------------------------------
create or replace function public.guard_example_review_fields()
returns trigger
language plpgsql
as $$
begin
  if public.is_browser_session() and not public.is_moderator(auth.uid()) then
    new.validation_status := 'pending';
    new.created_by := auth.uid();
    new.reviewed_by := null;
    new.reviewed_at := null;
  end if;
  return new;
end;
$$;

drop trigger if exists trg_guard_example_review_fields on public.entry_usage_examples;
create trigger trg_guard_example_review_fields
  before insert on public.entry_usage_examples
  for each row execute function public.guard_example_review_fields();

drop policy if exists entry_usage_examples_insert_own on public.entry_usage_examples;
create policy entry_usage_examples_insert_own on public.entry_usage_examples
  for insert to authenticated
  with check (auth.uid() = created_by);


-- ---------------------------------------------------------------------------
-- 6) saved_words: private to their owner
-- ---------------------------------------------------------------------------
drop policy if exists saved_words_public_select on public.saved_words;
drop policy if exists saved_words_select_own on public.saved_words;
create policy saved_words_select_own on public.saved_words
  for select to authenticated
  using (auth.uid() = user_id);


-- ---------------------------------------------------------------------------
-- 7) Remove the test queries the audit's own probes logged as gaps
-- ---------------------------------------------------------------------------
delete from public.translation_gaps
 where hit_count = 1
   and created_at >= '2026-11-16'
   and query_text in ('x)', 'egg sandwich', 'egg', 'sandwich', 'bread');

commit;


-- ---------------------------------------------------------------------------
-- Verify after running (each should return what the comment says)
-- ---------------------------------------------------------------------------
-- RLS on for all four tables: expect rowsecurity = true on every row
--   select tablename, rowsecurity from pg_tables
--    where schemaname = 'public'
--      and tablename in ('user_profiles','entries','entry_suggestions','saved_words');
--
-- Triggers in place: expect five rows
--   select tgname from pg_trigger where tgname like 'trg_guard_%';
