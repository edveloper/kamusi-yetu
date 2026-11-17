-- 118_entry_model.sql
--
-- Phase 3: an entry that can hold everything a speaker knows about a word,
-- and a record of who changed what.
--
-- HOW TO RUN
--   Run the whole file as it is first. It is a DRY RUN: it makes every change,
--   then raises an error whose message is the summary, which undoes all of it.
--   To apply, change  dry_run boolean := true  to  false  (search for
--   DRY_RUN_SWITCH) and run it again.
--
-- WHAT IT DOES
--   1. Entries gain the fields the single entry form needs: a literal meaning,
--      a usage note, the expected reply (for greetings and other phrases), a
--      source link, a licence, and updated_by so every change has an author.
--   2. entry_senses: further meanings of the same headword. The first meaning
--      stays on the entry itself (primary_definition and the two bridge
--      glosses), because search, translation and the sitemap all read it there.
--   3. Usage examples gain a licence and can point at a particular meaning.
--      Only reviewed examples are public now; pending ones were showing on
--      entry pages. No more than 10 may wait for review on one entry.
--   4. Recordings: one live recording per speaker per entry, and at most 10
--      approved recordings per entry.
--   5. entry_revisions: every change to an entry, field by field, with who made
--      it. Moderators can read it; it is the audit trail behind "reviewed".
--   6. The 9 seeded "examples" that are really notes about usage move into the
--      new usage_note field, where they belong.

begin;

-- ---------------------------------------------------------------------------
-- 1) entries: the extra fields
-- ---------------------------------------------------------------------------
alter table public.entries add column if not exists literal_meaning text;
alter table public.entries add column if not exists usage_note text;
alter table public.entries add column if not exists response_text text;
alter table public.entries add column if not exists source_url text;
alter table public.entries add column if not exists licence text not null default 'CC-BY-4.0';
alter table public.entries add column if not exists updated_by uuid references auth.users(id) on delete set null;

comment on column public.entries.literal_meaning is 'Word-for-word meaning of a phrase, e.g. "you have woken?" for a morning greeting.';
comment on column public.entries.usage_note is 'When, where and to whom it is said, and anything a learner would get wrong.';
comment on column public.entries.response_text is 'The usual reply, for greetings and other phrases that expect one.';
comment on column public.entries.pronunciation is 'Plain-letter respelling of how it sounds, for readers who do not use IPA.';

-- The 116 guard, extended: browser sessions always stamp themselves as the
-- author of a change, and contributions are always CC BY.
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
      new.source_type := 'community';
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


-- ---------------------------------------------------------------------------
-- 2) entry_senses
-- ---------------------------------------------------------------------------
create table if not exists public.entry_senses (
  id                  uuid primary key default gen_random_uuid(),
  entry_id            uuid not null references public.entries(id) on delete cascade,
  position            smallint not null check (position >= 2),
  definition          text,
  english_translation text,
  swahili_translation text,
  part_of_speech      text,
  usage_note          text,
  concept_id          uuid references public.concepts(id) on delete set null,
  validation_status   text not null default 'pending'
                      check (validation_status in ('pending','verified','flagged','disputed')),
  created_by          uuid references auth.users(id) on delete set null,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now(),
  constraint entry_senses_position_unique unique (entry_id, position),
  constraint entry_senses_has_meaning check (
    nullif(btrim(coalesce(definition, '')), '') is not null
    or nullif(btrim(coalesce(english_translation, '')), '') is not null
    or nullif(btrim(coalesce(swahili_translation, '')), '') is not null
  )
);

comment on table public.entry_senses is
  'Second and later meanings of a headword. The first meaning lives on entries itself.';

create index if not exists idx_entry_senses_entry on public.entry_senses (entry_id, position);

create or replace function public.guard_sense_review_fields()
returns trigger
language plpgsql
as $$
begin
  if public.is_browser_session() and not public.is_moderator(auth.uid()) then
    if tg_op = 'INSERT' then
      new.validation_status := 'pending';
      new.created_by := auth.uid();
    else
      new.validation_status := old.validation_status;
      new.created_by := old.created_by;
    end if;
  end if;
  return new;
