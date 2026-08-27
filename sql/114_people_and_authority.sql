-- 114_people_and_authority.sql
-- Wave 6: who may speak for a language, and what "verified" actually means.
--
-- TWO PROBLEMS THIS SOLVES
--
-- 1. Authority is global. user_profiles.role makes someone a moderator over all
--    37 languages at once. A Luo linguistics professor has no standing to
--    approve Kipsigis and will be uncomfortable being handed it; a Kipsigis
--    grandmother with no degree is the highest authority on Kipsigis and the
--    schema has no way to say so. Credentials and permissions are also
--    conflated - what you ARE and what you MAY DO are different things.
--
-- 2. trust_score measures tidiness, not truth. Today an entry gains 10 points
--    for having an IPA field filled in. Nothing records who vouched for the
--    word, in what capacity, or whether anyone disagreed.
--
-- Also implements the bridge-language decision: English is infrastructure, not
-- lexicon, and should stop being counted and measured as though it were a
-- Kenyan language needing coverage.
--
-- DEPLOY ORDER: run before deploying the code that reads these tables.

begin;

-- =========================================================================
-- 1) BRIDGE VS INDIGENOUS
--    English does the bridging work and stays fully searchable, but it is not
--    part of what this project is preserving and must not inflate the counts.
--    Kiswahili is genuinely both: a Kenyan national language AND the bridge.
-- =========================================================================

alter table public.languages
  add column if not exists role text not null default 'indigenous';

do $$
begin
  if not exists (
    select 1 from pg_constraint
     where conrelid = 'public.languages'::regclass and conname = 'languages_role_check'
  ) then
    alter table public.languages
      add constraint languages_role_check check (role in ('indigenous','bridge','both'));
  end if;
end $$;

update public.languages set role = 'bridge' where lower(code) = 'en';
update public.languages set role = 'both'   where lower(code) = 'sw';

create index if not exists idx_languages_role on public.languages (role) where is_active;

-- English entries never linked to a concept, because the concept key is built
-- from english_translation and an English entry's headword IS the English.
-- Link them through the headword so English can act as the hub it should be.
update public.entries e
   set concept_id = c.id
  from public.concepts c, public.languages l
 where e.language_id = l.id
   and lower(l.code) = 'en'
   and e.concept_id is null
   and c.concept_key = public.lk_concept_key(e.headword);


-- =========================================================================
-- 2) CREDENTIALS - what someone IS
--    Claimed by the person, then verified by a moderator. A claim is not a
--    credential until someone has checked it.
-- =========================================================================

create table if not exists public.user_credentials (
  id      uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,

  kind text not null check (kind in
    ('native_speaker','heritage_speaker','student','linguist','institution')),

  -- Speaker credentials are language-specific; academic ones may not be.
  language_id uuid references public.languages(id) on delete cascade,

  affiliation  text,
  evidence_url text,
  statement    text,

  status text not null default 'claimed'
         check (status in ('claimed','verified','rejected')),
  verified_by uuid references auth.users(id) on delete set null,
  verified_at timestamptz,
  review_note text,

  created_at timestamptz not null default now(),

  constraint credentials_speaker_needs_language
    check (kind not in ('native_speaker','heritage_speaker') or language_id is not null)
);

create unique index if not exists uq_user_credentials
  on public.user_credentials (user_id, kind, coalesce(language_id, '00000000-0000-0000-0000-000000000000'::uuid));

create index if not exists idx_user_credentials_verified
  on public.user_credentials (language_id, kind) where status = 'verified';


-- =========================================================================
-- 3) GRANTS - what someone MAY DO, per language
-- =========================================================================

create table if not exists public.language_grants (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid not null references auth.users(id) on delete cascade,
  language_id uuid not null references public.languages(id) on delete cascade,

  grant_level text not null check (grant_level in ('contribute','review','approve')),

  granted_by uuid references auth.users(id) on delete set null,
  granted_at timestamptz not null default now(),
  revoked_at timestamptz,
  note       text
);

create unique index if not exists uq_language_grants_active
  on public.language_grants (user_id, language_id, grant_level)
  where revoked_at is null;

create index if not exists idx_language_grants_language
  on public.language_grants (language_id, grant_level) where revoked_at is null;

create or replace function public.has_language_grant(
  p_user uuid, p_language uuid, p_level text
) returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select
    -- Global admins keep blanket authority; moderators no longer do.
    exists (select 1 from public.user_profiles p
             where p.id = p_user and lower(coalesce(p.role,'')) = 'admin')
    or exists (
      select 1 from public.language_grants g
       where g.user_id = p_user
         and g.language_id = p_language
         and g.revoked_at is null
         and (g.grant_level = p_level
              or (p_level = 'contribute' and g.grant_level in ('review','approve'))
              or (p_level = 'review'     and g.grant_level = 'approve'))
    );
$$;

