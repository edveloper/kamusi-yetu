-- 111_voice_corpus.sql
-- Wave 4: the speech layer.
--
-- Why this is urgent rather than merely next: the corpus holds zero recordings
-- across 37 languages, and speech cannot be collected retroactively. Everything
-- else on the roadmap can be rebuilt later from data that already exists. A
-- recording that was never made is simply gone, along with the speaker.
--
-- Three things a web dictionary does not need but a speech model does:
--
--   1. MANY speakers per word, not one canonical recording. Recognition learns
--      from variation - age, gender, region, device. entries.audio_url is a
--      single text column and is structurally the wrong shape for this.
--   2. SPEAKER METADATA. Whether a model works outside Nairobi is decided by
--      who was recorded. It cannot be reconstructed afterwards.
--   3. THE PROMPT. Audio is only trainable when it is aligned to the exact text
--      the speaker was asked to say.
--
-- And one legal requirement: voice is biometric personal data. A recording
-- gathered without a consent record cannot lawfully be published or used to
-- train a model, and no later paperwork fixes it. consent_id is therefore NOT
-- NULL on recordings - it is impossible to store audio without a consent row.
--
-- DEPLOY ORDER: run this before deploying the code that reads these tables.

begin;

-- =========================================================================
-- 1) CONSENT
--    Versioned, scoped and revocable. A new consent_version means a new row,
--    never an update - what someone agreed to must remain reconstructible.
-- =========================================================================

create table if not exists public.consents (
  id              uuid primary key default gen_random_uuid(),
  user_id         uuid not null references auth.users(id) on delete cascade,

  -- Which consent text was shown, and in which language it was read.
  consent_version text not null,
  locale          text not null default 'en',

  -- Specific permissions, not a single blanket "I agree".
  allow_publication      boolean not null default false,  -- publish in the corpus
  allow_model_training   boolean not null default false,  -- ASR / TTS training
  allow_redistribution   boolean not null default false,  -- CC BY 4.0 downstream
  allow_attribution      boolean not null default false,  -- name me as speaker

  -- Recording requires an adult. Minors need guardian consent, which this
  -- schema deliberately does not attempt to model.
  confirmed_adult boolean not null default false,

  granted_at  timestamptz not null default now(),
  revoked_at  timestamptz,
  revoke_note text,

  constraint consents_meaningful
    check (allow_publication or allow_model_training or allow_redistribution),
  constraint consents_adult_required check (confirmed_adult)
);

create index if not exists idx_consents_user on public.consents (user_id, granted_at desc);

comment on table public.consents is
  'Versioned, revocable consent for voice data. Revoking sets revoked_at; it never deletes the row, because proof of what was agreed must survive.';


-- =========================================================================
-- 2) SPEAKER PROFILE
--    Separate from user_profiles: being a user and being a recorded speaker
--    are different roles, and this holds data only relevant to the second.
--    Every field is optional except the language - coverage matters, but not
--    at the price of making people uncomfortable enough to leave.
-- =========================================================================

create table if not exists public.speaker_profiles (
  id            uuid primary key default gen_random_uuid(),
  user_id       uuid not null unique references auth.users(id) on delete cascade,

  first_language_id uuid references public.languages(id),
  also_speaks       uuid[] not null default '{}',

  -- County code, matching lib/constants/languageCountyPresence.ts.
  -- Where the speaker learned the language, which is more useful for dialect
  -- coverage than where they live now.
  home_county   text,
  current_county text,

  age_band      text check (age_band in ('18_24','25_34','35_49','50_64','65_plus')),
  gender        text check (gender in ('female','male','other','prefer_not_to_say')),

  speaker_type  text not null default 'native'
                check (speaker_type in ('native','heritage','learner')),

  notes         text,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now()
);

create index if not exists idx_speaker_profiles_language
  on public.speaker_profiles (first_language_id);

comment on column public.speaker_profiles.home_county is
  'Where the speaker acquired the language. Better dialect signal than residence.';


-- =========================================================================
-- 3) RECORDINGS
--    Many per entry. The unit of the speech corpus.
-- =========================================================================

