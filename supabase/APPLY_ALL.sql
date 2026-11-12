-- =============================================================================
-- PLABoratory — ONE-PASTE Supabase setup
-- Paste this entire file into Supabase → SQL → New query → Run
-- Creates schema, RLS, PLAB 1 seed (~51 SBA + flashcards + glossary).
-- Prefer a project where these tables do not already exist (or drop them first).
-- AFTER this succeeds and Amelia has signed up, also run: supabase/PROMOTE_AMELIA.sql
-- Individual files remain under supabase/migrations/ and supabase/seed*.sql
-- =============================================================================

-- >>> BEGIN schema
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

-- >>> BEGIN RLS
-- PLABoratory Stage a — Row Level Security

alter table public.exams enable row level security;
alter table public.profiles enable row level security;
alter table public.topics enable row level security;
alter table public.tags enable row level security;
alter table public.questions enable row level security;
alter table public.question_options enable row level security;
alter table public.question_tags enable row level security;
alter table public.question_images enable row level security;
alter table public.question_references enable row level security;
alter table public.question_flags enable row level security;
alter table public.glossary_terms enable row level security;
alter table public.exam_settings enable row level security;
alter table public.study_sessions enable row level security;
alter table public.attempts enable row level security;
alter table public.mistake_tags enable row level security;
alter table public.spaced_repetition_state enable row level security;
alter table public.notes enable row level security;
alter table public.user_preferences enable row level security;

-- exams
create policy exams_select on public.exams
  for select to authenticated
  using (is_active = true or public.is_admin());
create policy exams_admin_write on public.exams
  for all to authenticated
  using (public.is_admin())
  with check (public.is_admin());

-- profiles
create policy profiles_select_own_or_admin on public.profiles
  for select to authenticated
  using (id = auth.uid() or public.is_admin());
create policy profiles_update_own_or_admin on public.profiles
  for update to authenticated
  using (id = auth.uid() or public.is_admin())
  with check (id = auth.uid() or public.is_admin());

-- topics
create policy topics_select on public.topics
  for select to authenticated
  using (is_active = true or public.is_admin());
create policy topics_admin_write on public.topics
  for all to authenticated
  using (public.is_admin())
  with check (public.is_admin());

-- tags
create policy tags_select on public.tags
  for select to authenticated
  using (true);
create policy tags_admin_write on public.tags
  for all to authenticated
  using (public.is_admin())
  with check (public.is_admin());

-- questions
create policy questions_select on public.questions
  for select to authenticated
  using (is_active = true or public.is_admin());
create policy questions_admin_write on public.questions
  for all to authenticated
  using (public.is_admin())
  with check (public.is_admin());

-- question_options
create policy question_options_select on public.question_options
  for select to authenticated
  using (
    exists (
      select 1 from public.questions q
      where q.id = question_id and (q.is_active = true or public.is_admin())
    )
  );
create policy question_options_admin_write on public.question_options
  for all to authenticated
  using (public.is_admin())
  with check (public.is_admin());

-- question_tags
create policy question_tags_select on public.question_tags
  for select to authenticated
  using (true);
create policy question_tags_admin_write on public.question_tags
  for all to authenticated
  using (public.is_admin())
  with check (public.is_admin());

-- question_images
create policy question_images_select on public.question_images
  for select to authenticated
  using (true);
create policy question_images_admin_write on public.question_images
  for all to authenticated
  using (public.is_admin())
  with check (public.is_admin());

-- question_references
create policy question_references_select on public.question_references
  for select to authenticated
  using (true);
create policy question_references_admin_write on public.question_references
  for all to authenticated
  using (public.is_admin())
  with check (public.is_admin());

-- question_flags
create policy question_flags_select on public.question_flags
  for select to authenticated
  using (raised_by = auth.uid() or public.is_admin());
create policy question_flags_insert on public.question_flags
  for insert to authenticated
  with check (raised_by = auth.uid());
create policy question_flags_admin_update on public.question_flags
  for update to authenticated
  using (public.is_admin())
  with check (public.is_admin());

-- glossary
create policy glossary_select on public.glossary_terms
  for select to authenticated
  using (is_active = true or public.is_admin());
create policy glossary_admin_write on public.glossary_terms
  for all to authenticated
  using (public.is_admin())
  with check (public.is_admin());

-- exam_settings
create policy exam_settings_select on public.exam_settings
  for select to authenticated
  using (true);
create policy exam_settings_admin_write on public.exam_settings
  for all to authenticated
  using (public.is_admin())
  with check (public.is_admin());

-- study_sessions
create policy study_sessions_own on public.study_sessions
  for all to authenticated
  using (user_id = auth.uid() or public.is_admin())
  with check (user_id = auth.uid() or public.is_admin());

-- attempts
create policy attempts_own on public.attempts
  for all to authenticated
  using (user_id = auth.uid() or public.is_admin())
  with check (user_id = auth.uid() or public.is_admin());

-- mistake_tags (via attempt ownership)
create policy mistake_tags_own on public.mistake_tags
  for all to authenticated
  using (
    public.is_admin()
    or exists (
      select 1 from public.attempts a
      where a.id = attempt_id and a.user_id = auth.uid()
    )
  )
  with check (
    public.is_admin()
    or exists (
      select 1 from public.attempts a
      where a.id = attempt_id and a.user_id = auth.uid()
    )
  );

-- spaced repetition
create policy sr_own on public.spaced_repetition_state
  for all to authenticated
  using (user_id = auth.uid() or public.is_admin())
  with check (user_id = auth.uid() or public.is_admin());

-- notes
create policy notes_own on public.notes
  for all to authenticated
  using (user_id = auth.uid() or public.is_admin())
  with check (user_id = auth.uid() or public.is_admin());

-- user_preferences
create policy user_preferences_own on public.user_preferences
  for all to authenticated
  using (user_id = auth.uid() or public.is_admin())
  with check (user_id = auth.uid() or public.is_admin());

-- >>> BEGIN seed (exam, topics, SBA bank, glossary)
-- PLABoratory Stage a seed — original SAMPLE/UNVERIFIED teaching items (not from commercial banks)
-- Run AFTER migrations. Safe to re-run for exam/topics if using ON CONFLICT.

insert into public.exams (id, slug, name, description, is_active)
values (
  'a1000000-0000-4000-8000-000000000001',
  'plab1',
  'PLAB 1',
  'PLAB 1 single best answer study bank (PLABoratory).',
  true
)
on conflict (slug) do update set name = excluded.name, description = excluded.description, is_active = excluded.is_active, updated_at = now();

insert into public.exam_settings (exam_id, pass_mark_percent, default_mock_question_count, default_mock_minutes)
values ('a1000000-0000-4000-8000-000000000001', 65.00, 180, 180)
on conflict (exam_id) do update set pass_mark_percent = excluded.pass_mark_percent;

insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000001', 'a1000000-0000-4000-8000-000000000001', 'cardiology', 'Cardiology', 10, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000002', 'a1000000-0000-4000-8000-000000000001', 'respiratory', 'Respiratory', 20, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000003', 'a1000000-0000-4000-8000-000000000001', 'gastroenterology', 'Gastroenterology', 30, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000004', 'a1000000-0000-4000-8000-000000000001', 'endocrine', 'Endocrinology', 40, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000005', 'a1000000-0000-4000-8000-000000000001', 'renal', 'Renal', 50, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000006', 'a1000000-0000-4000-8000-000000000001', 'neurology', 'Neurology', 60, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000007', 'a1000000-0000-4000-8000-000000000001', 'psychiatry', 'Psychiatry', 70, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000008', 'a1000000-0000-4000-8000-000000000001', 'obstetrics-gynaecology', 'Obstetrics & Gynaecology', 80, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000009', 'a1000000-0000-4000-8000-000000000001', 'paediatrics', 'Paediatrics', 90, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000010', 'a1000000-0000-4000-8000-000000000001', 'infectious-disease', 'Infectious Disease', 100, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000011', 'a1000000-0000-4000-8000-000000000001', 'musculoskeletal', 'Musculoskeletal', 110, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000012', 'a1000000-0000-4000-8000-000000000001', 'dermatology', 'Dermatology', 120, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000013', 'a1000000-0000-4000-8000-000000000001', 'ethics-uk-practice', 'Ethics & UK Practice', 130, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values ('a2000000-0000-4000-8000-000000000014', 'a1000000-0000-4000-8000-000000000001', 'haematology', 'Haematology', 140, true) on conflict (exam_id, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;

insert into public.tags (id, exam_id, slug, label, category) values
  ('a3000000-0000-4000-8000-000000000001', 'a1000000-0000-4000-8000-000000000001', 'uk-practice', 'UK practice', 'uk_practice'),
  ('a3000000-0000-4000-8000-000000000002', 'a1000000-0000-4000-8000-000000000001', 'sample-unverified', 'Sample / unverified', 'meta'),
  ('a3000000-0000-4000-8000-000000000003', 'a1000000-0000-4000-8000-000000000001', 'patient-centred', 'Patient-centred', 'communication')
on conflict (exam_id, slug) do nothing;

