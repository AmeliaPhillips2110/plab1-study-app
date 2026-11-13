-- Optional: attach a few NICE / BNF guideline refs to sample questions.
-- Safe to re-run. Does not require a schema migration (uses questions.payload jsonb).
-- Run in Supabase SQL editor after seed.sql if explanations should show clickable refs.

-- ACS / STEMI teaching item → NICE NG185 Acute coronary syndromes
update public.questions
set
  explanation = coalesce(explanation, '') ||
    case
      when explanation ilike '%NICE NG185%' then ''
      else E'\n\nSee NICE NG185 for acute coronary syndromes pathways (SAMPLE/UNVERIFIED teaching link).'
    end,
  payload = coalesce(payload, '{}'::jsonb) || jsonb_build_object(
    'guidelines', jsonb_build_array(
      jsonb_build_object(
        'label', 'NICE NG185',
        'url', 'https://www.nice.org.uk/guidance/ng185'
      )
    )
  ),
  updated_at = now()
where id = 'a4000000-0000-4000-8000-000000000001';

-- Heart failure / loop diuretic → NICE NG106 + BNF
update public.questions
set
  explanation = coalesce(explanation, '') ||
    case
      when explanation ilike '%NICE NG106%' then ''
      else E'\n\nSee NICE NG106 (chronic heart failure) and BNF loop diuretics (SAMPLE/UNVERIFIED).'
    end,
  payload = coalesce(payload, '{}'::jsonb) || jsonb_build_object(
    'guidelines', jsonb_build_array(
      jsonb_build_object(
        'label', 'NICE NG106',
        'url', 'https://www.nice.org.uk/guidance/ng106'
      ),
      jsonb_build_object(
        'label', 'BNF',
        'url', 'https://bnf.nice.org.uk/'
      )
    )
  ),
  updated_at = now()
where id = 'a4000000-0000-4000-8000-000000000002';

-- Type 2 diabetes first-line → NICE NG28
update public.questions
set
  explanation = coalesce(explanation, '') ||
    case
      when explanation ilike '%NICE NG28%' then ''
      else E'\n\nSee NICE NG28 for type 2 diabetes in adults (SAMPLE/UNVERIFIED teaching link).'
    end,
  payload = coalesce(payload, '{}'::jsonb) || jsonb_build_object(
    'guidelines', jsonb_build_array(
      jsonb_build_object(
        'label', 'NICE NG28',
        'url', 'https://www.nice.org.uk/guidance/ng28'
      )
    )
  ),
  updated_at = now()
where id = 'a4000000-0000-4000-8000-000000000012';

-- Asthma acute → NICE NG80 (asthma) mention in explanation for auto-link fallback
update public.questions
set
  explanation = coalesce(explanation, '') ||
    case
      when explanation ilike '%NICE NG80%' then ''
      else E'\n\nSee NICE NG80 asthma guidance for stepped care context (SAMPLE/UNVERIFIED).'
    end,
  payload = coalesce(payload, '{}'::jsonb) || jsonb_build_object(
    'guidelines', jsonb_build_array(
      jsonb_build_object(
        'label', 'NICE NG80',
        'url', 'https://www.nice.org.uk/guidance/ng80'
      )
    )
  ),
  updated_at = now()
where id = 'a4000000-0000-4000-8000-000000000004';