create table if not exists public.recordings (
  id          uuid primary key default gen_random_uuid(),
  entry_id    uuid not null references public.entries(id) on delete cascade,
  speaker_id  uuid not null references public.speaker_profiles(id) on delete cascade,

  -- No audio without consent. Restrict, not cascade: deleting a consent row
  -- must fail while recordings still depend on it, so withdrawal goes through
  -- the documented path rather than silently dropping evidence.
  consent_id  uuid not null references public.consents(id) on delete restrict,

  storage_path text not null unique,
  mime_type    text not null,
  byte_size    integer,

  -- Technical fields a training pipeline needs and cannot infer later.
  duration_ms     integer check (duration_ms is null or duration_ms > 0),
  sample_rate_hz  integer,
  channels        smallint,

  -- The exact text the speaker was asked to say. Without this the audio is
  -- not alignable and is close to worthless for training.
  prompt_text  text not null,
  prompt_kind  text not null default 'headword'
               check (prompt_kind in ('headword','usage_example','phrase','free')),

  capture_method text not null default 'browser_recorder'
                 check (capture_method in ('browser_recorder','upload','field_session')),
  device_hint    text,

  validation_status text not null default 'pending'
                    check (validation_status in ('pending','verified','rejected')),
  reviewed_by  uuid references auth.users(id) on delete set null,
  reviewed_at  timestamptz,
  reject_reason text,

  -- Withdrawal is a state, not a delete: the row must survive long enough for
  -- the audio file itself to be purged from storage by the cleanup job.
  is_withdrawn boolean not null default false,
  withdrawn_at timestamptz,

  created_at timestamptz not null default now()
);

create index if not exists idx_recordings_entry
  on public.recordings (entry_id) where not is_withdrawn;
create index if not exists idx_recordings_speaker
  on public.recordings (speaker_id);
create index if not exists idx_recordings_training_set
  on public.recordings (validation_status, is_withdrawn)
  where validation_status = 'verified' and not is_withdrawn;

-- One recording per speaker per prompt per entry: variation across speakers is
-- the goal, duplicates from one speaker are not.
create unique index if not exists uq_recordings_speaker_prompt
  on public.recordings (entry_id, speaker_id, prompt_kind, md5(prompt_text))
  where not is_withdrawn;

comment on table public.recordings is
  'The speech corpus. Many speakers per entry by design - speaker variation is what makes recognition work.';


-- =========================================================================
-- 4) WITHDRAWAL
--    A speaker can revoke consent at any time. This marks every affected
--    recording so a storage cleanup job can purge the audio files.
-- =========================================================================

create or replace function public.withdraw_consent(p_consent_id uuid, p_note text default null)
returns integer
language plpgsql
security definer
set search_path = public
as $$
declare
  affected integer;
begin
  if not exists (
    select 1 from public.consents c
     where c.id = p_consent_id and c.user_id = auth.uid()
  ) then
    raise exception 'Consent record not found for the current user.';
  end if;

  update public.consents
     set revoked_at = now(), revoke_note = p_note
   where id = p_consent_id and revoked_at is null;

  update public.recordings
     set is_withdrawn = true, withdrawn_at = now()
   where consent_id = p_consent_id and not is_withdrawn;

  get diagnostics affected = row_count;
  return affected;
end $$;

comment on function public.withdraw_consent is
  'Revokes a consent and flags its recordings. Audio files still need purging from storage by a scheduled job reading recordings where is_withdrawn.';


-- =========================================================================
-- 5) COVERAGE VIEW
--    What the roadmap actually needs to track: how much of the corpus can be
--    heard, and how many distinct voices exist per language.
-- =========================================================================

create or replace view public.language_voice_coverage as
select
  l.id   as language_id,
  l.code as language_code,
  l.name as language_name,
  count(distinct e.id) filter (
    where e.validation_status = 'verified' and not e.needs_orthography_review
  ) as public_entries,
  count(distinct r.entry_id) filter (
    where r.validation_status = 'verified' and not r.is_withdrawn
  ) as entries_with_audio,
  count(r.id) filter (
    where r.validation_status = 'verified' and not r.is_withdrawn
  ) as verified_recordings,
  count(distinct r.speaker_id) filter (
    where not r.is_withdrawn
  ) as distinct_speakers
