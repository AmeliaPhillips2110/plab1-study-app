-- PLABoratory Stage a — schema (from approved Stage 0)
create extension if not exists "pgcrypto";

create type public.user_role as enum ('admin', 'student');
create type public.question_type as enum ('sba', 'flashcard', 'osce_station');
create type public.session_type as enum (
  'topic',
  'random',
  'weakness',
  'spaced_repetition',
  'full_mock',
  'as_many_as_you_can',
  'flashcard'
);
create type public.presentation_format as enum (
  'sba',
  'flashcard',
  'cover_the_options',
  'rapid_fire'
);
create type public.weakness_variant as enum (
  'by_topic',
  'by_tag',
  'recent_mistakes',
  'most_missed'
);
create type public.attempt_result as enum ('correct', 'incorrect', 'skipped', 'partial');
create type public.flag_status as enum ('open', 'resolved', 'dismissed');

create table public.exams (
  id            uuid primary key default gen_random_uuid(),
  slug          text not null unique,
  name          text not null,
  description   text,
  is_active     boolean not null default true,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now()
);

create table public.profiles (
  id            uuid primary key references auth.users (id) on delete cascade,
  email         text not null,
  display_name  text,
  role          public.user_role not null default 'student',
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now()
);

create table public.topics (
  id            uuid primary key default gen_random_uuid(),
  exam_id       uuid not null references public.exams (id) on delete cascade,
  parent_id     uuid references public.topics (id) on delete set null,
  slug          text not null,
  name          text not null,
  sort_order    int not null default 0,
  is_active     boolean not null default true,
  created_at    timestamptz not null default now(),
  unique (exam_id, slug)
);
create index topics_exam_id_idx on public.topics (exam_id);

create table public.tags (
  id            uuid primary key default gen_random_uuid(),
  exam_id       uuid not null references public.exams (id) on delete cascade,
  slug          text not null,
  label         text not null,
  category      text,
  created_at    timestamptz not null default now(),
  unique (exam_id, slug)
);

create table public.questions (
  id              uuid primary key default gen_random_uuid(),
  exam_id         uuid not null references public.exams (id) on delete cascade,
  topic_id        uuid references public.topics (id) on delete set null,
  question_type   public.question_type not null default 'sba',
  stem            text not null,
  explanation     text,
  payload         jsonb not null default '{}',
  difficulty      smallint check (difficulty between 1 and 5),
  is_active       boolean not null default true,
  is_uk_practice  boolean not null default false,
  created_by      uuid references public.profiles (id) on delete set null,
  updated_by      uuid references public.profiles (id) on delete set null,
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now()
);
create index questions_exam_id_idx on public.questions (exam_id);
create index questions_topic_id_idx on public.questions (topic_id);
create index questions_type_idx on public.questions (question_type);
create index questions_payload_gin on public.questions using gin (payload);

create table public.question_options (
  id            uuid primary key default gen_random_uuid(),
  question_id   uuid not null references public.questions (id) on delete cascade,
  label         text not null,
  body          text not null,
  is_correct    boolean not null default false,
  sort_order    int not null default 0,
  unique (question_id, label)
);
create index question_options_question_id_idx on public.question_options (question_id);

create table public.question_tags (
  question_id   uuid not null references public.questions (id) on delete cascade,
  tag_id        uuid not null references public.tags (id) on delete cascade,
  primary key (question_id, tag_id)
);

create table public.question_images (
  id            uuid primary key default gen_random_uuid(),
  question_id   uuid not null references public.questions (id) on delete cascade,
  storage_path  text not null,
  alt_text      text,
  sort_order    int not null default 0,
  created_at    timestamptz not null default now()
);

create table public.question_references (
  id            uuid primary key default gen_random_uuid(),
  question_id   uuid not null references public.questions (id) on delete cascade,
  label         text not null,
  url           text,
  note          text,
  sort_order    int not null default 0
);

create table public.question_flags (
  id            uuid primary key default gen_random_uuid(),
  question_id   uuid not null references public.questions (id) on delete cascade,
  raised_by     uuid not null references public.profiles (id) on delete cascade,
  reason        text not null,
  detail        text,
  status        public.flag_status not null default 'open',
  resolved_by   uuid references public.profiles (id) on delete set null,
  resolved_at   timestamptz,
  created_at    timestamptz not null default now()
);
create index question_flags_status_idx on public.question_flags (status);

create table public.glossary_terms (
  id            uuid primary key default gen_random_uuid(),
  exam_id       uuid not null references public.exams (id) on delete cascade,
  term          text not null,
  definition    text not null,
  aliases       text[] not null default '{}',
  section       text not null default 'General', -- UI grouping (e.g. Cardiology, UK practice)
  topic_id      uuid references public.topics (id) on delete set null,
  is_active     boolean not null default true,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now(),
  unique (exam_id, term)
);
create index glossary_terms_exam_section_idx on public.glossary_terms (exam_id, section);