end;
$$;

drop trigger if exists trg_guard_sense_review_fields on public.entry_senses;
create trigger trg_guard_sense_review_fields
  before insert or update on public.entry_senses
  for each row execute function public.guard_sense_review_fields();

alter table public.entry_senses enable row level security;

drop policy if exists entry_senses_select on public.entry_senses;
create policy entry_senses_select on public.entry_senses
  for select to anon, authenticated
  using (
    validation_status = 'verified'
    or created_by = auth.uid()
    or public.is_moderator(auth.uid())
  );

drop policy if exists entry_senses_insert_own on public.entry_senses;
create policy entry_senses_insert_own on public.entry_senses
  for insert to authenticated
  with check (created_by = auth.uid());

drop policy if exists entry_senses_update_moderator on public.entry_senses;
create policy entry_senses_update_moderator on public.entry_senses
  for update to authenticated
  using (public.is_moderator(auth.uid()))
  with check (public.is_moderator(auth.uid()));


-- ---------------------------------------------------------------------------
-- 3) usage examples
-- ---------------------------------------------------------------------------
alter table public.entry_usage_examples add column if not exists licence text not null default 'CC-BY-4.0';
alter table public.entry_usage_examples add column if not exists sense_id uuid references public.entry_senses(id) on delete set null;

drop policy if exists entry_usage_examples_public_select on public.entry_usage_examples;
create policy entry_usage_examples_public_select on public.entry_usage_examples
  for select to anon, authenticated
  using (
    validation_status = 'verified'
    or created_by = auth.uid()
    or public.is_moderator(auth.uid())
  );

drop policy if exists entry_usage_examples_update_moderator on public.entry_usage_examples;
create policy entry_usage_examples_update_moderator on public.entry_usage_examples
  for update to authenticated
  using (public.is_moderator(auth.uid()))
  with check (public.is_moderator(auth.uid()));

-- At most 10 examples waiting on one entry. A queue that long already needs a
-- reviewer more than it needs another example.
create or replace function public.limit_pending_examples()
returns trigger
language plpgsql
as $$
begin
  if public.is_browser_session()
     and (select count(*) from public.entry_usage_examples
           where entry_id = new.entry_id and validation_status = 'pending') >= 10 then
    raise exception 'This entry already has 10 examples waiting for review. Please try again once some have been checked.';
  end if;
  return new;
end;
$$;

drop trigger if exists trg_limit_pending_examples on public.entry_usage_examples;
create trigger trg_limit_pending_examples
  before insert on public.entry_usage_examples
  for each row execute function public.limit_pending_examples();


-- ---------------------------------------------------------------------------
-- 4) recordings
-- ---------------------------------------------------------------------------
-- One live recording per speaker per entry. A rejected or withdrawn one does
-- not count, so the speaker can try again.
create unique index if not exists uq_recordings_one_live_per_speaker
  on public.recordings (entry_id, speaker_id)
  where not is_withdrawn and validation_status <> 'rejected';

create or replace function public.limit_verified_recordings()
returns trigger
language plpgsql
as $$
begin
  if new.validation_status = 'verified'
     and (tg_op = 'INSERT' or old.validation_status is distinct from 'verified')
     and (select count(*) from public.recordings
           where entry_id = new.entry_id and validation_status = 'verified'
             and not is_withdrawn and id <> new.id) >= 10 then
    raise exception 'This entry already has 10 approved recordings.';
  end if;
  return new;
end;
$$;

drop trigger if exists trg_limit_verified_recordings on public.recordings;
create trigger trg_limit_verified_recordings
  before insert or update on public.recordings
  for each row execute function public.limit_verified_recordings();


