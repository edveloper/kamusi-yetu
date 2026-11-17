-- 117_phase1_corpus_cleanup.sql
--
-- Phase 1 of the November 2026 corpus cleanup. Generated from a snapshot of
-- the live corpus; the list of duplicate merges near the bottom is explicit so
-- it can be reviewed row by row (see the merges report).
--
-- HOW TO RUN
--   1. Run the whole file as it is. It is a DRY RUN: it makes every change,
--      then raises an error whose message is the summary, which undoes all of
--      it. Nothing is saved. Compare the summary with the expected numbers.
--   2. To apply for real, change  dry_run boolean := true  to  false  (search
--      for DRY_RUN_SWITCH) and run the file again.
--
-- WHAT IT DOES
--   a. Adds an 'archived' status, an archived_reason column, a human_reviewed
--      flag (backfilled from real approvals) and an entry_redirects table.
--   b. Deletes the FreeDict import of 24 February 2026 (English and Kiswahili).
--      FreeDict is GPL, which is incompatible with the CC BY 4.0 corpus.
--   c. Shows only the focus languages; entries in the others are archived,
--      not deleted, and can be restored by flipping the status back.
--   d. Tidies headwords (trailing full stops, Title Case on single words,
--      sentence case on phrases), part-of-speech labels and trailing full
--      stops on glosses. Entries with damaged spellings are left alone.
--   e. Merges duplicates into the stronger entry, moving every save, like,
--      comment, example, review and recording across, and leaves a redirect
--      so the old entry address still works.
--   f. Flags entries whose headword is just their Kiswahili translation, for
--      a speaker to confirm or replace. They leave public view until then.
--   g. Recounts the headline: active languages only, plus reviewed entries.

begin;

-- ---------------------------------------------------------------------------
-- a) schema
-- ---------------------------------------------------------------------------
alter table public.entries drop constraint if exists entries_validation_status_check;
alter table public.entries add constraint entries_validation_status_check
  check (validation_status in ('pending','verified','flagged','disputed','seeded','archived'));

alter table public.entries add column if not exists archived_reason text;

-- True once a reviewer has actually approved the entry. 'verified' alone only
-- says it is public; most seed-pack entries were published without review.
alter table public.entries add column if not exists human_reviewed boolean not null default false;

create table if not exists public.entry_redirects (
  old_id     uuid primary key,
  new_id     uuid not null references public.entries(id) on delete cascade,
  reason     text not null default 'merged duplicate',
  created_at timestamptz not null default now()
);
alter table public.entry_redirects enable row level security;
drop policy if exists entry_redirects_public_select on public.entry_redirects;
create policy entry_redirects_public_select on public.entry_redirects
  for select to anon, authenticated using (true);

-- Moves everything that points at one entry onto another, keeps the better
-- filled fields, records a redirect, then removes the old entry. Kept after
-- this migration so moderators can merge duplicates the same way later.
create or replace function public.merge_entry(p_old uuid, p_new uuid)
returns void
language plpgsql
as $fn$
declare
  r record;
begin
  if p_old is null or p_new is null or p_old = p_new then return; end if;
  if not exists (select 1 from public.entries where id = p_old)
     or not exists (select 1 from public.entries where id = p_new) then
    return;
  end if;

  update public.entries k set
    english_translation = coalesce(k.english_translation, o.english_translation),
    swahili_translation = coalesce(k.swahili_translation, o.swahili_translation),
    pronunciation_ipa   = coalesce(k.pronunciation_ipa, o.pronunciation_ipa),
    etymology           = coalesce(k.etymology, o.etymology),
    dialect_variant     = coalesce(k.dialect_variant, o.dialect_variant),
    category            = coalesce(k.category, o.category),
    part_of_speech      = coalesce(k.part_of_speech, o.part_of_speech),
    concept_id          = coalesce(k.concept_id, o.concept_id),
    human_reviewed      = k.human_reviewed or o.human_reviewed
  from public.entries o
  where k.id = p_new and o.id = p_old;

  -- One per person on these, so drop the old row where the person already
  -- has one on the keeper.
  delete from public.saved_words s where s.entry_id = p_old
    and exists (select 1 from public.saved_words t where t.entry_id = p_new and t.user_id = s.user_id);
  delete from public.entry_likes s where s.entry_id = p_old
    and exists (select 1 from public.entry_likes t where t.entry_id = p_new and t.user_id = s.user_id);
  delete from public.attestations s where s.entry_id = p_old
    and exists (select 1 from public.attestations t where t.entry_id = p_new and t.user_id = s.user_id);

  -- Every other column anywhere that references entries(id).
  for r in
    select c.conrelid::regclass as tbl, a.attname as col
      from pg_constraint c
      join pg_attribute a on a.attrelid = c.conrelid and a.attnum = c.conkey[1]
     where c.contype = 'f'
       and c.confrelid = 'public.entries'::regclass
       and array_length(c.conkey, 1) = 1
       and c.conrelid <> 'public.entry_redirects'::regclass
  loop
    execute format('update %s set %I = $1 where %I = $2', r.tbl, r.col, r.col) using p_new, p_old;
  end loop;

  insert into public.entry_redirects (old_id, new_id) values (p_old, p_new)
    on conflict (old_id) do update set new_id = excluded.new_id;
  update public.entry_redirects set new_id = p_new where new_id = p_old;

  delete from public.entries where id = p_old;
