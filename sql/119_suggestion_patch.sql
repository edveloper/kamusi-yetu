-- 119_suggestion_patch.sql
--
-- A suggested correction can now cover any field of an entry, not only the
-- headword and definition. The proposed values travel as one JSON object of
-- column -> new value, which the moderation API applies through the same
-- allowlist as a reviewer's own edits (app/api/moderation/action/route.ts).
--
-- Until now the entry page's "Suggest a correction" wrote to columns that do
-- not exist on this table, so every correction failed. Safe to run more than
-- once; it only adds a column.

alter table public.entry_suggestions add column if not exists patch jsonb;

comment on column public.entry_suggestions.patch is
  'Proposed new values, keyed by entries column name. Applied only through the moderation API allowlist.';

-- A contributor cannot see other people's pending meanings, so the browser
-- cannot know the next free position. The database numbers them instead.
create or replace function public.assign_sense_position()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  new.position := coalesce(
    (select max(position) from public.entry_senses where entry_id = new.entry_id), 1
  ) + 1;
  return new;
end;
$$;

drop trigger if exists trg_assign_sense_position on public.entry_senses;
create trigger trg_assign_sense_position
  before insert on public.entry_senses
  for each row execute function public.assign_sense_position();