-- Seed grants from the existing flat roles so nobody loses access today. This
-- is a migration convenience, not the long-term model: grants should be issued
-- per language from here on.
insert into public.language_grants (user_id, language_id, grant_level, note)
select p.id, l.id, 'approve', 'Migrated from the global role column in 114.'
  from public.user_profiles p
 cross join public.languages l
 where lower(coalesce(p.role,'')) in ('moderator','admin','guardian')
   and l.is_active
on conflict do nothing;


-- =========================================================================
-- 4) ATTESTATIONS - who vouched for THIS entry, in what capacity
--    This is what trust_score should have been measuring all along.
-- =========================================================================

create table if not exists public.attestations (
  id       uuid primary key default gen_random_uuid(),
  entry_id uuid not null references public.entries(id) on delete cascade,
  user_id  uuid not null references auth.users(id) on delete cascade,

  -- Snapshot of the capacity at the time. A credential verified later must not
  -- silently rewrite the weight of an attestation already given.
  credential_kind text not null,

  verdict text not null check (verdict in ('affirm','dispute')),
  note    text,

  created_at timestamptz not null default now(),

  -- One voice per person per entry.
  constraint uq_attestation_per_user unique (entry_id, user_id)
);

create index if not exists idx_attestations_entry on public.attestations (entry_id, verdict);

-- Nobody attests their own entry. Self-approval was possible before and this
-- makes it structurally impossible rather than a special case in the route.
create or replace function public.attestation_not_self()
returns trigger
language plpgsql
as $$
begin
  if exists (
    select 1 from public.entries e
     where e.id = new.entry_id and e.created_by = new.user_id
  ) then
    raise exception 'You cannot vouch for an entry you contributed yourself.';
  end if;
  return new;
end $$;

drop trigger if exists trg_attestation_not_self on public.attestations;
create trigger trg_attestation_not_self
  before insert or update on public.attestations
  for each row execute function public.attestation_not_self();


-- =========================================================================
-- 5) TRUST SCORE FROM EVIDENCE
--    Replaces metadata completeness with corroboration. An entry affirmed by a
--    native speaker AND a linguist is strong; one with every optional field
--    filled and nobody vouching for it is not.
-- =========================================================================

create or replace function public.entry_trust_score(p_entry uuid)
returns integer
language sql
stable
security definer
set search_path = public
as $$
  with e as (select * from public.entries where id = p_entry),
  weights as (
    select
      sum(case a.credential_kind
            when 'native_speaker'   then 30
            when 'linguist'         then 25
            when 'heritage_speaker' then 15
            when 'student'          then 10
            when 'institution'      then 20
            else 5
          end) filter (where a.verdict = 'affirm') as affirm_weight,
      count(*) filter (where a.verdict = 'affirm')  as affirm_count,
      count(*) filter (where a.verdict = 'dispute') as dispute_count
    from public.attestations a where a.entry_id = p_entry
  ),
  audio as (
    select count(*) as verified_recordings
      from public.recordings r
     where r.entry_id = p_entry
       and r.validation_status = 'verified' and not r.is_withdrawn
  )
  select greatest(0, least(100,
      case (select validation_status from e)
        when 'verified' then 40
        when 'pending'  then 10
        when 'flagged'  then 5
        when 'seeded'   then 0
        else 0
      end
    + coalesce((select affirm_weight from weights), 0)
    -- A recording is evidence a human said the word out loud.
    + least(15, 8 * (select verified_recordings from audio))
    -- Provenance and usage context, worth something but far less than a voucher.
    + case when (select source_type from e) in ('expert_review','published_source') then 10 else 0 end
    + case when exists (select 1 from public.entry_usage_examples x where x.entry_id = p_entry) then 5 else 0 end
    - 25 * coalesce((select dispute_count from weights), 0)
  ))::integer;
$$;

-- Does this entry meet the bar for publication?
-- Two affirmations from different people, at least one from someone verified as
-- a speaker of that language.
create or replace function public.entry_meets_verification_bar(p_entry uuid)
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select
    (select count(*) from public.attestations a
      where a.entry_id = p_entry and a.verdict = 'affirm') >= 2
    and exists (
      select 1
        from public.attestations a
        join public.entries e on e.id = a.entry_id
        join public.user_credentials c
          on c.user_id = a.user_id
         and c.language_id = e.language_id
         and c.status = 'verified'
         and c.kind in ('native_speaker','heritage_speaker')
       where a.entry_id = p_entry and a.verdict = 'affirm'
    )
    and not exists (
      select 1 from public.attestations a
       where a.entry_id = p_entry and a.verdict = 'dispute'
    );
$$;


-- =========================================================================
-- 6) REJECTION THAT REACHES THE CONTRIBUTOR
--    reject_entry set status to 'disputed', captured no reason and notified
--    nobody. The contributor's word silently stopped existing from their point
--    of view - the highest-leverage gap in the whole contribution model.
-- =========================================================================

alter table public.entries
  add column if not exists review_note text,
  add column if not exists reviewed_by uuid references auth.users(id) on delete set null,
  add column if not exists reviewed_at timestamptz;