-- ---------------------------------------------------------------------------
-- 5) entry_revisions
-- ---------------------------------------------------------------------------
-- No foreign key to entries on purpose: the history of a merged or deleted
-- entry is still history.
create table if not exists public.entry_revisions (
  id         uuid primary key default gen_random_uuid(),
  entry_id   uuid not null,
  changed_by uuid,
  changed_at timestamptz not null default now(),
  action     text not null,
  changes    jsonb not null
);

create index if not exists idx_entry_revisions_entry on public.entry_revisions (entry_id, changed_at desc);

create or replace function public.record_entry_revision()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  tracked constant text[] := array[
    'headword','primary_definition','english_translation','swahili_translation',
    'part_of_speech','category','register','dialect_variant','pronunciation_ipa',
    'pronunciation','etymology','literal_meaning','usage_note','response_text',
    'source_type','source_reference','source_url','licence','validation_status',
    'needs_orthography_review','human_reviewed','review_note','archived_reason','concept_id'
  ];
  o jsonb := case when tg_op = 'UPDATE' then to_jsonb(old) else '{}'::jsonb end;
  n jsonb := to_jsonb(new);
  diff jsonb := '{}'::jsonb;
  k text;
  act text;
begin
  foreach k in array tracked loop
    if (o -> k) is distinct from (n -> k) then
      diff := diff || jsonb_build_object(k, jsonb_build_object('from', o -> k, 'to', n -> k));
    end if;
  end loop;

  if diff = '{}'::jsonb then return new; end if;

  act := case
    when tg_op = 'INSERT' then 'created'
    when diff ? 'validation_status' then 'status: ' || coalesce(new.validation_status, '')
    else 'edited'
  end;

  insert into public.entry_revisions (entry_id, changed_by, action, changes)
  values (new.id, coalesce(auth.uid(), new.updated_by), act, diff);
  return new;
end;
$$;

drop trigger if exists trg_record_entry_revision on public.entries;
create trigger trg_record_entry_revision
  after insert or update on public.entries
  for each row execute function public.record_entry_revision();

alter table public.entry_revisions enable row level security;
drop policy if exists entry_revisions_select_moderator on public.entry_revisions;
create policy entry_revisions_select_moderator on public.entry_revisions
  for select to authenticated
  using (public.is_moderator(auth.uid()));


-- ---------------------------------------------------------------------------
-- 6) data, with the dry-run switch
-- ---------------------------------------------------------------------------
do $do$
declare
  dry_run boolean := true;  -- DRY_RUN_SWITCH: set to false to apply
  n_notes int;
  n_removed int;
  n_pending_examples int;
  summary text;
begin
  -- Seeded "examples" with no author are notes about usage, not sentences.
  update public.entries e
     set usage_note = x.notes
    from (
      select entry_id, string_agg(btrim(example_text), ' ' order by created_at) as notes
        from public.entry_usage_examples
       where created_by is null
       group by entry_id
    ) x
   where e.id = x.entry_id and nullif(btrim(coalesce(e.usage_note, '')), '') is null;
  get diagnostics n_notes = row_count;

  delete from public.entry_usage_examples where created_by is null;
  get diagnostics n_removed = row_count;

  select count(*) into n_pending_examples
    from public.entry_usage_examples where validation_status = 'pending';

  summary := format(
    E'\n\nPHASE 3 ENTRY MODEL SUMMARY%s\n'
    'new entry fields: literal_meaning, usage_note, response_text, source_url, licence, updated_by\n'
    'new tables: entry_senses, entry_revisions\n'
    'seeded notes moved to usage_note: %s entries (%s rows removed from examples)\n'
    'contributor examples now waiting for review: %s\n'
    'entries: %s | senses: %s | revisions recorded during this run: %s\n\n'
    'expected: 9 notes moved, 9 rows removed, 7 examples waiting for review',
    case when dry_run then ' (DRY RUN, nothing was saved)' else '' end,
    n_notes, n_removed, n_pending_examples,
    (select count(*) from public.entries),
    (select count(*) from public.entry_senses),
    (select count(*) from public.entry_revisions)
  );

  if dry_run then
    raise exception '%', summary;
  end if;
  raise notice '%', summary;
end
$do$;

commit;
