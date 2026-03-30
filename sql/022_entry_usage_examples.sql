-- 022_entry_usage_examples.sql
-- Purpose:
-- 1) Add first-class usage examples for entries.
-- 2) Support bridge translations and moderation on examples.
-- 3) Backfill from legacy usage_contexts where possible.

begin;

create table if not exists public.entry_usage_examples (
  id uuid primary key default gen_random_uuid(),
  entry_id uuid not null references public.entries(id) on delete cascade,
  example_text text not null,
  english_translation text,
  swahili_translation text,
  notes text,
  register text not null default 'both',
  source_name text,
  source_url text,
  created_by uuid,
  validation_status text not null default 'pending',
  reviewed_by uuid,
  reviewed_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint entry_usage_examples_validation_status_allowed
    check (validation_status in ('pending', 'verified', 'disputed', 'flagged')),
  constraint entry_usage_examples_bridge_required
    check (
      nullif(trim(coalesce(english_translation, '')), '') is not null
      or nullif(trim(coalesce(swahili_translation, '')), '') is not null
    ),
  constraint entry_usage_examples_example_not_blank
    check (nullif(trim(coalesce(example_text, '')), '') is not null)
);

create index if not exists idx_entry_usage_examples_entry
  on public.entry_usage_examples (entry_id, validation_status, created_at desc);

create index if not exists idx_entry_usage_examples_created_by
  on public.entry_usage_examples (created_by, created_at desc);

drop trigger if exists trg_entry_usage_examples_updated_at on public.entry_usage_examples;
create trigger trg_entry_usage_examples_updated_at
before update on public.entry_usage_examples
for each row execute function public.set_updated_at_now();

do $$
declare
  has_usage_text boolean;
  has_context_text boolean;
  has_example_sentence boolean;
  has_created_at boolean;
  has_updated_at boolean;
begin
  if exists (
    select 1
    from information_schema.tables
    where table_schema = 'public'
      and table_name = 'usage_contexts'
  ) then
    select exists (
      select 1 from information_schema.columns
      where table_schema = 'public' and table_name = 'usage_contexts' and column_name = 'usage_text'
    ) into has_usage_text;

    select exists (
      select 1 from information_schema.columns
      where table_schema = 'public' and table_name = 'usage_contexts' and column_name = 'context_text'
    ) into has_context_text;

    select exists (
      select 1 from information_schema.columns
      where table_schema = 'public' and table_name = 'usage_contexts' and column_name = 'example_sentence'
    ) into has_example_sentence;

    select exists (
      select 1 from information_schema.columns
      where table_schema = 'public' and table_name = 'usage_contexts' and column_name = 'created_at'
    ) into has_created_at;

    select exists (
      select 1 from information_schema.columns
      where table_schema = 'public' and table_name = 'usage_contexts' and column_name = 'updated_at'
    ) into has_updated_at;

    execute format($sql$
      insert into public.entry_usage_examples (
        entry_id,
        example_text,
        english_translation,
        swahili_translation,
        register,
        created_by,
        validation_status,
        created_at,
        updated_at,
        source_name,
        notes
      )
      select
        uc.entry_id,
        trim(coalesce(%1$s, %2$s, %3$s)) as example_text,
        e.english_translation,
        e.swahili_translation,
        coalesce(e.register, 'both') as register,
        uc.created_by,
        'pending' as validation_status,
        coalesce(%4$s, now()),
        coalesce(%5$s, %4$s, now()),
        'usage_contexts_backfill' as source_name,
        'Backfilled from legacy usage_contexts table' as notes
      from public.usage_contexts uc
      join public.entries e on e.id = uc.entry_id
      where nullif(trim(coalesce(%1$s, %2$s, %3$s)), '') is not null
        and (
          nullif(trim(coalesce(e.english_translation, '')), '') is not null
          or nullif(trim(coalesce(e.swahili_translation, '')), '') is not null
        )
        and not exists (
          select 1
          from public.entry_usage_examples ex
          where ex.entry_id = uc.entry_id
            and lower(trim(ex.example_text)) = lower(trim(coalesce(%1$s, %2$s, %3$s)))
        );
    $sql$,
      case when has_usage_text then 'uc.usage_text' else 'null' end,
      case when has_context_text then 'uc.context_text' else 'null' end,
      case when has_example_sentence then 'uc.example_sentence' else 'null' end,
      case when has_created_at then 'uc.created_at' else 'null' end,
      case when has_updated_at then 'uc.updated_at' else 'null' end
    );
  end if;
end $$;

commit;
