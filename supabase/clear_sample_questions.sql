-- =============================================================================
-- Remove previous SAMPLE / example SBA (+ seeded flashcards with fixed IDs)
-- Paste in Supabase SQL editor AFTER schema exists. Safe to re-run.
-- Cascades: question_options, question_tags, attempts, SR state, etc.
-- Keeps: exams, topics, tags, glossary, profiles, settings.
-- =============================================================================

-- Preview counts (optional — comment out if you only want the delete)
select
  (select count(*) from public.questions q
    where q.exam_id = 'a1000000-0000-4000-8000-000000000001'
      and (
        q.id::text like 'a4000000-%'
        or q.explanation ilike 'SAMPLE/%'
        or exists (
          select 1 from public.question_tags qt
          where qt.question_id = q.id
            and qt.tag_id = 'a3000000-0000-4000-8000-000000000002'
        )
        or coalesce(q.payload->>'source', '') in ('sample', 'seed', 'example-pack')
      )
  ) as sample_questions_to_delete;

delete from public.questions q
where q.exam_id = 'a1000000-0000-4000-8000-000000000001'
  and (
    q.id::text like 'a4000000-%'
    or q.explanation ilike 'SAMPLE/%'
    or exists (
      select 1 from public.question_tags qt
      where qt.question_id = q.id
        and qt.tag_id = 'a3000000-0000-4000-8000-000000000002'
    )
    or coalesce(q.payload->>'source', '') in ('sample', 'seed', 'example-pack')
  );

-- Confirm remaining bank
select question_type, count(*) as n
from public.questions
where exam_id = 'a1000000-0000-4000-8000-000000000001'
  and is_active = true
group by question_type
order by question_type;
