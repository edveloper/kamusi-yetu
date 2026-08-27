-- 109_enable_rls_lockdown.sql
-- Purpose: enable row level security on the 10+ public tables currently running
--          without it, and add policies that match exactly what the app does today.
--
-- Context: verified 2026-08-20 by anonymous reads against production with the
--          public anon key. Every table below returned rows while having no
--          entry in pg_policies, which means RLS is disabled and the table is
--          readable AND writable by anyone holding the anon key (it ships in the
--          JavaScript bundle).
--
-- IMPORTANT: the service_role key bypasses RLS entirely, so every server route
--            (app/api/**) keeps working unchanged. Only the browser client
--            (lib/supabase.ts, anon key) is constrained by these policies.
--
-- Run order: safe to run once, top to bottom. Verify with the query at the end.

begin;

-- =========================================================================
-- 1) SERVER-ONLY TABLES
--    No browser code path touches these; they are read and written only by
--    app/api/** using the service role. Enabling RLS with zero policies
--    denies all anon/authenticated access while leaving the API untouched.
-- =========================================================================

alter table public.bridge_lexicon         enable row level security;
alter table public.bulk_edit_jobs         enable row level security;
alter table public.bulk_edit_job_items    enable row level security;
alter table public.bulk_import_job_items  enable row level security;
alter table public.entry_import_staging   enable row level security;
alter table public.entry_translations     enable row level security;
alter table public.translation_feedback   enable row level security;

-- NOTE: app/api/translate/route.ts falls back to the ANON key when
-- SUPABASE_SERVICE_ROLE_KEY is unset. After this migration that fallback would
-- silently return zero bridge_lexicon rows instead of erroring. Confirm the
-- service role key is set in the Vercel environment before deploying.


-- =========================================================================
-- 2) PUBLIC REFERENCE DATA
--    languages is read by the browser on nearly every page
--    (lib/api/languages.ts, lib/public-site.ts, lib/api/entries.ts).
--    Read stays open; writes become service-role only.
-- =========================================================================

alter table public.languages enable row level security;

drop policy if exists languages_public_select on public.languages;
create policy languages_public_select
  on public.languages for select
  to anon, authenticated
  using (true);


-- =========================================================================
-- 3) USAGE EXAMPLES
--    Browser reads them in getEntry() and aggregates entry_id on /trending.
--    Writes happen only in app/api/moderation/** via the service role.
-- =========================================================================

alter table public.entry_usage_examples enable row level security;

drop policy if exists entry_usage_examples_public_select on public.entry_usage_examples;
create policy entry_usage_examples_public_select
  on public.entry_usage_examples for select
  to anon, authenticated
  using (true);

-- Tighter alternative, once you are ready to hide unreviewed examples from the
-- public entry page. getEntry() will simply render fewer examples:
--   using (validation_status = 'verified')


-- =========================================================================
-- 4) USER-GENERATED CONTENT
--    Reads stay public because /trending aggregates counts anonymously
--    (app/trending/page.tsx reads entry_likes.entry_id and saved_words.entry_id
--    with no session). Writes are locked to the row's owner, which is the
--    vector that actually matters: today anyone can insert, edit or delete
--    any comment, like or saved word belonging to anyone.
-- =========================================================================

-- --- entry_likes: toggleLike() inserts and deletes own rows ---------------
alter table public.entry_likes enable row level security;

drop policy if exists entry_likes_public_select on public.entry_likes;
create policy entry_likes_public_select
  on public.entry_likes for select
  to anon, authenticated
  using (true);

drop policy if exists entry_likes_insert_own on public.entry_likes;
create policy entry_likes_insert_own
  on public.entry_likes for insert
  to authenticated
  with check (auth.uid() = user_id);

drop policy if exists entry_likes_delete_own on public.entry_likes;
create policy entry_likes_delete_own
  on public.entry_likes for delete
  to authenticated
  using (auth.uid() = user_id);


-- --- saved_words: toggleSaveWord() / getSavedWords() ----------------------
alter table public.saved_words enable row level security;

drop policy if exists saved_words_public_select on public.saved_words;
create policy saved_words_public_select
  on public.saved_words for select
  to anon, authenticated
  using (true);

-- PRIVACY FOLLOW-UP: the policy above lets anyone see which words a named
-- account saved. To close that, swap it for the owner-only policy below and
-- move /trending's save counts onto an aggregate view (see section 7):
--   create policy saved_words_select_own on public.saved_words for select
--     to authenticated using (auth.uid() = user_id);

drop policy if exists saved_words_insert_own on public.saved_words;
create policy saved_words_insert_own
  on public.saved_words for insert
  to authenticated
  with check (auth.uid() = user_id);

drop policy if exists saved_words_delete_own on public.saved_words;
create policy saved_words_delete_own
  on public.saved_words for delete
  to authenticated
  using (auth.uid() = user_id);


-- --- entry_comments: addComment / updateComment / deleteComment -----------
alter table public.entry_comments enable row level security;

drop policy if exists entry_comments_public_select on public.entry_comments;
create policy entry_comments_public_select
  on public.entry_comments for select
  to anon, authenticated
  using (true);

drop policy if exists entry_comments_insert_own on public.entry_comments;
create policy entry_comments_insert_own
  on public.entry_comments for insert
  to authenticated
  with check (auth.uid() = user_id);

drop policy if exists entry_comments_update_own on public.entry_comments;
create policy entry_comments_update_own
  on public.entry_comments for update
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

drop policy if exists entry_comments_delete_own on public.entry_comments;
create policy entry_comments_delete_own
  on public.entry_comments for delete
  to authenticated
  using (auth.uid() = user_id);

-- Moderators can remove any comment.
drop policy if exists entry_comments_delete_moderator on public.entry_comments;
create policy entry_comments_delete_moderator
  on public.entry_comments for delete
  to authenticated
  using (
    exists (
      select 1 from public.user_profiles p
      where p.id = auth.uid()
        and lower(coalesce(p.role, '')) in ('moderator', 'admin', 'guardian')
    )
  );


-- --- comment_votes: toggleCommentVote() ----------------------------------
alter table public.comment_votes enable row level security;

drop policy if exists comment_votes_public_select on public.comment_votes;
create policy comment_votes_public_select
  on public.comment_votes for select
  to anon, authenticated
  using (true);

drop policy if exists comment_votes_insert_own on public.comment_votes;
create policy comment_votes_insert_own
  on public.comment_votes for insert
  to authenticated
  with check (auth.uid() = user_id);

drop policy if exists comment_votes_update_own on public.comment_votes;
create policy comment_votes_update_own
  on public.comment_votes for update
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

drop policy if exists comment_votes_delete_own on public.comment_votes;
create policy comment_votes_delete_own
  on public.comment_votes for delete
  to authenticated
  using (auth.uid() = user_id);


-- =========================================================================
-- 5) REPORTS
--    reportEntry() inserts from the browser with reported_by = the user.
--    Nothing in the browser reads them back, so reads go to moderators only.
-- =========================================================================

alter table public.reports enable row level security;

drop policy if exists reports_insert_own on public.reports;
create policy reports_insert_own
  on public.reports for insert
  to authenticated
  with check (auth.uid() = reported_by);

drop policy if exists reports_select_moderator on public.reports;
create policy reports_select_moderator
  on public.reports for select
  to authenticated
  using (
    exists (
      select 1 from public.user_profiles p
      where p.id = auth.uid()
        and lower(coalesce(p.role, '')) in ('moderator', 'admin', 'guardian')
    )
  );


commit;


-- =========================================================================
-- 6) VERIFY
--    Every row should now read rowsecurity = true. Anything still false is
--    a table this migration did not cover.
-- =========================================================================

-- select tablename, rowsecurity
--   from pg_tables
--  where schemaname = 'public'
--  order by rowsecurity, tablename;


-- =========================================================================
-- 7) NOT DONE HERE — needs a decision from you
-- =========================================================================
--
-- a) entry_suggestions is RLS-enabled but its only SELECT policy,
--    moderator_select_entry_suggestions, still returned rows to an anonymous
--    client during testing. Its USING clause is more permissive than its name.
--    Inspect it before changing anything:
--
--      select policyname, cmd, qual, with_check
--        from pg_policies
--       where schemaname = 'public' and tablename = 'entry_suggestions';
--
-- b) Duplicate policy pairs exist on user_profiles, entries and validations
--    ("Users can view own X" alongside "Users can view their own X").
--    Policies OR together, so an older permissive twin can silently defeat a
--    newer, tighter one. Compare quals, then drop the redundant half.
--
-- c) user_profiles has "Anyone can view profiles", which publishes every
--    account's role and lets anyone enumerate your moderators. Consider
--    splitting the public-facing columns into a view and restricting the base
--    table, or dropping role from what anon can select.
--
-- d) No table has a DELETE policy for ordinary users on entries or
--    user_profiles. That is intentional and correct — leave it that way.
--
-- e) If you adopt the owner-only saved_words policy from section 4, add an
--    aggregate source for /trending so save counts still render for logged-out
--    visitors, e.g. a view exposing only (entry_id, save_count), then point
--    app/trending/page.tsx at it instead of reading saved_words directly.