from public.languages l
left join public.entries e   on e.language_id = l.id
left join public.recordings r on r.entry_id = e.id
where l.is_active
group by l.id, l.code, l.name;


-- =========================================================================
-- 6) ROW LEVEL SECURITY
--    Consistent with 109. Recording metadata is public so entry pages can show
--    "3 recordings"; speaker demographics are NOT.
-- =========================================================================

alter table public.consents          enable row level security;
alter table public.speaker_profiles  enable row level security;
alter table public.recordings        enable row level security;

-- Consent: yours alone. Never publicly readable.
drop policy if exists consents_select_own on public.consents;
create policy consents_select_own on public.consents
  for select to authenticated using (auth.uid() = user_id);

drop policy if exists consents_insert_own on public.consents;
create policy consents_insert_own on public.consents
  for insert to authenticated with check (auth.uid() = user_id);

-- Speaker profile: yours to read and write. Demographics stay private; the
-- aggregate view is how coverage gets reported.
drop policy if exists speaker_profiles_select_own on public.speaker_profiles;
create policy speaker_profiles_select_own on public.speaker_profiles
  for select to authenticated using (auth.uid() = user_id);

drop policy if exists speaker_profiles_insert_own on public.speaker_profiles;
create policy speaker_profiles_insert_own on public.speaker_profiles
  for insert to authenticated with check (auth.uid() = user_id);

drop policy if exists speaker_profiles_update_own on public.speaker_profiles;
create policy speaker_profiles_update_own on public.speaker_profiles
  for update to authenticated
  using (auth.uid() = user_id) with check (auth.uid() = user_id);

drop policy if exists speaker_profiles_select_moderator on public.speaker_profiles;
create policy speaker_profiles_select_moderator on public.speaker_profiles
  for select to authenticated
  using (exists (
    select 1 from public.user_profiles p
     where p.id = auth.uid()
       and lower(coalesce(p.role,'')) in ('moderator','admin','guardian')
  ));

-- Recordings: verified, non-withdrawn ones are public so anyone can listen.
drop policy if exists recordings_select_public on public.recordings;
create policy recordings_select_public on public.recordings
  for select to anon, authenticated
  using (validation_status = 'verified' and not is_withdrawn);

drop policy if exists recordings_select_own on public.recordings;
create policy recordings_select_own on public.recordings
  for select to authenticated
  using (exists (
    select 1 from public.speaker_profiles s
     where s.id = recordings.speaker_id and s.user_id = auth.uid()
  ));

drop policy if exists recordings_insert_own on public.recordings;
create policy recordings_insert_own on public.recordings
  for insert to authenticated
  with check (
    exists (select 1 from public.speaker_profiles s
              where s.id = speaker_id and s.user_id = auth.uid())
    and exists (select 1 from public.consents c
                 where c.id = consent_id
                   and c.user_id = auth.uid()
                   and c.revoked_at is null
                   and c.allow_publication)
  );

drop policy if exists recordings_select_moderator on public.recordings;
create policy recordings_select_moderator on public.recordings
  for select to authenticated
  using (exists (
    select 1 from public.user_profiles p
     where p.id = auth.uid()
       and lower(coalesce(p.role,'')) in ('moderator','admin','guardian')
  ));

commit;


-- =========================================================================
-- 7) STORAGE - do this in the dashboard, it is not SQL
-- =========================================================================
--
-- Create a PRIVATE bucket named `recordings`. Do not reuse the public
-- `entry-audio` bucket: a public bucket means a withdrawn recording stays
-- reachable by URL after withdrawal, which defeats the consent model.
--
-- Serve audio through short-lived signed URLs, generated only for recordings
-- that are verified and not withdrawn.
--
-- Suggested object path:  {language_code}/{entry_id}/{speaker_id}-{timestamp}.webm
--
-- Storage policies: authenticated users may INSERT into their own folder;
-- SELECT stays closed and goes through signed URLs from the server.


-- =========================================================================
-- 8) WHERE THE OLD COLUMN GOES
-- =========================================================================
--
-- entries.audio_url is left in place: it still works and nothing depends on
-- removing it. It currently holds 0 rows, so there is nothing to migrate. Treat
-- it as deprecated and read from recordings going forward.
--
-- Coverage check:
--   select * from public.language_voice_coverage order by public_entries desc;
