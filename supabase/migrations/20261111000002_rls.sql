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