-- Glossary (English PLAB / UK clinical terms; section used for UI grouping)
insert into public.glossary_terms (exam_id, term, definition, aliases, section, is_active) values
  ('a1000000-0000-4000-8000-000000000001', 'SBA', 'Single Best Answer — one correct option among several plausible answers; PLAB 1 format.', array['single best answer'], 'Exam & PLAB', true),
  ('a1000000-0000-4000-8000-000000000001', 'PLAB', 'Professional and Linguistic Assessments Board — GMC pathway exams for international medical graduates (PLAB 1 written SBA; PLAB 2 OSCE).', array['PLAB 1', 'PLAB 2'], 'Exam & PLAB', true),
  ('a1000000-0000-4000-8000-000000000001', 'OSCE', 'Objective Structured Clinical Examination — station-based clinical skills assessment (PLAB 2 style).', array['objective structured clinical examination'], 'Exam & PLAB', true),
  ('a1000000-0000-4000-8000-000000000001', 'MLA', 'Medical Licensing Assessment — UK medical school / GMC licensing framework; PLAB aligns with similar knowledge expectations.', array['Medical Licensing Assessment'], 'Exam & PLAB', true),
  ('a1000000-0000-4000-8000-000000000001', 'NICE', 'National Institute for Health and Care Excellence — UK guidance body for clinical pathways and technology appraisal.', array['NICE guideline'], 'UK systems', true),
  ('a1000000-0000-4000-8000-000000000001', 'GMC', 'General Medical Council — UK medical regulator; Good Medical Practice sets professional standards.', array['General Medical Council'], 'UK systems', true),
  ('a1000000-0000-4000-8000-000000000001', 'BNF', 'British National Formulary — UK reference for prescribing, doses, and cautions.', array['British National Formulary'], 'UK systems', true),
  ('a1000000-0000-4000-8000-000000000001', 'NHS', 'National Health Service — publicly funded UK healthcare system.', array['National Health Service'], 'UK systems', true),
  ('a1000000-0000-4000-8000-000000000001', 'CQC', 'Care Quality Commission — independent regulator of health and social care in England.', array['Care Quality Commission'], 'UK systems', true),
  ('a1000000-0000-4000-8000-000000000001', 'DVLA', 'Driver and Vehicle Licensing Agency — driving fitness standards after medical conditions (e.g. seizure, vision).', array['Driver and Vehicle Licensing Agency'], 'UK systems', true),
  ('a1000000-0000-4000-8000-000000000001', 'A&E', 'Accident and Emergency — UK emergency department for acute unscheduled care.', array['ED', 'emergency department'], 'UK systems', true),
  ('a1000000-0000-4000-8000-000000000001', 'GP', 'General Practitioner — primary care doctor in UK community practice.', array['general practitioner', 'general practice'], 'UK systems', true),
  ('a1000000-0000-4000-8000-000000000001', 'ACS', 'Acute coronary syndrome — unstable angina / NSTEMI / STEMI spectrum.', array['acute coronary syndrome'], 'Cardiology', true),
  ('a1000000-0000-4000-8000-000000000001', 'STEMI', 'ST-elevation myocardial infarction — ECG ST elevation with coronary occlusion pattern.', array['ST elevation MI'], 'Cardiology', true),
  ('a1000000-0000-4000-8000-000000000001', 'NSTEMI', 'Non-ST-elevation myocardial infarction — troponin-positive ACS without persistent ST elevation.', array['non-ST elevation MI'], 'Cardiology', true),
  ('a1000000-0000-4000-8000-000000000001', 'AF', 'Atrial fibrillation — irregularly irregular supraventricular arrhythmia; stroke risk assessed with CHA2DS2-VASc.', array['atrial fibrillation'], 'Cardiology', true),
  ('a1000000-0000-4000-8000-000000000001', 'CHA2DS2-VASc', 'Stroke risk score in atrial fibrillation (CHF, Hypertension, Age, Diabetes, Stroke/TIA, Vascular disease, Sex category).', array['CHADS-VASc', 'CHA2DS2VASc'], 'Cardiology', true),
  ('a1000000-0000-4000-8000-000000000001', 'heart failure', 'Clinical syndrome of reduced cardiac output or elevated filling pressures causing breathlessness, oedema, or fatigue.', array['HF', 'CHF'], 'Cardiology', true),
  ('a1000000-0000-4000-8000-000000000001', 'COPD', 'Chronic obstructive pulmonary disease — progressive airflow limitation, usually smoking-related.', array[]::text[], 'Respiratory', true),
  ('a1000000-0000-4000-8000-000000000001', 'PEFR', 'Peak expiratory flow rate — bedside measure of airway obstruction in asthma.', array['peak flow'], 'Respiratory', true),
  ('a1000000-0000-4000-8000-000000000001', 'CURB-65', 'Severity score for community-acquired pneumonia (Confusion, Urea, Respiratory rate, Blood pressure, age ≥65).', array['CURB65'], 'Respiratory', true),
  ('a1000000-0000-4000-8000-000000000001', 'CAP', 'Community-acquired pneumonia — pneumonia acquired outside hospital.', array['community-acquired pneumonia'], 'Respiratory', true),
  ('a1000000-0000-4000-8000-000000000001', 'PE', 'Pulmonary embolism — venous thromboembolism lodging in pulmonary arteries.', array['pulmonary embolism'], 'Respiratory', true),
  ('a1000000-0000-4000-8000-000000000001', 'asthma', 'Reversible airway obstruction with wheeze, cough, or dyspnoea; treat acute attacks with bronchodilators ± steroids.', array[]::text[], 'Respiratory', true),
  ('a1000000-0000-4000-8000-000000000001', 'DKA', 'Diabetic ketoacidosis — hyperglycaemia, ketosis, and metabolic acidosis; emergency insulin/fluid protocol.', array['diabetic ketoacidosis'], 'Endocrine', true),
  ('a1000000-0000-4000-8000-000000000001', 'HHS', 'Hyperosmolar hyperglycaemic state — marked hyperglycaemia and osmolarity, usually without significant ketoacidosis.', array['HONK'], 'Endocrine', true),
  ('a1000000-0000-4000-8000-000000000001', 'HbA1c', 'Glycated haemoglobin — reflects average glycaemia over ~2–3 months; used to diagnose/monitor diabetes.', array['A1c'], 'Endocrine', true),
  ('a1000000-0000-4000-8000-000000000001', 'thyroid storm', 'Life-threatening thyrotoxicosis with fever, tachycardia, and systemic decompensation.', array['thyrotoxic crisis'], 'Endocrine', true),
  ('a1000000-0000-4000-8000-000000000001', 'AKI', 'Acute kidney injury — abrupt fall in GFR; staged by creatinine/urine output (KDIGO).', array['acute kidney injury'], 'Renal', true),
  ('a1000000-0000-4000-8000-000000000001', 'CKD', 'Chronic kidney disease — reduced GFR or markers of kidney damage lasting ≥3 months.', array['chronic kidney disease'], 'Renal', true),
  ('a1000000-0000-4000-8000-000000000001', 'eGFR', 'Estimated glomerular filtration rate — kidney function estimate from creatinine (± cystatin C).', array['estimated GFR'], 'Renal', true),
  ('a1000000-0000-4000-8000-000000000001', 'stroke', 'Acute focal neurological deficit from infarction or haemorrhage; time-critical imaging and pathway.', array['CVA', 'cerebrovascular accident'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'TIA', 'Transient ischaemic attack — brief focal ischaemia without lasting infarction on imaging; high early stroke risk.', array['transient ischaemic attack'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'SAH', 'Subarachnoid haemorrhage — often thunderclap headache; exclude urgently with CT ± LP.', array['subarachnoid haemorrhage'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'seizure', 'Episodic abnormal neuronal discharge; first seizure work-up differs from known epilepsy management.', array['fit'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'capacity', 'Mental capacity (UK MCA 2005): ability to understand, retain, weigh and communicate a decision.', array['mental capacity'], 'Ethics & law', true),
  ('a1000000-0000-4000-8000-000000000001', 'MCA', 'Mental Capacity Act 2005 (England/Wales) — framework for capacity, best interests, and lasting powers of attorney.', array['Mental Capacity Act'], 'Ethics & law', true),
  ('a1000000-0000-4000-8000-000000000001', 'consent', 'Valid consent requires capacity, adequate information (benefits/risks/alternatives), and voluntariness.', array['informed consent'], 'Ethics & law', true),
  ('a1000000-0000-4000-8000-000000000001', 'safeguarding', 'Protecting adults/children at risk of abuse or neglect; escalate via local multi-agency pathways.', array['safeguarding adults', 'safeguarding children'], 'Ethics & law', true),
  ('a1000000-0000-4000-8000-000000000001', 'DNACPR', 'Do Not Attempt Cardiopulmonary Resuscitation — documented decision after appropriate discussion.', array['DNAR', 'DNR'], 'Ethics & law', true),
  ('a1000000-0000-4000-8000-000000000001', 'NEWS2', 'National Early Warning Score 2 — UK track-and-trigger for acute deterioration (RR, SpO2, air/O2, BP, HR, consciousness, temperature).', array['NEWS'], 'Acute care', true),
  ('a1000000-0000-4000-8000-000000000001', 'sepsis', 'Life-threatening organ dysfunction from infection; UK pathways emphasise early recognition and antibiotics.', array['septic'], 'Acute care', true),
  ('a1000000-0000-4000-8000-000000000001', 'anaphylaxis', 'Severe systemic allergic reaction — IM adrenaline is first-line emergency treatment.', array['anaphylactic'], 'Acute care', true),
  ('a1000000-0000-4000-8000-000000000001', 'ABCDE', 'Airway, Breathing, Circulation, Disability, Exposure — structured approach to the acutely ill patient.', array['ABC'], 'Acute care', true),
  ('a1000000-0000-4000-8000-000000000001', 'GCS', 'Glasgow Coma Scale — eye, verbal, motor response score for consciousness.', array['Glasgow Coma Scale'], 'Acute care', true),
  ('a1000000-0000-4000-8000-000000000001', 'Wells score', 'Clinical probability tool for DVT or PE before D-dimer / imaging decisions.', array['Wells'], 'Acute care', true),
  ('a1000000-0000-4000-8000-000000000001', 'croup', 'Viral laryngotracheitis in children — barking cough and stridor; usually managed supportively ± steroids.', array['laryngotracheitis'], 'Paediatrics', true),
  ('a1000000-0000-4000-8000-000000000001', 'bronchiolitis', 'Viral lower airway infection in infants (often RSV) — supportive care is mainstay.', array[]::text[], 'Paediatrics', true),
  ('a1000000-0000-4000-8000-000000000001', 'NSTEMI pathway', 'UK ACS pathway for non-ST elevation MI — antiplatelet therapy, risk stratification, and timely angiography.', array[]::text[], 'Cardiology', true),
  ('a1000000-0000-4000-8000-000000000001', 'patient-centred', 'Care that respects patient values, preferences, and shared decision-making alongside clinical evidence.', array['patient centred', 'shared decision-making'], 'Ethics & law', true)
on conflict (exam_id, term) do update
  set definition = excluded.definition,
      aliases = excluded.aliases,
      section = excluded.section,
      is_active = true,
      updated_at = now();

-- Clear previous sample questions (by meta tag) is skipped for safety; inserts use fixed IDs.

-- Q1
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000001', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 58-year-old man presents with central chest pain radiating to the left arm for 40 minutes. He is sweaty and nauseated. ECG shows ST elevation in leads II, III and aVF. Which coronary artery is most likely occluded?', 'SAMPLE/UNVERIFIED teaching item. Inferior STEMI typically reflects right coronary artery occlusion (less often circumflex).', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000001';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-000100000000', 'a4000000-0000-4000-8000-000000000001', 'A', 'Left anterior descending', false, 0),
  ('a5000000-0000-4000-8000-000100000001', 'a4000000-0000-4000-8000-000000000001', 'B', 'Right coronary artery', true, 1),
  ('a5000000-0000-4000-8000-000100000002', 'a4000000-0000-4000-8000-000000000001', 'C', 'Left circumflex', false, 2),
  ('a5000000-0000-4000-8000-000100000003', 'a4000000-0000-4000-8000-000000000001', 'D', 'Left main stem', false, 3),
  ('a5000000-0000-4000-8000-000100000004', 'a4000000-0000-4000-8000-000000000001', 'E', 'Posterior descending only', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000001', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q2
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000002', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'A 72-year-old woman with heart failure has orthopnoea and bilateral basal crackles. Which first-line oral loop diuretic is most appropriate for acute fluid overload in primary care pending review?', 'SAMPLE/UNVERIFIED. Furosemide is commonly used as a loop diuretic for symptomatic fluid overload.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000002';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-000200000000', 'a4000000-0000-4000-8000-000000000002', 'A', 'Furosemide', true, 0),
  ('a5000000-0000-4000-8000-000200000001', 'a4000000-0000-4000-8000-000000000002', 'B', 'Spironolactone', false, 1),
  ('a5000000-0000-4000-8000-000200000002', 'a4000000-0000-4000-8000-000000000002', 'C', 'Amlodipine', false, 2),
  ('a5000000-0000-4000-8000-000200000003', 'a4000000-0000-4000-8000-000000000002', 'D', 'Digoxin', false, 3),
  ('a5000000-0000-4000-8000-000200000004', 'a4000000-0000-4000-8000-000000000002', 'E', 'Atenolol', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000002', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q3
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000003', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'sba', 'According to common UK practice for suspected ACS in primary care before transfer, which immediate treatment is usually given if not contraindicated?', 'SAMPLE/UNVERIFIED UK-practice style item. Aspirin 300 mg is standard early antiplatelet therapy when ACS is suspected.', 3, true, true, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000003';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-000300000000', 'a4000000-0000-4000-8000-000000000003', 'A', 'IV heparin bolus only', false, 0),
  ('a5000000-0000-4000-8000-000300000001', 'a4000000-0000-4000-8000-000000000003', 'B', 'Routine thrombolysis in GP surgery', false, 1),
  ('a5000000-0000-4000-8000-000300000002', 'a4000000-0000-4000-8000-000000000003', 'C', 'Aspirin 300 mg', true, 2),
  ('a5000000-0000-4000-8000-000300000003', 'a4000000-0000-4000-8000-000000000003', 'D', 'Immediate digoxin loading', false, 3),
  ('a5000000-0000-4000-8000-000300000004', 'a4000000-0000-4000-8000-000000000003', 'E', 'High-dose ibuprofen', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000003', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000003', 'a3000000-0000-4000-8000-000000000001') on conflict do nothing;

-- Q4
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000004', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 24-year-old with known asthma presents with wheeze, RR 28, speaking in short phrases, PEFR 45% of best. Which is the most appropriate initial nebulised treatment?', 'SAMPLE/UNVERIFIED. Nebulised salbutamol is first-line bronchodilator therapy in acute asthma.', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000004';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-000400000000', 'a4000000-0000-4000-8000-000000000004', 'A', 'Salbutamol', true, 0),
  ('a5000000-0000-4000-8000-000400000001', 'a4000000-0000-4000-8000-000000000004', 'B', 'Ipratropium alone without beta-agonist', false, 1),
  ('a5000000-0000-4000-8000-000400000002', 'a4000000-0000-4000-8000-000000000004', 'C', 'IV aminophylline first', false, 2),
  ('a5000000-0000-4000-8000-000400000003', 'a4000000-0000-4000-8000-000000000004', 'D', 'Oral prednisolone only', false, 3),
  ('a5000000-0000-4000-8000-000400000004', 'a4000000-0000-4000-8000-000000000004', 'E', 'Nebulised adrenaline', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000004', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q5
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000005', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A 68-year-old smoker has progressive dyspnoea and a chronic productive cough for 3 years. Spirometry shows FEV1/FVC 0.58. What is the most likely diagnosis?', 'SAMPLE/UNVERIFIED. Persistent productive cough + obstructive spirometry in a smoker suggests COPD.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000005';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-000500000000', 'a4000000-0000-4000-8000-000000000005', 'A', 'Asthma', false, 0),
  ('a5000000-0000-4000-8000-000500000001', 'a4000000-0000-4000-8000-000000000005', 'B', 'COPD', true, 1),
  ('a5000000-0000-4000-8000-000500000002', 'a4000000-0000-4000-8000-000000000005', 'C', 'Pulmonary fibrosis', false, 2),
  ('a5000000-0000-4000-8000-000500000003', 'a4000000-0000-4000-8000-000000000005', 'D', 'Bronchiectasis only', false, 3),
  ('a5000000-0000-4000-8000-000500000004', 'a4000000-0000-4000-8000-000000000005', 'E', 'Heart failure', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000005', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q6
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000006', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'sba', 'A patient with community-acquired pneumonia is CURB-65 = 0 and clinically stable. In typical UK ambulatory care, which antibiotic class is commonly considered first-line (local guidance permitting)?', 'SAMPLE/UNVERIFIED. Amoxicillin is a frequent first-line choice for low-severity CAP when local resistance patterns allow.', 3, true, true, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000006';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-000600000000', 'a4000000-0000-4000-8000-000000000006', 'A', 'Amoxicillin', true, 0),
  ('a5000000-0000-4000-8000-000600000001', 'a4000000-0000-4000-8000-000000000006', 'B', 'IV vancomycin', false, 1),
  ('a5000000-0000-4000-8000-000600000002', 'a4000000-0000-4000-8000-000000000006', 'C', 'IV meropenem', false, 2),
  ('a5000000-0000-4000-8000-000600000003', 'a4000000-0000-4000-8000-000000000006', 'D', 'Oral ciprofloxacin routinely first', false, 3),
  ('a5000000-0000-4000-8000-000600000004', 'a4000000-0000-4000-8000-000000000006', 'E', 'No antibiotic ever', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000006', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000006', 'a3000000-0000-4000-8000-000000000001') on conflict do nothing;

-- Q7
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000007', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 45-year-old man has epigastric pain relieved by food and worse at night. Urea breath test is positive. What is the most appropriate next management principle?', 'SAMPLE/UNVERIFIED. H. pylori positive dyspepsia is managed with eradication therapy (PPI + antibiotics per local protocol).', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000007';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-000700000000', 'a4000000-0000-4000-8000-000000000007', 'A', 'Immediate laparotomy', false, 0),
  ('a5000000-0000-4000-8000-000700000001', 'a4000000-0000-4000-8000-000000000007', 'B', 'Long-term NSAID increase', false, 1),
  ('a5000000-0000-4000-8000-000700000002', 'a4000000-0000-4000-8000-000000000007', 'C', 'H. pylori eradication therapy', true, 2),
  ('a5000000-0000-4000-8000-000700000003', 'a4000000-0000-4000-8000-000000000007', 'D', 'High-dose opioids', false, 3),
  ('a5000000-0000-4000-8000-000700000004', 'a4000000-0000-4000-8000-000000000007', 'E', 'No treatment', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000007', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q8
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000008', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 60-year-old with cirrhosis develops confusion and a flapping tremor. Which emergency complication is most likely?', 'SAMPLE/UNVERIFIED. Asterixis with confusion in cirrhosis suggests hepatic encephalopathy.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000008';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-000800000000', 'a4000000-0000-4000-8000-000000000008', 'A', 'Acute pancreatitis', false, 0),
  ('a5000000-0000-4000-8000-000800000001', 'a4000000-0000-4000-8000-000000000008', 'B', 'Hepatic encephalopathy', true, 1),
  ('a5000000-0000-4000-8000-000800000002', 'a4000000-0000-4000-8000-000000000008', 'C', 'Myxoedema coma', false, 2),
  ('a5000000-0000-4000-8000-000800000003', 'a4000000-0000-4000-8000-000000000008', 'D', 'Hypocalcaemic tetany', false, 3),
  ('a5000000-0000-4000-8000-000800000004', 'a4000000-0000-4000-8000-000000000008', 'E', 'Addisonian crisis', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000008', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q9
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000009', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000003', 'sba', 'A 28-year-old has bloody diarrhoea, urgency and cramping for 3 weeks. Colonoscopy shows continuous mucosal inflammation from the rectum. What is the most likely diagnosis?', 'SAMPLE/UNVERIFIED. Continuous rectal-starting colitis suggests ulcerative colitis rather than patchy Crohn''s.', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000009';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-000900000000', 'a4000000-0000-4000-8000-000000000009', 'A', 'Ulcerative colitis', true, 0),
  ('a5000000-0000-4000-8000-000900000001', 'a4000000-0000-4000-8000-000000000009', 'B', 'Coeliac disease', false, 1),
  ('a5000000-0000-4000-8000-000900000002', 'a4000000-0000-4000-8000-000000000009', 'C', 'Diverticulitis', false, 2),
  ('a5000000-0000-4000-8000-000900000003', 'a4000000-0000-4000-8000-000000000009', 'D', 'IBS only', false, 3),
  ('a5000000-0000-4000-8000-000900000004', 'a4000000-0000-4000-8000-000000000009', 'E', 'Peptic ulcer', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000009', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q10
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000010', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A 34-year-old woman has weight loss, heat intolerance, tremor and a smooth goitre. TSH is suppressed and free T4 is high. What is the most likely diagnosis?', 'SAMPLE/UNVERIFIED. Suppressed TSH with high T4 and typical symptoms indicate thyrotoxicosis (e.g. Graves'').', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000010';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-001000000000', 'a4000000-0000-4000-8000-000000000010', 'A', 'Hypothyroidism', false, 0),
  ('a5000000-0000-4000-8000-001000000001', 'a4000000-0000-4000-8000-000000000010', 'B', 'Addison''s disease', false, 1),
  ('a5000000-0000-4000-8000-001000000002', 'a4000000-0000-4000-8000-000000000010', 'C', 'Cushing''s syndrome', false, 2),
  ('a5000000-0000-4000-8000-001000000003', 'a4000000-0000-4000-8000-000000000010', 'D', 'Thyrotoxicosis', true, 3),
  ('a5000000-0000-4000-8000-001000000004', 'a4000000-0000-4000-8000-000000000010', 'E', 'Hyperprolactinaemia', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000010', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q11
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000011', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'A patient with type 1 diabetes is sweaty, tremulous and confused with capillary glucose 2.4 mmol/L. What is the immediate priority?', 'SAMPLE/UNVERIFIED. Treat hypoglycaemia first with fast-acting carbohydrate (or glucagon/IV glucose if unable to swallow).', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000011';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-001100000000', 'a4000000-0000-4000-8000-000000000011', 'A', 'Give fast-acting carbohydrate', true, 0),
  ('a5000000-0000-4000-8000-001100000001', 'a4000000-0000-4000-8000-000000000011', 'B', 'Give additional insulin', false, 1),
  ('a5000000-0000-4000-8000-001100000002', 'a4000000-0000-4000-8000-000000000011', 'C', 'Start metformin', false, 2),
  ('a5000000-0000-4000-8000-001100000003', 'a4000000-0000-4000-8000-000000000011', 'D', 'Order HbA1c only', false, 3),
  ('a5000000-0000-4000-8000-001100000004', 'a4000000-0000-4000-8000-000000000011', 'E', 'Fluid restrict', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000011', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q12
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000012', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'sba', 'In UK practice, what is a common first-line oral medication for type 2 diabetes when lifestyle measures are insufficient and eGFR is adequate?', 'SAMPLE/UNVERIFIED. Metformin remains a usual first-line oral agent when not contraindicated.', 3, true, true, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000012';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-001200000000', 'a4000000-0000-4000-8000-000000000012', 'A', 'Gliclazide always first', false, 0),
  ('a5000000-0000-4000-8000-001200000001', 'a4000000-0000-4000-8000-000000000012', 'B', 'Metformin', true, 1),
  ('a5000000-0000-4000-8000-001200000002', 'a4000000-0000-4000-8000-000000000012', 'C', 'Insulin detemir immediately for all', false, 2),
  ('a5000000-0000-4000-8000-001200000003', 'a4000000-0000-4000-8000-000000000012', 'D', 'Pioglitazone for everyone first', false, 3),
  ('a5000000-0000-4000-8000-001200000004', 'a4000000-0000-4000-8000-000000000012', 'E', 'Acarbose only', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000012', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000012', 'a3000000-0000-4000-8000-000000000001') on conflict do nothing;

-- Q13
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000013', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A 55-year-old on an ACE inhibitor starts an NSAID and develops rising creatinine. Which mechanism best explains the acute kidney injury risk?', 'SAMPLE/UNVERIFIED. Combined ACE inhibitor + NSAID can impair glomerular filtration pressure autoregulation.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000013';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-001300000000', 'a4000000-0000-4000-8000-000000000013', 'A', 'Direct ureteric obstruction', false, 0),
  ('a5000000-0000-4000-8000-001300000001', 'a4000000-0000-4000-8000-000000000013', 'B', 'Massive rhabdomyolysis only', false, 1),
  ('a5000000-0000-4000-8000-001300000002', 'a4000000-0000-4000-8000-000000000013', 'C', 'Reduced glomerular filtration pressure', true, 2),
  ('a5000000-0000-4000-8000-001300000003', 'a4000000-0000-4000-8000-000000000013', 'D', 'Acute tubular necrosis from alcohol only', false, 3),
  ('a5000000-0000-4000-8000-001300000004', 'a4000000-0000-4000-8000-000000000013', 'E', 'Hypercalcaemia', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000013', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q14
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000014', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A urinalysis shows 3+ blood and 3+ protein with red cell casts. Which renal syndrome pattern does this most suggest?', 'SAMPLE/UNVERIFIED. Red cell casts with proteinuria/haematuria point toward a glomerular (nephritic) process.', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000014';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-001400000000', 'a4000000-0000-4000-8000-000000000014', 'A', 'Nephritic/glomerular disease', true, 0),
  ('a5000000-0000-4000-8000-001400000001', 'a4000000-0000-4000-8000-000000000014', 'B', 'Simple dehydration', false, 1),
  ('a5000000-0000-4000-8000-001400000002', 'a4000000-0000-4000-8000-000000000014', 'C', 'Isolated lower UTI only', false, 2),
  ('a5000000-0000-4000-8000-001400000003', 'a4000000-0000-4000-8000-000000000014', 'D', 'Nephrotic syndrome without active sediment', false, 3),
  ('a5000000-0000-4000-8000-001400000004', 'a4000000-0000-4000-8000-000000000014', 'E', 'Renal artery stenosis alone', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000014', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q15
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000015', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000005', 'sba', 'A patient with CKD stage 4 has phosphate 2.1 mmol/L. Which dietary advice is most relevant?', 'SAMPLE/UNVERIFIED. Hyperphosphataemia in advanced CKD is managed with phosphate restriction and binders as indicated.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000015';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-001500000000', 'a4000000-0000-4000-8000-000000000015', 'A', 'High phosphate diet', false, 0),
  ('a5000000-0000-4000-8000-001500000001', 'a4000000-0000-4000-8000-000000000015', 'B', 'Phosphate restriction', true, 1),
  ('a5000000-0000-4000-8000-001500000002', 'a4000000-0000-4000-8000-000000000015', 'C', 'Unlimited cola intake', false, 2),
  ('a5000000-0000-4000-8000-001500000003', 'a4000000-0000-4000-8000-000000000015', 'D', 'High potassium diet always', false, 3),
  ('a5000000-0000-4000-8000-001500000004', 'a4000000-0000-4000-8000-000000000015', 'E', 'Stop all fluids', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000015', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q16
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000016', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A 70-year-old develops sudden right-sided weakness and aphasia lasting 20 minutes that fully resolves. CT head is normal. What is the most likely diagnosis?', 'SAMPLE/UNVERIFIED. Transient focal neurology resolving within 24 hours with normal CT suggests TIA (time definitions evolve; clinical teaching item).', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000016';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-001600000000', 'a4000000-0000-4000-8000-000000000016', 'A', 'Transient ischaemic attack', true, 0),
  ('a5000000-0000-4000-8000-001600000001', 'a4000000-0000-4000-8000-000000000016', 'B', 'Migraine with aura only always', false, 1),
  ('a5000000-0000-4000-8000-001600000002', 'a4000000-0000-4000-8000-000000000016', 'C', 'Generalised tonic-clonic seizure', false, 2),
  ('a5000000-0000-4000-8000-001600000003', 'a4000000-0000-4000-8000-000000000016', 'D', 'Peripheral neuropathy', false, 3),
  ('a5000000-0000-4000-8000-001600000004', 'a4000000-0000-4000-8000-000000000016', 'E', 'Myasthenia crisis', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000016', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q17
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000017', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A young adult has unilateral throbbing headache with photophobia and nausea, without fever or focal signs. What is the most likely primary headache type?', 'SAMPLE/UNVERIFIED. Migraine typically features unilateral throbbing pain with photo/phonophobia and nausea.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000017';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-001700000000', 'a4000000-0000-4000-8000-000000000017', 'A', 'Cluster headache', false, 0),
  ('a5000000-0000-4000-8000-001700000001', 'a4000000-0000-4000-8000-000000000017', 'B', 'Tension-type only', false, 1),
  ('a5000000-0000-4000-8000-001700000002', 'a4000000-0000-4000-8000-000000000017', 'C', 'Migraine', true, 2),
  ('a5000000-0000-4000-8000-001700000003', 'a4000000-0000-4000-8000-000000000017', 'D', 'Trigeminal neuralgia', false, 3),
  ('a5000000-0000-4000-8000-001700000004', 'a4000000-0000-4000-8000-000000000017', 'E', 'SAH', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000017', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q18
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000018', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'sba', 'A patient presents with thunderclap headache reaching maximum intensity within seconds. What is the most important diagnosis to exclude first?', 'SAMPLE/UNVERIFIED. Thunderclap headache requires urgent exclusion of subarachnoid haemorrhage.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000018';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-001800000000', 'a4000000-0000-4000-8000-000000000018', 'A', 'Tension headache', false, 0),
  ('a5000000-0000-4000-8000-001800000001', 'a4000000-0000-4000-8000-000000000018', 'B', 'Sinusitis', false, 1),
  ('a5000000-0000-4000-8000-001800000002', 'a4000000-0000-4000-8000-000000000018', 'C', 'Medication overuse', false, 2),
  ('a5000000-0000-4000-8000-001800000003', 'a4000000-0000-4000-8000-000000000018', 'D', 'Migraine without investigation', false, 3),
  ('a5000000-0000-4000-8000-001800000004', 'a4000000-0000-4000-8000-000000000018', 'E', 'Subarachnoid haemorrhage', true, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000018', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q19
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000019', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A 22-year-old describes low mood, anhedonia, early morning waking and guilt for 6 weeks with impaired work function. What is the most likely diagnosis?', 'SAMPLE/UNVERIFIED. Duration and biological features with functional impairment suggest a depressive episode.', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000019';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-001900000000', 'a4000000-0000-4000-8000-000000000019', 'A', 'Normal bereavement only', false, 0),
  ('a5000000-0000-4000-8000-001900000001', 'a4000000-0000-4000-8000-000000000019', 'B', 'Depressive episode', true, 1),
  ('a5000000-0000-4000-8000-001900000002', 'a4000000-0000-4000-8000-000000000019', 'C', 'Mania', false, 2),
  ('a5000000-0000-4000-8000-001900000003', 'a4000000-0000-4000-8000-000000000019', 'D', 'OCD', false, 3),
  ('a5000000-0000-4000-8000-001900000004', 'a4000000-0000-4000-8000-000000000019', 'E', 'Simple stress without disorder', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000019', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q20
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000020', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'A patient on a typical antipsychotic develops fever, rigidity and autonomic instability. What serious adverse reaction must be considered?', 'SAMPLE/UNVERIFIED. Neuroleptic malignant syndrome presents with rigidity, fever and autonomic instability.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000020';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-002000000000', 'a4000000-0000-4000-8000-000000000020', 'A', 'Neuroleptic malignant syndrome', true, 0),
  ('a5000000-0000-4000-8000-002000000001', 'a4000000-0000-4000-8000-000000000020', 'B', 'Serotonin syndrome from antibiotics', false, 1),
  ('a5000000-0000-4000-8000-002000000002', 'a4000000-0000-4000-8000-000000000020', 'C', 'Simple viral illness only', false, 2),
  ('a5000000-0000-4000-8000-002000000003', 'a4000000-0000-4000-8000-000000000020', 'D', 'Akathisia alone', false, 3),
  ('a5000000-0000-4000-8000-002000000004', 'a4000000-0000-4000-8000-000000000020', 'E', 'Tardive dyskinesia only', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000020', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q21
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000021', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000007', 'sba', 'In UK acute mental health practice, which principle is central when assessing risk after expressing suicidal ideation?', 'SAMPLE/UNVERIFIED. Structured risk assessment including intent, plans, protective factors and urgent safety planning is essential.', 3, true, true, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000021';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-002100000000', 'a4000000-0000-4000-8000-000000000021', 'A', 'Ignore ideation if polite', false, 0),
  ('a5000000-0000-4000-8000-002100000001', 'a4000000-0000-4000-8000-000000000021', 'B', 'Discharge without safety plan always', false, 1),
  ('a5000000-0000-4000-8000-002100000002', 'a4000000-0000-4000-8000-000000000021', 'C', 'Assess risk and arrange appropriate support/safety planning', true, 2),
  ('a5000000-0000-4000-8000-002100000003', 'a4000000-0000-4000-8000-000000000021', 'D', 'Mandatory admission for every fleeting thought', false, 3),
  ('a5000000-0000-4000-8000-002100000004', 'a4000000-0000-4000-8000-000000000021', 'E', 'Only family can assess', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000021', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000021', 'a3000000-0000-4000-8000-000000000001') on conflict do nothing;

-- Q22
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000022', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 28-year-old at 8 weeks'' gestation has unilateral pelvic pain and spotting. β-hCG is positive and transvaginal ultrasound shows an empty uterus with an adnexal mass. What is the most likely diagnosis?', 'SAMPLE/UNVERIFIED. Pregnancy + empty uterus + adnexal mass/pain suggests ectopic pregnancy until proven otherwise.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000022';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-002200000000', 'a4000000-0000-4000-8000-000000000022', 'A', 'Ectopic pregnancy', true, 0),
  ('a5000000-0000-4000-8000-002200000001', 'a4000000-0000-4000-8000-000000000022', 'B', 'Inevitable miscarriage only', false, 1),
  ('a5000000-0000-4000-8000-002200000002', 'a4000000-0000-4000-8000-000000000022', 'C', 'Ovarian torsion without pregnancy', false, 2),
  ('a5000000-0000-4000-8000-002200000003', 'a4000000-0000-4000-8000-000000000022', 'D', 'Appendicitis only', false, 3),
  ('a5000000-0000-4000-8000-002200000004', 'a4000000-0000-4000-8000-000000000022', 'E', 'Fibroid degeneration', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000022', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q23
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000023', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A 19-year-old has heavy irregular periods since menarche, normal exam, and negative pregnancy test. What is a common initial management approach for anovulatory bleeding in adolescents?', 'SAMPLE/UNVERIFIED. After excluding pregnancy/red flags, hormonal regulation (e.g. combined hormonal contraception if suitable) is often used.', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000023';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-002300000000', 'a4000000-0000-4000-8000-000000000023', 'A', 'Immediate hysterectomy', false, 0),
  ('a5000000-0000-4000-8000-002300000001', 'a4000000-0000-4000-8000-000000000023', 'B', 'High-dose warfarin', false, 1),
  ('a5000000-0000-4000-8000-002300000002', 'a4000000-0000-4000-8000-000000000023', 'C', 'Routine laparoscopy first', false, 2),
  ('a5000000-0000-4000-8000-002300000003', 'a4000000-0000-4000-8000-000000000023', 'D', 'Hormonal cycle regulation if appropriate', true, 3),
  ('a5000000-0000-4000-8000-002300000004', 'a4000000-0000-4000-8000-000000000023', 'E', 'Ignore indefinitely', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000023', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q24
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000024', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000008', 'sba', 'A pregnant woman at 28 weeks reports reduced fetal movements. What is the most appropriate immediate advice in typical UK maternity pathways?', 'SAMPLE/UNVERIFIED. Reduced fetal movements warrant same-day assessment (contact maternity unit), not waiting for routine clinic.', 3, true, true, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000024';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-002400000000', 'a4000000-0000-4000-8000-000000000024', 'A', 'Wait two weeks for next clinic', false, 0),
  ('a5000000-0000-4000-8000-002400000001', 'a4000000-0000-4000-8000-000000000024', 'B', 'Contact maternity services for same-day assessment', true, 1),
  ('a5000000-0000-4000-8000-002400000002', 'a4000000-0000-4000-8000-000000000024', 'C', 'Start aspirin only', false, 2),
  ('a5000000-0000-4000-8000-002400000003', 'a4000000-0000-4000-8000-000000000024', 'D', 'Increase exercise intensely', false, 3),
  ('a5000000-0000-4000-8000-002400000004', 'a4000000-0000-4000-8000-000000000024', 'E', 'Stop all fluids', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000024', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000024', 'a3000000-0000-4000-8000-000000000001') on conflict do nothing;

-- Q25
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000025', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 2-year-old has barky cough, hoarse voice and stridor that worsens at night. He is otherwise well and saturating normally. What is the most likely diagnosis?', 'SAMPLE/UNVERIFIED. Barking cough and stridor in a toddler commonly indicate croup (viral laryngotracheitis).', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000025';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-002500000000', 'a4000000-0000-4000-8000-000000000025', 'A', 'Croup', true, 0),
  ('a5000000-0000-4000-8000-002500000001', 'a4000000-0000-4000-8000-000000000025', 'B', 'Epiglottitis (classic drooling toxic child)', false, 1),
  ('a5000000-0000-4000-8000-002500000002', 'a4000000-0000-4000-8000-000000000025', 'C', 'Asthma only', false, 2),
  ('a5000000-0000-4000-8000-002500000003', 'a4000000-0000-4000-8000-000000000025', 'D', 'Foreign body always', false, 3),
  ('a5000000-0000-4000-8000-002500000004', 'a4000000-0000-4000-8000-000000000025', 'E', 'Pneumonia', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000025', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q26
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000026', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A 6-week-old exclusively breastfed infant has projectile non-bilious vomiting and a palpable pyloric olive. What is the most likely diagnosis?', 'SAMPLE/UNVERIFIED. Projectile non-bilious vomiting at ~2–8 weeks with pyloric mass suggests pyloric stenosis.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000026';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-002600000000', 'a4000000-0000-4000-8000-000000000026', 'A', 'Gastro-oesophageal reflux alone', false, 0),
  ('a5000000-0000-4000-8000-002600000001', 'a4000000-0000-4000-8000-000000000026', 'B', 'Intussusception', false, 1),
  ('a5000000-0000-4000-8000-002600000002', 'a4000000-0000-4000-8000-000000000026', 'C', 'Pyloric stenosis', true, 2),
  ('a5000000-0000-4000-8000-002600000003', 'a4000000-0000-4000-8000-000000000026', 'D', 'Hirschsprung disease', false, 3),
  ('a5000000-0000-4000-8000-002600000004', 'a4000000-0000-4000-8000-000000000026', 'E', 'Coeliac disease', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000026', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q27
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000027', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'sba', 'A child with petechiae, fever and looking unwell should prompt urgent consideration of which life-threatening infection?', 'SAMPLE/UNVERIFIED. Non-blanching rash with fever/unwell child raises concern for meningococcal disease.', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000027';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-002700000000', 'a4000000-0000-4000-8000-000000000027', 'A', 'Simple viral exanthem always', false, 0),
  ('a5000000-0000-4000-8000-002700000001', 'a4000000-0000-4000-8000-000000000027', 'B', 'Meningococcal disease', true, 1),
  ('a5000000-0000-4000-8000-002700000002', 'a4000000-0000-4000-8000-000000000027', 'C', 'Atopic eczema', false, 2),
  ('a5000000-0000-4000-8000-002700000003', 'a4000000-0000-4000-8000-000000000027', 'D', 'Impetigo only', false, 3),
  ('a5000000-0000-4000-8000-002700000004', 'a4000000-0000-4000-8000-000000000027', 'E', 'Urticaria', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000027', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q28
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000028', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A traveller returns from a malaria-endemic region with fever, rigors and headache. What investigation is essential?', 'SAMPLE/UNVERIFIED. Urgent malaria films/antigen testing is required in fever after travel to endemic areas.', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000028';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-002800000000', 'a4000000-0000-4000-8000-000000000028', 'A', 'Malaria blood tests', true, 0),
  ('a5000000-0000-4000-8000-002800000001', 'a4000000-0000-4000-8000-000000000028', 'B', 'Only throat swab', false, 1),
  ('a5000000-0000-4000-8000-002800000002', 'a4000000-0000-4000-8000-000000000028', 'C', 'Only urine culture', false, 2),
  ('a5000000-0000-4000-8000-002800000003', 'a4000000-0000-4000-8000-000000000028', 'D', 'Ignore fever', false, 3),
  ('a5000000-0000-4000-8000-002800000004', 'a4000000-0000-4000-8000-000000000028', 'E', 'Routine lipid profile', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000028', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q29
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000029', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'A patient develops watery diarrhoea 5 days after broad-spectrum antibiotics. What organism is an important cause to consider?', 'SAMPLE/UNVERIFIED. Clostridioides difficile is a classic antibiotic-associated colitis pathogen.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000029';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-002900000000', 'a4000000-0000-4000-8000-000000000029', 'A', 'Helicobacter pylori', false, 0),
  ('a5000000-0000-4000-8000-002900000001', 'a4000000-0000-4000-8000-000000000029', 'B', 'Mycobacterium tuberculosis', false, 1),
  ('a5000000-0000-4000-8000-002900000002', 'a4000000-0000-4000-8000-000000000029', 'C', 'Treponema pallidum', false, 2),
  ('a5000000-0000-4000-8000-002900000003', 'a4000000-0000-4000-8000-000000000029', 'D', 'Clostridioides difficile', true, 3),
  ('a5000000-0000-4000-8000-002900000004', 'a4000000-0000-4000-8000-000000000029', 'E', 'Plasmodium falciparum', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000029', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q30
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000030', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'sba', 'Needle-stick injury from a known hepatitis B positive source: what is the key immediate principle after first aid?', 'SAMPLE/UNVERIFIED UK occupational health style. Urgent risk assessment and hepatitis B immunoglobulin/vaccination pathway as indicated.', 2, true, true, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000030';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-003000000000', 'a4000000-0000-4000-8000-000000000030', 'A', 'Wait one month then test only', false, 0),
  ('a5000000-0000-4000-8000-003000000001', 'a4000000-0000-4000-8000-000000000030', 'B', 'Urgent occupational health / post-exposure pathway', true, 1),
  ('a5000000-0000-4000-8000-003000000002', 'a4000000-0000-4000-8000-000000000030', 'C', 'No action if gloves worn briefly', false, 2),
  ('a5000000-0000-4000-8000-003000000003', 'a4000000-0000-4000-8000-000000000030', 'D', 'Start chemotherapy', false, 3),
  ('a5000000-0000-4000-8000-003000000004', 'a4000000-0000-4000-8000-000000000030', 'E', 'Routine dental check', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000030', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000030', 'a3000000-0000-4000-8000-000000000001') on conflict do nothing;

-- Q31
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000031', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A 65-year-old has morning stiffness lasting over an hour, symmetrical small-joint swelling, and positive rheumatoid factor. What is the most likely diagnosis?', 'SAMPLE/UNVERIFIED. Symmetrical inflammatory polyarthritis with prolonged morning stiffness suggests rheumatoid arthritis.', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000031';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-003100000000', 'a4000000-0000-4000-8000-000000000031', 'A', 'Rheumatoid arthritis', true, 0),
  ('a5000000-0000-4000-8000-003100000001', 'a4000000-0000-4000-8000-000000000031', 'B', 'Osteoarthritis only', false, 1),
  ('a5000000-0000-4000-8000-003100000002', 'a4000000-0000-4000-8000-000000000031', 'C', 'Gout of first MTP only', false, 2),
  ('a5000000-0000-4000-8000-003100000003', 'a4000000-0000-4000-8000-000000000031', 'D', 'Fibromyalgia', false, 3),
  ('a5000000-0000-4000-8000-003100000004', 'a4000000-0000-4000-8000-000000000031', 'E', 'Mechanical back pain', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000031', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q32
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000032', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'A middle-aged man has sudden severe pain and swelling in the first MTP joint overnight. Synovial fluid shows needle-shaped negatively birefringent crystals. Diagnosis?', 'SAMPLE/UNVERIFIED. Monosodium urate crystals indicate gout.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000032';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-003200000000', 'a4000000-0000-4000-8000-000000000032', 'A', 'Pseudogout', false, 0),
  ('a5000000-0000-4000-8000-003200000001', 'a4000000-0000-4000-8000-000000000032', 'B', 'Septic arthritis only always', false, 1),
  ('a5000000-0000-4000-8000-003200000002', 'a4000000-0000-4000-8000-000000000032', 'C', 'Gout', true, 2),
  ('a5000000-0000-4000-8000-003200000003', 'a4000000-0000-4000-8000-000000000032', 'D', 'RA flare', false, 3),
  ('a5000000-0000-4000-8000-003200000004', 'a4000000-0000-4000-8000-000000000032', 'E', 'Fracture', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000032', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q33
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000033', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000011', 'sba', 'Back pain with saddle anaesthesia and urinary retention requires urgent recognition of which syndrome?', 'SAMPLE/UNVERIFIED. Red-flag neurology suggests cauda equina syndrome needing emergency imaging/referral.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000033';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-003300000000', 'a4000000-0000-4000-8000-000000000033', 'A', 'Simple mechanical pain', false, 0),
  ('a5000000-0000-4000-8000-003300000001', 'a4000000-0000-4000-8000-000000000033', 'B', 'Cauda equina syndrome', true, 1),
  ('a5000000-0000-4000-8000-003300000002', 'a4000000-0000-4000-8000-000000000033', 'C', 'Anxiety only', false, 2),
  ('a5000000-0000-4000-8000-003300000003', 'a4000000-0000-4000-8000-000000000033', 'D', 'Vitamin D deficiency alone', false, 3),
  ('a5000000-0000-4000-8000-003300000004', 'a4000000-0000-4000-8000-000000000033', 'E', 'Plantar fasciitis', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000033', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q34
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000034', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'A child has a highly itchy web-space and wrist rash worse at night; several family members itch. What is most likely?', 'SAMPLE/UNVERIFIED. Nocturnal itch with family clustering and classical sites suggests scabies.', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000034';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-003400000000', 'a4000000-0000-4000-8000-000000000034', 'A', 'Scabies', true, 0),
  ('a5000000-0000-4000-8000-003400000001', 'a4000000-0000-4000-8000-000000000034', 'B', 'Psoriasis only', false, 1),
  ('a5000000-0000-4000-8000-003400000002', 'a4000000-0000-4000-8000-000000000034', 'C', 'Melanoma', false, 2),
  ('a5000000-0000-4000-8000-003400000003', 'a4000000-0000-4000-8000-000000000034', 'D', 'Cellulitis of the face', false, 3),
  ('a5000000-0000-4000-8000-003400000004', 'a4000000-0000-4000-8000-000000000034', 'E', 'Vitiligo', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000034', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q35
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000035', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000012', 'sba', 'An expanding annular erythema after a tick bite in a Lyme-endemic area most likely represents?', 'SAMPLE/UNVERIFIED. Erythema migrans is the classic early Lyme presentation.', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000035';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-003500000000', 'a4000000-0000-4000-8000-000000000035', 'A', 'Tinea corporis always', false, 0),
  ('a5000000-0000-4000-8000-003500000001', 'a4000000-0000-4000-8000-000000000035', 'B', 'Fixed drug eruption only', false, 1),
  ('a5000000-0000-4000-8000-003500000002', 'a4000000-0000-4000-8000-000000000035', 'C', 'Erysipelas of the ear', false, 2),
  ('a5000000-0000-4000-8000-003500000003', 'a4000000-0000-4000-8000-000000000035', 'D', 'Erythema migrans', true, 3),
  ('a5000000-0000-4000-8000-003500000004', 'a4000000-0000-4000-8000-000000000035', 'E', 'Acne', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000035', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q36
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000036', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'A competent adult refuses a recommended blood transfusion for religious reasons. What is the most appropriate ethical/legal approach in UK practice?', 'SAMPLE/UNVERIFIED. Respect informed refusal by a capacitous adult; explore understanding and document, offer alternatives.', 2, true, true, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000036';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-003600000000', 'a4000000-0000-4000-8000-000000000036', 'A', 'Respect capacitated refusal after ensuring understanding', true, 0),
  ('a5000000-0000-4000-8000-003600000001', 'a4000000-0000-4000-8000-000000000036', 'B', 'Transfuse secretly', false, 1),
  ('a5000000-0000-4000-8000-003600000002', 'a4000000-0000-4000-8000-000000000036', 'C', 'Ask the family to override capacity', false, 2),
  ('a5000000-0000-4000-8000-003600000003', 'a4000000-0000-4000-8000-000000000036', 'D', 'Discharge without discussion', false, 3),
  ('a5000000-0000-4000-8000-003600000004', 'a4000000-0000-4000-8000-000000000036', 'E', 'Assume lack of capacity solely due to religion', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000036', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000036', 'a3000000-0000-4000-8000-000000000001') on conflict do nothing;

-- Q37
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000037', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'When is it generally appropriate to breach confidentiality in UK clinical practice?', 'SAMPLE/UNVERIFIED. Confidentiality may be breached when required by law or when there is a serious risk of harm that outweighs the duty (proportionate disclosure).', 3, true, true, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000037';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-003700000000', 'a4000000-0000-4000-8000-000000000037', 'A', 'Whenever a relative asks', false, 0),
  ('a5000000-0000-4000-8000-003700000001', 'a4000000-0000-4000-8000-000000000037', 'B', 'To gossip with colleagues socially', false, 1),
  ('a5000000-0000-4000-8000-003700000002', 'a4000000-0000-4000-8000-000000000037', 'C', 'When required by law or to prevent serious harm (proportionate)', true, 2),
  ('a5000000-0000-4000-8000-003700000003', 'a4000000-0000-4000-8000-000000000037', 'D', 'Never under any circumstances', false, 3),
  ('a5000000-0000-4000-8000-003700000004', 'a4000000-0000-4000-8000-000000000037', 'E', 'Only after newspaper enquiry', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000037', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000037', 'a3000000-0000-4000-8000-000000000001') on conflict do nothing;

-- Q38
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000038', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'sba', 'Before a procedure, valid consent in UK practice requires which core element?', 'SAMPLE/UNVERIFIED. Consent requires capacity, adequate information (benefits/risks/alternatives), and voluntariness.', 2, true, true, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000038';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-003800000000', 'a4000000-0000-4000-8000-000000000038', 'A', 'Signature alone without discussion', false, 0),
  ('a5000000-0000-4000-8000-003800000001', 'a4000000-0000-4000-8000-000000000038', 'B', 'Capacity, information and voluntariness', true, 1),
  ('a5000000-0000-4000-8000-003800000002', 'a4000000-0000-4000-8000-000000000038', 'C', 'Family consent for all competent adults', false, 2),
  ('a5000000-0000-4000-8000-003800000003', 'a4000000-0000-4000-8000-000000000038', 'D', 'Payment first', false, 3),
  ('a5000000-0000-4000-8000-003800000004', 'a4000000-0000-4000-8000-000000000038', 'E', 'Two consultants always', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000038', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000038', 'a3000000-0000-4000-8000-000000000001') on conflict do nothing;

-- Q39
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000039', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A patient has fatigue, glossitis and a macrocytic anaemia with low B12. Neurological pins and needles are present. What is an important cause to consider?', 'SAMPLE/UNVERIFIED. B12 deficiency can cause macrocytosis and neurological features (e.g. pernicious anaemia).', 3, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000039';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-003900000000', 'a4000000-0000-4000-8000-000000000039', 'A', 'Vitamin B12 deficiency', true, 0),
  ('a5000000-0000-4000-8000-003900000001', 'a4000000-0000-4000-8000-000000000039', 'B', 'Iron deficiency only', false, 1),
  ('a5000000-0000-4000-8000-003900000002', 'a4000000-0000-4000-8000-000000000039', 'C', 'Thalassaemia trait only', false, 2),
  ('a5000000-0000-4000-8000-003900000003', 'a4000000-0000-4000-8000-000000000039', 'D', 'Acute blood loss yesterday only', false, 3),
  ('a5000000-0000-4000-8000-003900000004', 'a4000000-0000-4000-8000-000000000039', 'E', 'Polycythaemia vera', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000039', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q40
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ('a4000000-0000-4000-8000-000000000040', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'sba', 'A postoperative patient develops unilateral calf swelling and pain. What diagnosis must be considered?', 'SAMPLE/UNVERIFIED. Unilateral calf swelling/pain postoperatively raises concern for deep vein thrombosis.', 2, true, false, '{}'::jsonb) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000040';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004000000000', 'a4000000-0000-4000-8000-000000000040', 'A', 'Cellulitis always', false, 0),
  ('a5000000-0000-4000-8000-004000000001', 'a4000000-0000-4000-8000-000000000040', 'B', 'Baker''s cyst only', false, 1),
  ('a5000000-0000-4000-8000-004000000002', 'a4000000-0000-4000-8000-000000000040', 'C', 'Arterial ulcer', false, 2),
  ('a5000000-0000-4000-8000-004000000003', 'a4000000-0000-4000-8000-000000000040', 'D', 'Deep vein thrombosis', true, 3),
  ('a5000000-0000-4000-8000-004000000004', 'a4000000-0000-4000-8000-000000000040', 'E', 'Gout of the knee only', false, 4);
insert into public.question_tags (question_id, tag_id) values ('a4000000-0000-4000-8000-000000000040', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Q41 long-stem + patient-centred / UK practice (Stage f)
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000041',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000013',
  'sba',
  'A 67-year-old woman with COPD attends your UK GP surgery with her daughter. She has had three days of worsening dyspnoea, a productive cough with green sputum, and fever. She remains able to speak in full sentences, oxygen saturations are 94% on air (her usual baseline), and CURB-65 is 1. She is anxious about hospital admission after a difficult stay last year and asks whether she can be treated at home if safety-netted carefully. Her daughter is worried and wants a frank discussion of risks. You review NICE-style community pneumonia and COPD guidance and consider shared decision-making, capacity, and patient-centred priorities. Which next step best reflects UK ambulatory care and a patient-centred approach when clinically appropriate?',
  'SAMPLE/UNVERIFIED. For low-severity infection in a stable patient who prefers home care, shared decision-making with clear safety-netting and appropriate oral antibiotics (local guidance) aligns with UK ambulatory / patient-centred practice rather than default admission.',
  3,
  true,
  true,
  '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000041';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004100000000', 'a4000000-0000-4000-8000-000000000041', 'A', 'Admit immediately for IV antibiotics regardless of preference', false, 0),
  ('a5000000-0000-4000-8000-004100000001', 'a4000000-0000-4000-8000-000000000041', 'B', 'Agree a supervised home plan with oral antibiotics, safety-net advice, and early review', true, 1),
  ('a5000000-0000-4000-8000-004100000002', 'a4000000-0000-4000-8000-000000000041', 'C', 'Refuse to discuss options and insist on ED transfer only', false, 2),
  ('a5000000-0000-4000-8000-004100000003', 'a4000000-0000-4000-8000-000000000041', 'D', 'Start steroids alone and discharge without follow-up', false, 3),
  ('a5000000-0000-4000-8000-004100000004', 'a4000000-0000-4000-8000-000000000041', 'E', 'Refer for elective bronchoscopy before any treatment', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000041', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000041', 'a3000000-0000-4000-8000-000000000001'),
  ('a4000000-0000-4000-8000-000000000041', 'a3000000-0000-4000-8000-000000000003')
on conflict do nothing;

-- Tag a few existing UK-practice ethics-style items as patient-centred when present
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000036', 'a3000000-0000-4000-8000-000000000003'),
  ('a4000000-0000-4000-8000-000000000037', 'a3000000-0000-4000-8000-000000000003'),
  ('a4000000-0000-4000-8000-000000000038', 'a3000000-0000-4000-8000-000000000003')
on conflict do nothing;

-- ---------------------------------------------------------------------------
-- Amelia / admin bootstrap (run AFTER she creates her Auth user)
-- Replace the email with her real signup email. Do NOT put passwords here.
-- ---------------------------------------------------------------------------
-- Username auth maps User → {username}@plaboratory.app (Confirm email OFF in Supabase).
-- update public.profiles
-- set role = 'admin'
-- where display_name = 'amelia';
-- -- or: where email = 'amelia@plaboratory.app';

-- Optional student example (after Hlib signs up as user "hlib"):
-- update public.profiles set role = 'student' where display_name = 'hlib';


-- >>> BEGIN example SBA pack (Q42–Q51) + glossary
-- PLABoratory example SBA pack (Q42–Q51) + glossary terms
-- Exact stems/options/answers/explanations from Amelia screenshot transcription
-- (passmed-seed-content.md). SAMPLE/UNVERIFIED study seed; UK English.
-- Safe to re-run: fixed UUIDs with ON CONFLICT / delete+reinsert options.
--
-- Amelia (usual): paste THIS FILE alone in Supabase SQL → Run → hard-refresh the site.
-- Fresh project / missing tables: paste APPLY_ALL.sql once instead, then optionally this pack again.
-- Confirm: select count(*) from public.questions
--   where id between 'a4000000-0000-4000-8000-000000000042'
--     and 'a4000000-0000-4000-8000-000000000051';  -- expect 10

do $$
begin
  if to_regclass('public.exams') is null then
    raise exception 'Schema missing: public.exams not found. Paste supabase/APPLY_ALL.sql first (full file), then re-run seed_example_pack.sql.';
  end if;
end $$;

-- Prerequisites (idempotent): exam, settings, topics + tags this pack FKs
insert into public.exams (id, slug, name, description, is_active)
values (
  'a1000000-0000-4000-8000-000000000001',
  'plab1',
  'PLAB 1',
  'PLAB 1 single best answer study bank (PLABoratory).',
  true
)
on conflict (slug) do update
  set name = excluded.name,
      description = excluded.description,
      is_active = excluded.is_active,
      updated_at = now();

insert into public.exam_settings (exam_id, pass_mark_percent, default_mock_question_count, default_mock_minutes)
values ('a1000000-0000-4000-8000-000000000001', 65.00, 180, 180)
on conflict (exam_id) do update set pass_mark_percent = excluded.pass_mark_percent;

insert into public.topics (id, exam_id, slug, name, sort_order, is_active) values
  ('a2000000-0000-4000-8000-000000000004', 'a1000000-0000-4000-8000-000000000001', 'endocrine', 'Endocrinology', 40, true),
  ('a2000000-0000-4000-8000-000000000005', 'a1000000-0000-4000-8000-000000000001', 'renal', 'Renal', 50, true),
  ('a2000000-0000-4000-8000-000000000006', 'a1000000-0000-4000-8000-000000000001', 'neurology', 'Neurology', 60, true),
  ('a2000000-0000-4000-8000-000000000008', 'a1000000-0000-4000-8000-000000000001', 'obstetrics-gynaecology', 'Obstetrics & Gynaecology', 80, true),
  ('a2000000-0000-4000-8000-000000000010', 'a1000000-0000-4000-8000-000000000001', 'infectious-disease', 'Infectious Disease', 100, true)
on conflict (id) do update
  set slug = excluded.slug,
      name = excluded.name,
      sort_order = excluded.sort_order,
      is_active = true;

insert into public.tags (id, exam_id, slug, label, category) values
  ('a3000000-0000-4000-8000-000000000001', 'a1000000-0000-4000-8000-000000000001', 'uk-practice', 'UK practice', 'uk_practice'),
  ('a3000000-0000-4000-8000-000000000002', 'a1000000-0000-4000-8000-000000000001', 'sample-unverified', 'Sample / unverified', 'meta')
on conflict (id) do update
  set slug = excluded.slug,
      label = excluded.label,
      category = excluded.category;

-- Glossary terms matching this pack
insert into public.glossary_terms (exam_id, term, definition, aliases, section, is_active) values
  ('a1000000-0000-4000-8000-000000000001', 'statin', 'HMG-CoA reductase inhibitor used to lower LDL cholesterol. Contraindicated in pregnancy — stop before trying to conceive; switching dose or statin does not remove the contraindication. Ezetimibe is also not recommended in pregnancy. In familial hypercholesterolaemia pregnancy care focuses on non-pharmacological measures; bile acid sequestrants are specialist-only.', array['statins', 'atorvastatin', 'simvastatin'], 'Endocrine', true),
  ('a1000000-0000-4000-8000-000000000001', 'familial hypercholesterolaemia', 'Inherited disorder of high LDL cholesterol with premature cardiovascular risk; pregnancy needs specialist lipid advice and usually stopping teratogenic lipid drugs.', array['FH', 'familial hypercholesterolemia'], 'Endocrine', true),
  ('a1000000-0000-4000-8000-000000000001', 'ezetimibe', 'Cholesterol absorption inhibitor sometimes used with or instead of a statin; not recommended in pregnancy.', array[]::text[], 'Endocrine', true),
  ('a1000000-0000-4000-8000-000000000001', 'combined oral contraceptive', 'Oestrogen–progestogen pill (e.g. Microgynon 30). If started after day 5 of the cycle, it is not reliable until 7 consecutive days of correct use (FSRH).', array['COC', 'combined pill', 'Microgynon 30', 'combined oral contraceptive pill'], 'Obstetrics & Gynaecology', true),
  ('a1000000-0000-4000-8000-000000000001', 'FSRH quick-start contraception', 'Quick reference for when contraception becomes reliable: copper IUD immediate; progestogen-only pill 2 days; combined oral contraceptive / injection / implant / IUS typically 7 days when started outside the ideal cycle window.', array['contraception quick start', 'FSRH'], 'Obstetrics & Gynaecology', true),
  ('a1000000-0000-4000-8000-000000000001', 'tamsulosin', 'Selective alpha-1 blocker for lower urinary tract symptoms of benign prostatic hyperplasia. Alpha-1 antagonism causes vasodilation → dizziness and postural hypotension (BNF). Erectile dysfunction and reduced libido are more typical of finasteride.', array[]::text[], 'Renal', true),
  ('a1000000-0000-4000-8000-000000000001', 'BPH', 'Benign prostatic hyperplasia — non-malignant prostate enlargement causing LUTS.', array['benign prostatic hyperplasia', 'benign prostatic hypertrophy'], 'Renal', true),
  ('a1000000-0000-4000-8000-000000000001', 'gestational hypertension', 'New hypertension ≥140/90 mmHg after 20 weeks without significant proteinuria (or other features of pre-eclampsia).', array['pregnancy-induced hypertension'], 'Obstetrics & Gynaecology', true),
  ('a1000000-0000-4000-8000-000000000001', 'pre-eclampsia', 'Pregnancy-specific syndrome after 20 weeks with hypertension plus proteinuria and/or maternal organ dysfunction or uteroplacental dysfunction. Proteinuria helps distinguish from gestational hypertension.', array['preeclampsia', 'PET', 'mild pre-eclampsia', 'moderate pre-eclampsia'], 'Obstetrics & Gynaecology', true),
  ('a1000000-0000-4000-8000-000000000001', 'papilloedema', 'Optic disc swelling from raised intracranial pressure; nearly always bilateral. Early signs include venous engorgement and loss of venous pulsation, then blurred disc margin, elevation of the disc, loss of the cup, and Paton''s lines. Causes include space-occupying lesion, malignant hypertension, idiopathic intracranial hypertension, hydrocephalus, and hypercapnia; rare associations include hypoparathyroidism/hypocalcaemia and vitamin A toxicity.', array['papilledema', 'Paton''s lines', 'Patons lines'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'giardiasis', 'Infection with Giardia lamblia (Giardia duodenalis) causing prolonged watery non-bloody diarrhoea, anorexia, and bloating — often after travel. Duration and bloating favour Giardia over typical short travellers'' diarrhoea.', array['Giardia', 'Giardia lamblia', 'Giardia duodenalis'], 'Infectious Disease', true),
  ('a1000000-0000-4000-8000-000000000001', 'ALS', 'Amyotrophic lateral sclerosis — motor neurone disease with mixed upper and lower motor neurone signs (e.g. fasciculations/wasting with brisk reflexes elsewhere). Fasciculations point toward MND; sensation is typically spared.', array['amyotrophic lateral sclerosis'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'MND', 'Motor neurone disease — progressive degeneration of motor neurones (includes ALS). Progressive muscular atrophy is a predominantly LMN variant; ALS is mixed UMN+LMN.', array['motor neurone disease', 'motor neuron disease', 'progressive muscular atrophy'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'surgical antibiotic prophylaxis', 'Single timed perioperative antibiotic dose to reduce surgical-site infection for selected procedures (e.g. appendicectomy — clean-contaminated). NICE: usually single-dose prophylaxis. Clean procedures such as tonsillectomy, diagnostic colonoscopy, inguinal hernia repair, and tunnelled intravascular catheter insertion generally do not need routine prophylaxis.', array['antibiotic prophylaxis', 'perioperative antibiotic prophylaxis'], 'Infectious Disease', true),
  ('a1000000-0000-4000-8000-000000000001', 'Bell''s palsy', 'Acute idiopathic lower motor neurone facial nerve palsy. Forehead is affected (cannot raise eyebrow on the weak side). Upper motor neurone lesions typically spare the forehead.', array['Bells palsy', 'idiopathic facial palsy'], 'Neurology', true),
  ('a1000000-0000-4000-8000-000000000001', 'OGTT', 'Oral glucose tolerance test (WHO protocol). Type 2 diabetes diagnosis thresholds: fasting ≥7.0 mmol/L; random or 2-hour ≥11.1 mmol/L; asymptomatic patients need two abnormal occasions; HbA1c ≥48 mmol/mol (6.5%). Impaired fasting glucose and impaired glucose tolerance are intermediate categories when values fall between normal and diabetes cut-offs.', array['oral glucose tolerance test', 'glucose tolerance test', 'impaired fasting glucose', 'impaired glucose tolerance', 'IFG', 'IGT'], 'Endocrine', true)
on conflict (exam_id, term) do update
  set definition = excluded.definition,
      aliases = excluded.aliases,
      section = excluded.section,
      is_active = true,
      updated_at = now();

-- Q42 lipids / pregnancy
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000042',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000008',
  'sba',
  'A 33-year-old woman who is known to have familial hypercholesterolaemia comes for review. She is planning to have children and asks for advice regarding medication as she currently takes atorvastatin 80mg on. What is the most appropriate advice?',
  'SAMPLE/UNVERIFIED study seed from Amelia transcription. Statins are contraindicated in pregnancy — stop atorvastatin before trying to conceive. Switching dose or to another statin does not remove the contraindication; ezetimibe is also not recommended. In FH pregnancy, focus on non-pharmacological measures; bile acid sequestrants are specialist-only.',
  3, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000042';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004200000000', 'a4000000-0000-4000-8000-000000000042', 'A', 'Switch to atorvastatin 10mg', false, 0),
  ('a5000000-0000-4000-8000-004200000001', 'a4000000-0000-4000-8000-000000000042', 'B', 'Continue current drug at same dose', false, 1),
  ('a5000000-0000-4000-8000-004200000002', 'a4000000-0000-4000-8000-000000000042', 'C', 'Stop atorvastatin before trying to conceive', true, 2),
  ('a5000000-0000-4000-8000-004200000003', 'a4000000-0000-4000-8000-000000000042', 'D', 'Switch to ezetimibe', false, 3),
  ('a5000000-0000-4000-8000-004200000004', 'a4000000-0000-4000-8000-000000000042', 'E', 'Switch to simvastatin 40mg', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000042', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000042', 'a3000000-0000-4000-8000-000000000001')
on conflict do nothing;

-- Q43 contraception / COC quick start
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000043',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000008',
  'sba',
  'A 19-year-old female starts Microgynon 30 (combined oral contraceptive pill) on day 8 of her cycle. How long will it take before it can be relied upon as a method of contraception?',
  'SAMPLE/UNVERIFIED study seed from Amelia transcription. FSRH: if the combined oral contraceptive is started after day 5 of the cycle, it takes 7 days before it can be relied upon. Quick-start tip: copper IUD immediate; POP 2 days; COC/injection/implant/IUS typically 7 days.',
  2, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000043';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004300000000', 'a4000000-0000-4000-8000-000000000043', 'A', 'Immediately', false, 0),
  ('a5000000-0000-4000-8000-004300000001', 'a4000000-0000-4000-8000-000000000043', 'B', '2 days', false, 1),
  ('a5000000-0000-4000-8000-004300000002', 'a4000000-0000-4000-8000-000000000043', 'C', '5 days', false, 2),
  ('a5000000-0000-4000-8000-004300000003', 'a4000000-0000-4000-8000-000000000043', 'D', '7 days', true, 3),
  ('a5000000-0000-4000-8000-004300000004', 'a4000000-0000-4000-8000-000000000043', 'E', 'Until first day of next period', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000043', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000043', 'a3000000-0000-4000-8000-000000000001')
on conflict do nothing;

-- Q44 tamsulosin side-effects
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000044',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000005',
  'sba',
  'A 69-year-old man is started on tamsulosin for benign prostatic hyperplasia. Which one of the following best describes the side-effects he may experience?',
  'SAMPLE/UNVERIFIED study seed from Amelia transcription. Tamsulosin is an alpha-1 antagonist → vasodilation → dizziness and postural hypotension (BNF). Erectile dysfunction and reduced libido are more typical of finasteride.',
  2, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000044';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004400000000', 'a4000000-0000-4000-8000-000000000044', 'A', 'Urgency and insomnia', false, 0),
  ('a5000000-0000-4000-8000-004400000001', 'a4000000-0000-4000-8000-000000000044', 'B', 'Dizziness and postural hypotension', true, 1),
  ('a5000000-0000-4000-8000-004400000002', 'a4000000-0000-4000-8000-000000000044', 'C', 'Urinary retention and nausea', false, 2),
  ('a5000000-0000-4000-8000-004400000003', 'a4000000-0000-4000-8000-000000000044', 'D', 'Urgency and erectile dysfunction', false, 3),
  ('a5000000-0000-4000-8000-004400000004', 'a4000000-0000-4000-8000-000000000044', 'E', 'Erectile dysfunction and reduced libido', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000044', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000044', 'a3000000-0000-4000-8000-000000000001')
on conflict do nothing;

-- Q45 gestational hypertension
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000045',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000008',
  'sba',
  'A 37-year-old woman presents for review. She is 26 weeks pregnant. Her blood pressure is 144/92 mmHg; booking blood pressure was 110/80 mmHg. Urine dipstick is negative for protein, leucocytes and blood. What is the most appropriate description of her blood pressure?',
  'SAMPLE/UNVERIFIED study seed from Amelia transcription. New hypertension ≥140/90 mmHg after 20 weeks without proteinuria is gestational hypertension (not pre-eclampsia, and not pre-existing hypertension from booking).',
  2, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000045';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004500000000', 'a4000000-0000-4000-8000-000000000045', 'A', 'Moderate pre-eclampsia', false, 0),
  ('a5000000-0000-4000-8000-004500000001', 'a4000000-0000-4000-8000-000000000045', 'B', 'Mild pre-eclampsia', false, 1),
  ('a5000000-0000-4000-8000-004500000002', 'a4000000-0000-4000-8000-000000000045', 'C', 'Gestational hypertension', true, 2),
  ('a5000000-0000-4000-8000-004500000003', 'a4000000-0000-4000-8000-000000000045', 'D', 'Normal physiological change', false, 3),
  ('a5000000-0000-4000-8000-004500000004', 'a4000000-0000-4000-8000-000000000045', 'E', 'Pre-existing hypertension', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000045', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000045', 'a3000000-0000-4000-8000-000000000001')
on conflict do nothing;

-- Q46 papilloedema
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000046',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000006',
  'sba',
  'Whilst examining a patient the following is found on fundoscopy: swollen optic disc with blurred margins (papilloedema appearance). What is this finding most suggestive of?',
  'SAMPLE/UNVERIFIED study seed from Amelia transcription. The fundoscopic appearance is papilloedema (optic disc swelling from raised intracranial pressure). It is nearly always bilateral. Early signs include venous engorgement and loss of venous pulsation, then blurred margin, disc elevation, loss of cup, and Paton''s lines.',
  2, true, false, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000046';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004600000000', 'a4000000-0000-4000-8000-000000000046', 'A', 'Central retinal artery occlusion', false, 0),
  ('a5000000-0000-4000-8000-004600000001', 'a4000000-0000-4000-8000-000000000046', 'B', 'Normal fundus', false, 1),
  ('a5000000-0000-4000-8000-004600000002', 'a4000000-0000-4000-8000-000000000046', 'C', 'Papilloedema', true, 2),
  ('a5000000-0000-4000-8000-004600000003', 'a4000000-0000-4000-8000-000000000046', 'D', 'Untreated glaucoma', false, 3),
  ('a5000000-0000-4000-8000-004600000004', 'a4000000-0000-4000-8000-000000000046', 'E', 'Optic atrophy', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000046', 'a3000000-0000-4000-8000-000000000002')
on conflict do nothing;

-- Q47 Giardia
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000047',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000010',
  'sba',
  'A 55-year-old business man presents with a 15-day history of watery non-bloody diarrhoea, anorexia and bloating. Symptoms started 4 days after return from Pakistan. He is apyrexial with dry mucous membranes and normal skin turgor. What is the most likely causative organism?',
  'SAMPLE/UNVERIFIED study seed from Amelia transcription. Prolonged watery diarrhoea with bloating after travel points to Giardia lamblia, even though Escherichia coli is a common cause of shorter travellers'' diarrhoea.',
  2, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000047';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004700000000', 'a4000000-0000-4000-8000-000000000047', 'A', 'Salmonella', false, 0),
  ('a5000000-0000-4000-8000-004700000001', 'a4000000-0000-4000-8000-000000000047', 'B', 'Giardia lamblia', true, 1),
  ('a5000000-0000-4000-8000-004700000002', 'a4000000-0000-4000-8000-000000000047', 'C', 'Shigella', false, 2),
  ('a5000000-0000-4000-8000-004700000003', 'a4000000-0000-4000-8000-000000000047', 'D', 'Escherichia coli', false, 3),
  ('a5000000-0000-4000-8000-004700000004', 'a4000000-0000-4000-8000-000000000047', 'E', 'Norovirus', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000047', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000047', 'a3000000-0000-4000-8000-000000000001')
on conflict do nothing;

-- Q48 ALS
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000048',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000006',
  'sba',
  'A 64-year-old man presents with an eight-month history of generalised weakness. Examination shows fasciculation and weakness in both arms with absent reflexes; in the lower limbs there is increased tone and exaggerated reflexes. Sensation is normal and there are no cerebellar signs. What is the most likely diagnosis?',
  'SAMPLE/UNVERIFIED study seed from Amelia transcription. Fasciculations point toward motor neurone disease. Mixed lower motor neurone signs in the arms and upper motor neurone signs in the legs with preserved sensation is amyotrophic lateral sclerosis (ALS). Progressive muscular atrophy is a predominantly LMN variant.',
  3, true, false, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000048';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004800000000', 'a4000000-0000-4000-8000-000000000048', 'A', 'Progressive muscular atrophy', false, 0),
  ('a5000000-0000-4000-8000-004800000001', 'a4000000-0000-4000-8000-000000000048', 'B', 'Amyotrophic lateral sclerosis', true, 1),
  ('a5000000-0000-4000-8000-004800000002', 'a4000000-0000-4000-8000-000000000048', 'C', 'Vitamin B12 deficiency', false, 2),
  ('a5000000-0000-4000-8000-004800000003', 'a4000000-0000-4000-8000-000000000048', 'D', 'Syringomyelia', false, 3),
  ('a5000000-0000-4000-8000-004800000004', 'a4000000-0000-4000-8000-000000000048', 'E', 'Multiple sclerosis', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000048', 'a3000000-0000-4000-8000-000000000002')
on conflict do nothing;

-- Q49 surgical prophylaxis
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000049',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000010',
  'sba',
  'You are a Foundation Year 1 doctor on a surgical rotation. Which one of the following procedures require prophylactic antibiotics?',
  'SAMPLE/UNVERIFIED study seed from Amelia transcription. Appendicectomy is clean-contaminated and NICE supports single-dose surgical antibiotic prophylaxis. Tonsillectomy, diagnostic colonoscopy, inguinal hernia repair, and tunnelled intravascular catheter insertion are generally clean / do not need routine prophylaxis.',
  3, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000049';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-004900000000', 'a4000000-0000-4000-8000-000000000049', 'A', 'Tonsillectomy', false, 0),
  ('a5000000-0000-4000-8000-004900000001', 'a4000000-0000-4000-8000-000000000049', 'B', 'Diagnostic colonoscopy', false, 1),
  ('a5000000-0000-4000-8000-004900000002', 'a4000000-0000-4000-8000-000000000049', 'C', 'Appendicectomy', true, 2),
  ('a5000000-0000-4000-8000-004900000003', 'a4000000-0000-4000-8000-000000000049', 'D', 'Inguinal hernia repair', false, 3),
  ('a5000000-0000-4000-8000-004900000004', 'a4000000-0000-4000-8000-000000000049', 'E', 'Intravascular catheter insertion (tunnelled)', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000049', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000049', 'a3000000-0000-4000-8000-000000000001')
on conflict do nothing;

-- Q50 Bell's palsy
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000050',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000006',
  'sba',
  'A 25-year-old man presents with a 2-day history of left ear pain followed by facial paralysis. The left side of his mouth droops and he cannot close his left eye. Bell''s palsy is suspected. If he is asked to raise his left eyebrow, what finding is expected and why?',
  'SAMPLE/UNVERIFIED study seed from Amelia transcription. Bell''s palsy is a lower motor neurone facial nerve lesion, so the forehead is affected — inability to raise the left eyebrow. Upper motor neurone lesions typically spare the forehead.',
  2, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000050';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-005000000000', 'a4000000-0000-4000-8000-000000000050', 'A', 'Ability to raise left eyebrow as Bell''s palsy only affects below the eyebrow', false, 0),
  ('a5000000-0000-4000-8000-005000000001', 'a4000000-0000-4000-8000-000000000050', 'B', 'Inability to raise left eyebrow because this is an upper motor neurone lesion', false, 1),
  ('a5000000-0000-4000-8000-005000000002', 'a4000000-0000-4000-8000-000000000050', 'C', 'Inability to raise left eyebrow because this is a lower motor neurone lesion', true, 2),
  ('a5000000-0000-4000-8000-005000000003', 'a4000000-0000-4000-8000-000000000050', 'D', 'Ability to raise left eyebrow as Bell''s palsy does not affect the facial nerve', false, 3),
  ('a5000000-0000-4000-8000-005000000004', 'a4000000-0000-4000-8000-000000000050', 'E', 'Ability to raise left eyebrow as frontalis is not affected', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000050', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000050', 'a3000000-0000-4000-8000-000000000001')
on conflict do nothing;

-- Q51 OGTT
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values (
  'a4000000-0000-4000-8000-000000000051',
  'a1000000-0000-4000-8000-000000000001',
  'a2000000-0000-4000-8000-000000000004',
  'sba',
  'A 46-year-old man has an oral glucose tolerance test using the WHO protocol. Results: 0 hour 5.7 mmol/l; 2 hour 7.6 mmol/l. How should these results be interpreted?',
  'SAMPLE/UNVERIFIED study seed from Amelia transcription. Both fasting and 2-hour values are within normal limits, so the OGTT is normal. Diabetes thresholds: fasting ≥7.0 mmol/L; random/2-hour ≥11.1 mmol/L; asymptomatic patients need two abnormal occasions; HbA1c ≥48 mmol/mol (6.5%).',
  2, true, true, '{}'::jsonb
) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, difficulty = excluded.difficulty, is_uk_practice = excluded.is_uk_practice, updated_at = now();
delete from public.question_options where question_id = 'a4000000-0000-4000-8000-000000000051';
insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values
  ('a5000000-0000-4000-8000-005100000000', 'a4000000-0000-4000-8000-000000000051', 'A', 'Normal', true, 0),
  ('a5000000-0000-4000-8000-005100000001', 'a4000000-0000-4000-8000-000000000051', 'B', 'Impaired fasting glucose and impaired glucose tolerance', false, 1),
  ('a5000000-0000-4000-8000-005100000002', 'a4000000-0000-4000-8000-000000000051', 'C', 'Diabetes mellitus', false, 2),
  ('a5000000-0000-4000-8000-005100000003', 'a4000000-0000-4000-8000-000000000051', 'D', 'Impaired glucose tolerance', false, 3),
  ('a5000000-0000-4000-8000-005100000004', 'a4000000-0000-4000-8000-000000000051', 'E', 'Impaired fasting glucose', false, 4);
insert into public.question_tags (question_id, tag_id) values
  ('a4000000-0000-4000-8000-000000000051', 'a3000000-0000-4000-8000-000000000002'),
  ('a4000000-0000-4000-8000-000000000051', 'a3000000-0000-4000-8000-000000000001')
on conflict do nothing;

-- Verify pack loaded (expect example_pack_questions = 10, example_pack_options = 50)
select
  (select count(*) from public.questions
    where id between 'a4000000-0000-4000-8000-000000000042'
      and 'a4000000-0000-4000-8000-000000000051') as example_pack_questions,
  (select count(*) from public.question_options
    where question_id between 'a4000000-0000-4000-8000-000000000042'
      and 'a4000000-0000-4000-8000-000000000051') as example_pack_options;

-- >>> BEGIN flashcards
-- Optional Stage b flashcard seed (original SAMPLE/UNVERIFIED). Run after main seed.sql
-- Safe to re-run: fixed UUIDs with ON CONFLICT.

-- Flashcard 1
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, payload, difficulty, is_active, is_uk_practice) values ('a6000000-0000-4000-8000-000000000001', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000001', 'flashcard', 'Inferior STEMI vessel?', 'SAMPLE/UNVERIFIED flashcard scaffold for Stage b spaced repetition / flashcard sessions.', '{"front": "STEMI — inferior leads\n\nInferior STEMI vessel?", "back": "ST elevation in II, III, aVF typically reflects right coronary artery occlusion (less often circumflex)."}'::jsonb, 2, true, false) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, payload = excluded.payload, question_type = 'flashcard', updated_at = now();
insert into public.question_tags (question_id, tag_id) values ('a6000000-0000-4000-8000-000000000001', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Flashcard 2
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, payload, difficulty, is_active, is_uk_practice) values ('a6000000-0000-4000-8000-000000000002', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000002', 'flashcard', 'What does CURB-65 stand for?', 'SAMPLE/UNVERIFIED flashcard scaffold for Stage b spaced repetition / flashcard sessions.', '{"front": "CURB-65 components\n\nWhat does CURB-65 stand for?", "back": "Confusion, Urea, Respiratory rate, Blood pressure, age ≥65 — CAP severity score."}'::jsonb, 2, true, false) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, payload = excluded.payload, question_type = 'flashcard', updated_at = now();
insert into public.question_tags (question_id, tag_id) values ('a6000000-0000-4000-8000-000000000002', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Flashcard 3
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, payload, difficulty, is_active, is_uk_practice) values ('a6000000-0000-4000-8000-000000000003', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000004', 'flashcard', 'Usual first-line oral drug in type 2 diabetes?', 'SAMPLE/UNVERIFIED flashcard scaffold for Stage b spaced repetition / flashcard sessions.', '{"front": "First-line T2DM oral (typical UK)\n\nUsual first-line oral drug in type 2 diabetes?", "back": "Metformin when lifestyle measures are insufficient and eGFR allows."}'::jsonb, 2, true, false) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, payload = excluded.payload, question_type = 'flashcard', updated_at = now();
insert into public.question_tags (question_id, tag_id) values ('a6000000-0000-4000-8000-000000000003', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Flashcard 4
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, payload, difficulty, is_active, is_uk_practice) values ('a6000000-0000-4000-8000-000000000004', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000006', 'flashcard', 'Most important diagnosis to exclude in thunderclap headache?', 'SAMPLE/UNVERIFIED flashcard scaffold for Stage b spaced repetition / flashcard sessions.', '{"front": "Thunderclap headache — exclude first\n\nMost important diagnosis to exclude in thunderclap headache?", "back": "Subarachnoid haemorrhage until proven otherwise."}'::jsonb, 2, true, false) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, payload = excluded.payload, question_type = 'flashcard', updated_at = now();
insert into public.question_tags (question_id, tag_id) values ('a6000000-0000-4000-8000-000000000004', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Flashcard 5
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, payload, difficulty, is_active, is_uk_practice) values ('a6000000-0000-4000-8000-000000000005', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000013', 'flashcard', 'Core elements of valid consent?', 'SAMPLE/UNVERIFIED flashcard scaffold for Stage b spaced repetition / flashcard sessions.', '{"front": "Valid consent elements (UK)\n\nCore elements of valid consent?", "back": "Capacity, adequate information (benefits/risks/alternatives), and voluntariness."}'::jsonb, 2, true, true) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, payload = excluded.payload, question_type = 'flashcard', updated_at = now();
insert into public.question_tags (question_id, tag_id) values ('a6000000-0000-4000-8000-000000000005', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Flashcard 6
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, payload, difficulty, is_active, is_uk_practice) values ('a6000000-0000-4000-8000-000000000006', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000014', 'flashcard', 'Anaemia + neuro symptoms — which vitamin?', 'SAMPLE/UNVERIFIED flashcard scaffold for Stage b spaced repetition / flashcard sessions.', '{"front": "B12 deficiency clue\n\nAnaemia + neuro symptoms — which vitamin?", "back": "Macrocytic anaemia ± neurological pins and needles; consider pernicious anaemia."}'::jsonb, 2, true, false) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, payload = excluded.payload, question_type = 'flashcard', updated_at = now();
insert into public.question_tags (question_id, tag_id) values ('a6000000-0000-4000-8000-000000000006', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Flashcard 7
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, payload, difficulty, is_active, is_uk_practice) values ('a6000000-0000-4000-8000-000000000007', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000010', 'flashcard', 'Organism after antibiotics + watery diarrhoea?', 'SAMPLE/UNVERIFIED flashcard scaffold for Stage b spaced repetition / flashcard sessions.', '{"front": "Antibiotic-associated watery diarrhoea\n\nOrganism after antibiotics + watery diarrhoea?", "back": "Clostridioides difficile is an important cause after broad-spectrum antibiotics."}'::jsonb, 2, true, false) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, payload = excluded.payload, question_type = 'flashcard', updated_at = now();
insert into public.question_tags (question_id, tag_id) values ('a6000000-0000-4000-8000-000000000007', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- Flashcard 8
insert into public.questions (id, exam_id, topic_id, question_type, stem, explanation, payload, difficulty, is_active, is_uk_practice) values ('a6000000-0000-4000-8000-000000000008', 'a1000000-0000-4000-8000-000000000001', 'a2000000-0000-4000-8000-000000000009', 'flashcard', 'Likely diagnosis for barky cough and stridor at night?', 'SAMPLE/UNVERIFIED flashcard scaffold for Stage b spaced repetition / flashcard sessions.', '{"front": "Barking cough + stridor in toddler\n\nLikely diagnosis for barky cough and stridor at night?", "back": "Croup (viral laryngotracheitis) is the common pattern when the child is otherwise relatively well."}'::jsonb, 2, true, false) on conflict (id) do update set stem = excluded.stem, explanation = excluded.explanation, payload = excluded.payload, question_type = 'flashcard', updated_at = now();
insert into public.question_tags (question_id, tag_id) values ('a6000000-0000-4000-8000-000000000008', 'a3000000-0000-4000-8000-000000000002') on conflict do nothing;

-- >>> Verify
select slug, name from public.exams;
select count(*) as topic_count from public.topics;
select count(*) as question_count from public.questions;
select count(*) as glossary_count from public.glossary_terms;
select pass_mark_percent from public.exam_settings;

-- Next (after Amelia creates her account): run supabase/PROMOTE_AMELIA.sql