create table public.exam_settings (
  exam_id           uuid primary key references public.exams (id) on delete cascade,
  pass_mark_percent numeric(5,2) not null default 65.00
    check (pass_mark_percent >= 0 and pass_mark_percent <= 100),
  default_mock_question_count int not null default 180,
  default_mock_minutes        int not null default 180,
  extra                     jsonb not null default '{}',
  updated_at                timestamptz not null default now(),
  updated_by                uuid references public.profiles (id) on delete set null
);

create table public.study_sessions (
  id                   uuid primary key default gen_random_uuid(),
  exam_id              uuid not null references public.exams (id) on delete cascade,
  user_id              uuid not null references public.profiles (id) on delete cascade,
  session_type         public.session_type not null,
  presentation_format  public.presentation_format not null default 'sba',
  topic_id             uuid references public.topics (id) on delete set null,
  weakness_variant     public.weakness_variant,
  unseen_only          boolean not null default false,
  settings             jsonb not null default '{}',
  started_at           timestamptz not null default now(),
  ended_at             timestamptz,
  time_limit_sec       int,
  question_count       int,
  score_percent        numeric(5,2),
  created_at           timestamptz not null default now(),
  constraint weakness_variant_consistency check (
    (session_type = 'weakness' and weakness_variant is not null)
    or (session_type <> 'weakness' and weakness_variant is null)
  )
);
create index study_sessions_user_exam_idx on public.study_sessions (user_id, exam_id);
create index study_sessions_type_idx on public.study_sessions (session_type);

create table public.attempts (
  id              uuid primary key default gen_random_uuid(),
  session_id      uuid references public.study_sessions (id) on delete cascade,
  exam_id         uuid not null references public.exams (id) on delete cascade,
  user_id         uuid not null references public.profiles (id) on delete cascade,
  question_id     uuid not null references public.questions (id) on delete cascade,
  selected_option_id uuid references public.question_options (id) on delete set null,
  response_payload jsonb not null default '{}',
  result          public.attempt_result not null,
  time_spent_ms   int,
  answered_at     timestamptz not null default now()
);
create index attempts_user_exam_idx on public.attempts (user_id, exam_id);
create index attempts_question_id_idx on public.attempts (question_id);
create index attempts_session_id_idx on public.attempts (session_id);

create table public.mistake_tags (
  id            uuid primary key default gen_random_uuid(),
  attempt_id    uuid not null references public.attempts (id) on delete cascade,
  tag           text not null,
  note          text,
  created_at    timestamptz not null default now()
);
create index mistake_tags_attempt_id_idx on public.mistake_tags (attempt_id);

create table public.spaced_repetition_state (
  user_id         uuid not null references public.profiles (id) on delete cascade,
  question_id     uuid not null references public.questions (id) on delete cascade,
  exam_id         uuid not null references public.exams (id) on delete cascade,
  ease_factor     numeric(4,2) not null default 2.50,
  interval_days   numeric(8,2) not null default 0,
  repetitions     int not null default 0,
  due_at          timestamptz not null default now(),
  last_result     public.attempt_result,
  last_reviewed_at timestamptz,
  updated_at      timestamptz not null default now(),
  primary key (user_id, question_id)
);
create index sr_due_idx on public.spaced_repetition_state (user_id, exam_id, due_at);

create table public.notes (
  id            uuid primary key default gen_random_uuid(),
  user_id       uuid not null references public.profiles (id) on delete cascade,
  question_id   uuid not null references public.questions (id) on delete cascade,
  exam_id       uuid not null references public.exams (id) on delete cascade,
  body          text not null,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now(),
  unique (user_id, question_id)
);

-- New students opt IN to peer comparison (comparison_opt_out = false by default).
create table public.user_preferences (
  user_id               uuid primary key references public.profiles (id) on delete cascade,
  theme                 text not null default 'dark' check (theme in ('dark', 'light', 'system')),
  comparison_opt_out    boolean not null default false,
  reading_speed_wpm     int,
  extra                 jsonb not null default '{}',
  updated_at            timestamptz not null default now()
);

create or replace function public.current_role()
returns public.user_role
language sql
stable
security definer
set search_path = public
as $$
  select role from public.profiles where id = auth.uid();
$$;

create or replace function public.is_admin()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1 from public.profiles where id = auth.uid() and role = 'admin'
  );
$$;

-- Auto-create profile + preferences on signup
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.profiles (id, email, display_name, role)
  values (
    new.id,
    coalesce(new.email, ''),
    coalesce(new.raw_user_meta_data->>'display_name', split_part(coalesce(new.email, 'student'), '@', 1)),
    'student'
  );
  insert into public.user_preferences (user_id)
  values (new.id);
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- Prevent students from elevating their own role via client updates
create or replace function public.protect_profile_role()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  if not public.is_admin() and new.role is distinct from old.role then
    raise exception 'Only admins can change roles';
  end if;
  new.updated_at = now();
  return new;
end;
$$;

create trigger profiles_protect_role
  before update on public.profiles
  for each row execute function public.protect_profile_role();
