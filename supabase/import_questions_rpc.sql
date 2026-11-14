-- Amelia: paste this entire file in Supabase SQL editor once (before first in-app Excel import).
-- Admin-only batched question bank import (used by in-app Excel import).
-- Safe to re-run.

create or replace function public.import_questions(
  p_exam_id uuid,
  p_items jsonb default '[]'::jsonb,
  p_new_topics jsonb default '[]'::jsonb
)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  v_uid uuid := auth.uid();
  v_inserted int := 0;
  v_updated int := 0;
  v_options int := 0;
  v_topics_created int := 0;
  item jsonb;
  topic jsonb;
  qid uuid;
  existed boolean;
  opts jsonb;
  opt jsonb;
begin
  if v_uid is null or not public.is_admin() then
    raise exception 'Only admins can import questions';
  end if;

  if not exists (select 1 from public.exams where id = p_exam_id) then
    raise exception 'Exam not found';
  end if;

  for topic in
    select value from jsonb_array_elements(coalesce(p_new_topics, '[]'::jsonb)) as t(value)
  loop
    insert into public.topics (id, exam_id, slug, name, sort_order, is_active)
    values (
      coalesce(nullif(topic->>'id', '')::uuid, gen_random_uuid()),
      p_exam_id,
      topic->>'slug',
      coalesce(nullif(topic->>'name', ''), topic->>'slug'),
      coalesce(nullif(topic->>'sort_order', '')::int, 999),
      true
    )
    on conflict (exam_id, slug) do update
      set name = excluded.name,
          is_active = true;

    v_topics_created := v_topics_created + 1;
  end loop;

  for item in
    select value from jsonb_array_elements(coalesce(p_items, '[]'::jsonb)) as t(value)
  loop
    qid := (item->>'id')::uuid;
    select exists(select 1 from public.questions where id = qid) into existed;

    insert into public.questions (
      id,
      exam_id,
      topic_id,
      question_type,
      stem,
      explanation,
      difficulty,
      is_active,
      is_uk_practice,
      payload,
      created_by,
      updated_by,
      updated_at
    ) values (
      qid,
      p_exam_id,
      nullif(item->>'topic_id', '')::uuid,
      coalesce(nullif(item->>'question_type', ''), 'sba')::public.question_type,
      item->>'stem',
      nullif(item->>'explanation', ''),
      nullif(item->>'difficulty', '')::smallint,
      coalesce((item->>'is_active')::boolean, true),
      coalesce((item->>'is_uk_practice')::boolean, false),
      coalesce(item->'payload', '{}'::jsonb),
      v_uid,
      v_uid,
      now()
    )
    on conflict (id) do update set
      exam_id = excluded.exam_id,
      topic_id = excluded.topic_id,
      stem = excluded.stem,
      explanation = excluded.explanation,
      is_uk_practice = excluded.is_uk_practice,
      payload = excluded.payload,
      is_active = true,
      updated_by = v_uid,
      updated_at = now();

    if existed then
      v_updated := v_updated + 1;
    else
      v_inserted := v_inserted + 1;
    end if;

    delete from public.question_options where question_id = qid;

    opts := coalesce(item->'options', '[]'::jsonb);
    for opt in select value from jsonb_array_elements(opts) as o(value)
    loop
      insert into public.question_options (id, question_id, label, body, is_correct, sort_order)
      values (
        coalesce(nullif(opt->>'id', '')::uuid, gen_random_uuid()),
        qid,
        opt->>'label',
        opt->>'body',
        coalesce((opt->>'is_correct')::boolean, false),
        coalesce(nullif(opt->>'sort_order', '')::int, 0)
      )
      on conflict (question_id, label) do update set
        body = excluded.body,
        is_correct = excluded.is_correct,
        sort_order = excluded.sort_order;

      v_options := v_options + 1;
    end loop;
  end loop;

  return jsonb_build_object(
    'inserted', v_inserted,
    'updated', v_updated,
    'options', v_options,
    'topics_created', v_topics_created
  );
end;
$$;

revoke all on function public.import_questions(uuid, jsonb, jsonb) from public;
grant execute on function public.import_questions(uuid, jsonb, jsonb) to authenticated;
