-- 120_recordings_storage_and_elicited.sql
--
-- 1. Recordings could not be uploaded. The 'recordings' storage bucket is
--    private (correct: audio is served through short-lived signed links), but
--    it had no rule letting anyone put a file in it, so every upload failed
--    with "new row violates row-level security policy".
--
--    A signed-in speaker may now upload, and delete, only their own files, and
--    only while they hold an active consent that allows publication. The
--    uploader names each file  <language>/<entry>/<speaker profile id>-<time>.<ext>
--    (lib/api/recordings.ts), so ownership is checked on the file name.
--    Nobody reads the bucket directly: playback links are signed on the server.
--
-- 2. Words added from the gaps queue are elicited, not volunteered, and say
--    so. The 116/118 guard overwrote every contributor's source_type with
--    'community'; it now keeps 'elicited' and forces everything else.
--
-- Safe to run more than once.

begin;

-- ---------------------------------------------------------------------------
-- 1) storage rules for the recordings bucket
-- ---------------------------------------------------------------------------
create or replace function public.owns_recording_file(object_name text)
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1 from public.speaker_profiles s
     where s.user_id = auth.uid()
       and storage.filename(object_name) like s.id::text || '-%'
  );
$$;

drop policy if exists recordings_upload_own on storage.objects;
create policy recordings_upload_own on storage.objects
  for insert to authenticated
  with check (
    bucket_id = 'recordings'
    and public.owns_recording_file(name)
    and exists (
      select 1 from public.consents c
       where c.user_id = auth.uid()
         and c.revoked_at is null
         and c.allow_publication
    )
  );

-- Lets the uploader tidy up its own file if saving the database row fails.
drop policy if exists recordings_delete_own on storage.objects;
create policy recordings_delete_own on storage.objects
  for delete to authenticated
  using (bucket_id = 'recordings' and public.owns_recording_file(name));

-- Twelve megabytes, matching MAX_RECORDING_BYTES in lib/api/recordings.ts.
update storage.buckets set file_size_limit = 12582912 where id = 'recordings';


-- ---------------------------------------------------------------------------
-- 2) keep 'elicited' on entries from the gaps queue
-- ---------------------------------------------------------------------------
create or replace function public.guard_entry_review_fields()
returns trigger
language plpgsql
as $$
begin
  if public.is_browser_session() then
    new.updated_by := auth.uid();
  end if;

  if public.is_browser_session() and not public.is_moderator(auth.uid()) then
    if tg_op = 'INSERT' then
      new.validation_status := 'pending';
      new.trust_score := 0;
      new.created_by := auth.uid();
      new.reviewed_by := null;
      new.reviewed_at := null;
      new.review_note := null;
      new.source_type := case when new.source_type = 'elicited' then 'elicited' else 'community' end;
      new.licence := 'CC-BY-4.0';
      new.human_reviewed := false;
    else
      new.validation_status := old.validation_status;
      new.trust_score := old.trust_score;
      new.created_by := old.created_by;
      new.reviewed_by := old.reviewed_by;
      new.reviewed_at := old.reviewed_at;
      new.review_note := old.review_note;
      new.source_type := old.source_type;
      new.needs_orthography_review := old.needs_orthography_review;
      new.licence := old.licence;
      new.human_reviewed := old.human_reviewed;
    end if;
  end if;
  return new;
end;
$$;

commit;

-- Check afterwards (expect two rows):
--   select policyname from pg_policies
--    where schemaname = 'storage' and tablename = 'objects' and policyname like 'recordings_%';