end;
$fn$;

-- g) headline. New columns go at the end, as a view can only gain columns there.
create or replace view public.corpus_headline as
select
  count(*) filter (
    where e.validation_status = 'verified' and not e.needs_orthography_review
      and l.role <> 'bridge' and l.is_active
  ) as indigenous_entries,
  count(*) filter (
    where e.validation_status = 'verified' and not e.needs_orthography_review and l.is_active
  ) as public_entries_including_bridge,
  count(distinct e.language_id) filter (
    where l.role <> 'bridge' and l.is_active
      and e.validation_status = 'verified' and not e.needs_orthography_review
  ) as languages,
  count(*) filter (where e.validation_status = 'seeded')                       as awaiting_curation,
  count(*) filter (where e.needs_orthography_review and l.is_active)           as awaiting_orthography,
  count(*) filter (
    where e.validation_status = 'verified' and not e.needs_orthography_review
      and l.role <> 'bridge' and l.is_active and e.human_reviewed
  ) as reviewed_entries,
  count(*) filter (where e.validation_status = 'flagged' and l.is_active)      as awaiting_confirmation
from public.entries e
join public.languages l on l.id = e.language_id;


-- ---------------------------------------------------------------------------
-- b to f) the data changes, with the dry-run switch
-- ---------------------------------------------------------------------------
do $do$
declare
  dry_run boolean := true;  -- DRY_RUN_SWITCH: set to false to apply
  public_before int;
  n_freedict int; n_archived int; n_headwords int; n_pos int; n_glosses int;
  n_merged int; n_flagged int; summary text;