create table if not exists public.contributor_notices (
  id       uuid primary key default gen_random_uuid(),
  user_id  uuid not null references auth.users(id) on delete cascade,
  entry_id uuid references public.entries(id) on delete cascade,

  kind text not null check (kind in ('approved','needs_changes','rejected','recording_approved','recording_rejected')),
  message text not null,

  read_at    timestamptz,
  created_at timestamptz not null default now()
);

create index if not exists idx_contributor_notices_unread
  on public.contributor_notices (user_id, created_at desc) where read_at is null;


-- =========================================================================
-- 7) VIEWS: stop measuring English as if it needed coverage
-- =========================================================================

create or replace view public.language_concept_coverage as
select
  l.id   as language_id,
  l.code as language_code,
  l.name as language_name,
  l.role as language_role,
  (select count(*) from public.concepts) as concepts_total,
  count(distinct e.concept_id) filter (
    where e.validation_status = 'verified' and not e.needs_orthography_review
  ) as concepts_covered,
  round(
    100.0 * count(distinct e.concept_id) filter (
      where e.validation_status = 'verified' and not e.needs_orthography_review
    ) / nullif((select count(*) from public.concepts), 0), 1
  ) as percent_covered
from public.languages l
left join public.entries e on e.language_id = l.id and e.concept_id is not null
where l.is_active
  and l.role <> 'bridge'   -- English is infrastructure, not a coverage target
group by l.id, l.code, l.name, l.role;

create or replace view public.concept_gaps as
select
  l.id   as language_id,
  l.code as language_code,
  l.name as language_name,
  c.id   as concept_id,
  c.concept_key,
  c.gloss_en,
  c.gloss_sw,
  c.domain,
  c.priority_rank
from public.languages l
cross join public.concepts c
where l.is_active
  and l.role <> 'bridge'
  and not exists (
    select 1 from public.entries e
     where e.language_id = l.id
       and e.concept_id  = c.id
       and e.validation_status in ('verified','pending')
       and not e.needs_orthography_review
  );

-- The honest headline numbers, in one place.
create or replace view public.corpus_headline as
select
  count(*) filter (
    where e.validation_status = 'verified' and not e.needs_orthography_review
      and l.role <> 'bridge'
  ) as indigenous_entries,
  count(*) filter (
    where e.validation_status = 'verified' and not e.needs_orthography_review
  ) as public_entries_including_bridge,
  count(distinct e.language_id) filter (where l.role <> 'bridge') as languages,
  count(*) filter (where e.validation_status = 'seeded')          as awaiting_curation,
  count(*) filter (where e.needs_orthography_review)              as awaiting_orthography
from public.entries e
join public.languages l on l.id = e.language_id;


-- =========================================================================
-- 8) ROW LEVEL SECURITY
-- =========================================================================

alter table public.user_credentials     enable row level security;
alter table public.language_grants      enable row level security;
alter table public.attestations         enable row level security;
alter table public.contributor_notices  enable row level security;

-- Credentials: verified ones are public (they are what makes an entry
-- trustworthy, so they must be inspectable). Claims stay private until checked.
drop policy if exists user_credentials_select_verified on public.user_credentials;
create policy user_credentials_select_verified on public.user_credentials
  for select to anon, authenticated using (status = 'verified');

drop policy if exists user_credentials_select_own on public.user_credentials;
create policy user_credentials_select_own on public.user_credentials
  for select to authenticated using (auth.uid() = user_id);

drop policy if exists user_credentials_insert_own on public.user_credentials;
create policy user_credentials_insert_own on public.user_credentials
  for insert to authenticated
  with check (auth.uid() = user_id and status = 'claimed');

-- Grants are public: who may approve what should be visible.
drop policy if exists language_grants_select_public on public.language_grants;
create policy language_grants_select_public on public.language_grants
  for select to anon, authenticated using (revoked_at is null);

-- Attestations are public - they are the evidence behind a trust score.
drop policy if exists attestations_select_public on public.attestations;
create policy attestations_select_public on public.attestations
  for select to anon, authenticated using (true);

drop policy if exists attestations_insert_granted on public.attestations;
create policy attestations_insert_granted on public.attestations
  for insert to authenticated
  with check (
    auth.uid() = user_id
    and exists (
      select 1 from public.entries e
       where e.id = entry_id
         and public.has_language_grant(auth.uid(), e.language_id, 'review')
    )
  );

drop policy if exists contributor_notices_select_own on public.contributor_notices;
create policy contributor_notices_select_own on public.contributor_notices
  for select to authenticated using (auth.uid() = user_id);

drop policy if exists contributor_notices_update_own on public.contributor_notices;
create policy contributor_notices_update_own on public.contributor_notices
  for update to authenticated
  using (auth.uid() = user_id) with check (auth.uid() = user_id);

commit;


-- =========================================================================
-- 9) CHECK
-- =========================================================================
-- select * from public.corpus_headline;
-- select language_name, concepts_covered, percent_covered
--   from public.language_concept_coverage order by percent_covered desc limit 10;
-- select code, name, role from public.languages where role <> 'indigenous';
