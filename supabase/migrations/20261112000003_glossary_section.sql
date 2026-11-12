-- Additive: glossary section for grouping (safe if column already exists)
alter table public.glossary_terms
  add column if not exists section text not null default 'General';

create index if not exists glossary_terms_exam_section_idx
  on public.glossary_terms (exam_id, section);