begin
  select count(*) into public_before from public.entries
   where validation_status = 'verified' and not needs_orthography_review;

  -- human_reviewed, from real approvals
  update public.entries e set human_reviewed = true
   where exists (select 1 from public.validations v where v.entry_id = e.id and v.action = 'approve');

  -- b) FreeDict
  delete from public.entries e using public.languages l
   where l.id = e.language_id and l.code in ('en', 'sw')
     and e.created_at >= '2026-02-24 00:00+00' and e.created_at < '2026-02-25 00:00+00'
     and e.source_type = 'seed_pack' and e.created_by is null;
  get diagnostics n_freedict = row_count;

  -- c) focus languages only
  update public.languages set is_active = (code in ('en', 'sw', 'ki', 'luo', 'bxk', 'rag', 'lri', 'kam', 'kal', 'mas', 'som', 'dav', 'tvs'));

  update public.entries e
     set validation_status = 'archived',
         archived_reason = 'Language hidden in the November 2026 focus. Was verified.'
    from public.languages l
   where l.id = e.language_id and not l.is_active and e.validation_status = 'verified';
  get diagnostics n_archived = row_count;

  -- e) duplicates first: (retired entry, kept entry). Merging before the
  -- spelling tidy matters, because entries.unique_headword_per_language
  -- forbids two entries with the same spelling, and "Adhi maber." becomes
  -- "Adhi maber" only once its twin is gone.
  perform public.merge_entry(m.old_id, m.new_id)
    from (values
    ('28bb9f41-9f87-4213-89de-dc3bd10dcf8d'::uuid, '02382b81-86e5-4359-964b-66df3a71bcdf'::uuid),
    ('6ba6a22b-35b5-44ef-8bec-9aba733d3a84'::uuid, '037c406c-e320-4c18-9087-8bb54960b663'::uuid),
    ('062610c3-7e03-4517-9c04-7666c860e26b'::uuid, '47323a67-24da-4b80-b549-7e81d73b3123'::uuid),
    ('064df867-590a-4903-892e-8922bb0c1af4'::uuid, 'c34085b1-030f-48c6-9c50-d6b2e3c8997f'::uuid),
    ('92eaf439-bd43-4839-b83b-3a8028e6744d'::uuid, '07ee4308-16b3-4d38-b5f6-df4e9a4ad1f5'::uuid),
    ('098ca46c-8143-4047-8904-6ff8cd7205ff'::uuid, '12cbba99-67c7-4791-88ed-3abd33c8a3b4'::uuid),
    ('0c3b5554-96d5-4064-8fd2-cba0a0925a79'::uuid, '9ecc15aa-0e6c-414c-8dc7-80ae6f4dead3'::uuid),
    ('ce7f9541-a575-44db-83fc-214ce0ffcc9f'::uuid, '137d3a95-66fe-4a2a-a79b-29391c3e44e7'::uuid),
    ('1c2971b4-1cf9-4790-92be-e61669d90fbe'::uuid, '175d9b4f-6ad5-473e-a3bc-c936476c5e65'::uuid),
    ('1800fa03-b2a7-4cdf-b157-51a96eb725ff'::uuid, '93c66cb8-c3b7-43ea-96ae-6b00f07b992a'::uuid),
    ('1fe86698-f5d2-4aef-b110-13ec6e676dcd'::uuid, '3cfde84e-1f67-410a-8923-d5b65565f842'::uuid),
    ('82519e65-da31-449a-962c-4bb5d67247a2'::uuid, '2dcab2dc-0b85-4ebc-a078-b316562ad3af'::uuid),
    ('31a805d2-17e0-40ec-b693-e22a62545fd3'::uuid, '7aa4ecfb-cf31-4fce-a70e-58b1d9364ba1'::uuid),
    ('33844be0-e3f9-469f-b708-8711d9a39a95'::uuid, 'd3e1c0e9-9dc8-4915-b5cd-7b4f7e7373aa'::uuid),
    ('8771b4df-feab-4099-9353-00e8ebb20230'::uuid, '3ca40b19-f430-458b-bee5-3324dd5d5e26'::uuid),
    ('3cd6a492-5dd6-4556-87ea-8d930823ce67'::uuid, 'feb5b46c-5c4b-4fbe-bf0b-9919288c3eba'::uuid),
    ('7b3e8f6b-d0e2-49e1-a5a3-1fa7b50ce116'::uuid, '463a3079-95ea-48c6-98fc-6045afa9c314'::uuid),
    ('4c435a0b-767d-455a-ab78-0556f5579630'::uuid, '7b284ec3-2301-4bcc-ad08-66f603345c83'::uuid),
    ('9f246b94-4884-4d99-9909-f1cbb7a33f5a'::uuid, '4da724cc-03e3-4347-9f64-de1688631787'::uuid),
    ('870027b6-a542-4fb8-877d-979435d6e6a1'::uuid, '4f48a074-5190-4afe-b156-f973021eaa41'::uuid),
    ('5382b3af-4e80-42ca-ac7b-cede82a6e5b3'::uuid, 'ff57859d-3171-469e-8033-ed7f98212245'::uuid),
    ('55444c29-3710-48e2-af44-ad8e1a46ef99'::uuid, '6ebb6391-0ade-4392-828b-fb59d5b83bba'::uuid),
    ('ece13611-6bd4-4804-bf60-c8b97335f465'::uuid, '599ebd5e-a299-4f94-a2b7-f1e902fcb807'::uuid),
    ('62e1029b-7d1e-4d89-bd1d-4dbc9ea3b83d'::uuid, 'b2b4a9e7-96d4-439f-a673-a537a22a6084'::uuid),
    ('c63f1a1b-cf5a-4df6-ad75-54cbd3873977'::uuid, '680b7f5b-d311-465f-b74f-8ff1c020db98'::uuid),
    ('a96a0c11-9642-4969-8b89-552c73ea0a5f'::uuid, '69f2f04e-7102-4f86-9948-bcb47891f991'::uuid),
    ('973694f9-2086-41c6-988f-59f59ccc8d56'::uuid, '79d436ad-24aa-4d7b-9103-775bd8e3fe18'::uuid),
    ('8b2746c9-9696-4600-9d8a-6f0dfa67ddb5'::uuid, 'fa913d95-0091-4899-a65f-685177c42a5c'::uuid),
    ('8f88ad6c-81b5-4472-a6cb-e0fd7bec6dc7'::uuid, 'b5d8acd1-0508-492f-8bb2-58a5f4b809bf'::uuid),
    ('9352f448-c15a-4d1b-80dc-2bf60b0e0b10'::uuid, 'c5d06e92-336c-4ec8-9031-1be1205930dc'::uuid),
    ('d7df3290-cec1-40e7-b782-31eefaae8e91'::uuid, '946f3d2d-17b7-4012-bd37-7d02f3668391'::uuid),
    ('cabf7937-826c-45ac-9b25-9b195790cc95'::uuid, '97d96991-0008-4c7f-9ebd-e4a02415feb6'::uuid),
    ('d15590c7-250e-4c99-941b-91f41b6b319f'::uuid, '9df8602a-0d2f-4d89-9079-85a70419adfb'::uuid),
    ('ff87f6d1-c6e6-4eea-8005-1876c32398fb'::uuid, 'ba8ddfc5-306b-4a1f-bd2f-d5b682d6d06d'::uuid),
    ('fd996283-3778-4135-86cd-bf04ed7828a8'::uuid, 'cc7e7dac-530e-400c-8b04-84bd0b2b0887'::uuid),
    ('e6577003-8a88-48fe-8a58-3441d39a60b9'::uuid, 'f09d1c75-d26f-4a6b-907a-c3aad1835a7a'::uuid)
    ) as m(old_id, new_id);
  select count(*) into n_merged from public.entry_redirects;

  -- d) headwords. A tidy is skipped when its result would clash with another
  -- entry's spelling in the same language, either one that exists already or
  -- one this same statement would create. Those are the look-alike pairs left
  -- for a speaker, and they keep their current spelling.
  update public.entries e set headword = x.h
    from (
      select p.id, p.h
        from (
          select e2.id, e2.language_id, e2.headword,
                 case
                   when e2.needs_orthography_review then t.h0
                   when lower(coalesce(e2.part_of_speech, '')) = 'phrase'
                     then upper(left(t.h0, 1)) || substr(t.h0, 2)
                   when length(t.h0) > 1
                        and left(t.h0, 1) <> lower(left(t.h0, 1))
                        and substr(t.h0, 2) = lower(substr(t.h0, 2))
                     then lower(left(t.h0, 1)) || substr(t.h0, 2)
                   else t.h0
                 end as h
            from public.entries e2
            join public.languages l on l.id = e2.language_id and l.is_active
            cross join lateral (
              select regexp_replace(btrim(regexp_replace(e2.headword, '\s+', ' ', 'g')), '[.,;:]+$', '') as h0
            ) t
        ) p
       where p.h is distinct from p.headword
         and (select count(*) from public.entries o
               where o.language_id = p.language_id and o.headword = p.h) = 0
         and p.h not in (
               select q.h from (
                 select e3.language_id,
                        case
                          when e3.needs_orthography_review then t3.h0
                          when lower(coalesce(e3.part_of_speech, '')) = 'phrase'
                            then upper(left(t3.h0, 1)) || substr(t3.h0, 2)
                          when length(t3.h0) > 1
                               and left(t3.h0, 1) <> lower(left(t3.h0, 1))
                               and substr(t3.h0, 2) = lower(substr(t3.h0, 2))
                            then lower(left(t3.h0, 1)) || substr(t3.h0, 2)
                          else t3.h0
                        end as h
                   from public.entries e3
                   cross join lateral (
                     select regexp_replace(btrim(regexp_replace(e3.headword, '\s+', ' ', 'g')), '[.,;:]+$', '') as h0
                   ) t3
                  where e3.language_id = p.language_id and e3.id <> p.id
               ) q
             )
    ) x
   where x.id = e.id;
  get diagnostics n_headwords = row_count;

  -- d) part of speech
  update public.entries e
     set part_of_speech = case lower(e.part_of_speech)
           when 'n' then 'noun' when 'v' then 'verb' when 'adj' then 'adjective'
           when 'num' then 'number' when 'numeral' then 'number' when 'adv' then 'adverb'
           when 'interj' then 'interjection' when 'conj' then 'conjunction'
           when 'prep' then 'preposition' when 'pron' then 'pronoun'
           when 'irrv' then 'verb' when 'cop' then 'verb' end
    from public.languages l
   where l.id = e.language_id and l.is_active
     and lower(e.part_of_speech) in ('n','v','adj','num','numeral','adv','interj','conj','prep','pron','irrv','cop');
  get diagnostics n_pos = row_count;

  -- d) trailing full stops on glosses
  update public.entries e
     set english_translation = regexp_replace(btrim(e.english_translation), '\.+$', ''),
         swahili_translation = regexp_replace(btrim(e.swahili_translation), '\.+$', '')
    from public.languages l
   where l.id = e.language_id and l.is_active
     and (e.english_translation is distinct from regexp_replace(btrim(e.english_translation), '\.+$', '')
       or e.swahili_translation is distinct from regexp_replace(btrim(e.swahili_translation), '\.+$', ''));
  get diagnostics n_glosses = row_count;

  -- f) Kiswahili placeholders
  update public.entries e
     set validation_status = 'flagged',
         review_note = 'Phase 1 cleanup: this headword is the same as its Kiswahili translation. '
                    || 'Confirm it is really used in this language, or replace it.'
    from public.languages l
   where l.id = e.language_id and l.is_active and l.code not in ('en', 'sw')
     and e.validation_status = 'verified'
     and e.swahili_translation is not null
     and public.lk_normalize(e.headword) = public.lk_normalize(e.swahili_translation);
  get diagnostics n_flagged = row_count;

  select format(
    E'\n\nPHASE 1 SUMMARY%s\n'
    'public entries before: %s\n'
    'FreeDict entries deleted: %s\n'
    'entries archived with hidden languages: %s\n'
    'headwords tidied: %s | part of speech relabelled: %s | glosses tidied: %s\n'
    'duplicates merged (redirects): %s\n'
    'Kiswahili placeholders flagged: %s\n'
    'public entries after: %s, of which reviewed: %s\n'
    'active languages: %s\n\nper language (public / reviewed / flagged / damaged spelling)\n%s\n\n'
    'expected from the snapshot: %s',
    case when dry_run then ' (DRY RUN, nothing was saved)' else '' end,
    public_before, n_freedict, n_archived, n_headwords, n_pos, n_glosses, n_merged, n_flagged,
    (select count(*) from public.entries where validation_status = 'verified' and not needs_orthography_review),
    (select count(*) from public.entries where validation_status = 'verified' and not needs_orthography_review and human_reviewed),
    (select string_agg(code, ' ' order by code) from public.languages where is_active),
    (select string_agg(s.line, E'\n' order by s.name)
       from (
         select l.name,
                format('  %s: %s / %s / %s / %s', l.name,
                  count(*) filter (where e.validation_status = 'verified' and not e.needs_orthography_review),
                  count(*) filter (where e.validation_status = 'verified' and not e.needs_orthography_review and e.human_reviewed),
                  count(*) filter (where e.validation_status = 'flagged'),
                  count(*) filter (where e.needs_orthography_review)) as line
           from public.languages l
           left join public.entries e on e.language_id = l.id
          where l.is_active
          group by l.id, l.name
       ) s),
    '{"freedictDeleted":{"total":1723,"en":1199,"sw":524},"hiddenLanguages":25,"entriesArchived":2662,"headwordsTidied":1303,"headwordTidiesSkippedToAvoidAClash":4,"posRelabelled":33,"glossesTidied":116,"duplicatesMerged":36,"homonymGroupsLeftForASpeaker":6,"swahiliPlaceholdersFlagged":427,"placeholdersThatHadAnApproval":22,"publicEntriesBefore":4839,"publicEntriesAfter":1392,"ofWhichReviewed":194}'
  ) into summary;

  if dry_run then
    raise exception '%', summary;
  end if;
  raise notice '%', summary;
end
$do$;

commit;

-- After applying, the summary is also here:
-- select * from public.corpus_headline;
