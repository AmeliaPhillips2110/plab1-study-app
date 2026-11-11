# PLABoratory architecture

How the app is structured, and how to add a **new exam module** (for example PLAB 2) without forking the quiz engine.

English only in product copy, seeds, and shipped docs.

## Stack

| Layer | Choice |
| --- | --- |
| SPA | Vite + React 19 + TypeScript + Tailwind |
| Routing | `react-router-dom` with `BrowserRouter` `basename` from Vite `base` / `VITE_BASE` |
| Data | Supabase Auth + Postgres (RLS). Frontend uses the **anon** key only |
| Hosting | GitHub Pages (static `dist/`) — see SETUP.md §7 |
| Charts | Recharts (shared analytics) |

## High-level layout

```text
src/
  modules/
    plab1/                 # exam-specific shell (slug, home copy, intro pages)
    shared/
      quiz-engine/         # sessions, SBA/flashcard/mock runners — exam-agnostic
      analytics/           # KPIs, attempt log, comparison
      admin/               # question editor, settings, users UI
  features/                # auth, glossary, mistakes, preferences, tags
  routes/                  # URL → page wiring
  hooks/                   # useAuth, useExam, useTheme
  lib/                     # supabase client, exam helpers
  types/                   # database + quiz types
```

Content (topics, questions, glossary, tags, settings) lives in Supabase and is keyed by **`exam_id`**. The PLAB 1 module only supplies the default **slug** (`plab1`) and product naming — not the topic list.

## Boundaries

**Do put exam-specific UI / copy in `modules/<exam>/`.**  
Home headlines, mock intro wording, exam display name, default slug.

**Do keep runners, scoring, attempt persistence, KPI maths, and admin CRUD in `modules/shared/`.**  
They already take `examId` (and sometimes `userId`) as props or config.

**Do not hard-code topic names or question IDs in TypeScript.**  
Load topics / questions with `useExam(slug)` or Supabase queries filtered by `exam_id`.

**Do not put Ukrainian (or any non-English) strings in the app.**

## Data model (exam plug-in)

One Supabase project holds every exam:

1. Insert a row in `exams` (`slug`, `name`, …).
2. Insert `exam_settings` for that `exam_id` (pass mark, mock defaults).
3. Insert `topics`, `tags`, `questions` / `question_options`, `glossary_terms`, `question_tags` for that exam.
4. Students’ `study_sessions`, `attempts`, `spaced_repetition_state`, and preferences stay per-user and already store `exam_id` where needed.

RLS policies are exam-agnostic (role + ownership). New exams do not need new policies if they use the same tables.

## How to add a new exam module (checklist)

Example: **PLAB 2** → module `plab2`, slug `plab2`.

### 1. Database

- Seed `exams` + `exam_settings` + topics/questions/glossary for `plab2`.
- Prefer fixed UUIDs in seed SQL (same pattern as `supabase/seed.sql`) so re-runs are idempotent.

### 2. Module folder

```text
src/modules/plab2/
  config.ts          # PLAB2_SLUG = 'plab2', PLAB2_NAME = 'PLAB 2'
  index.ts           # re-export config (+ pages)
  pages/
    HomePage.tsx     # thin wrapper or exam-specific home copy
    MockIntroPage.tsx
```

Copy from `modules/plab1/` and replace slug/name strings only. Reuse shared runners via props — do not duplicate `SessionRunner` / `MockRunner`.

### 3. Wire routing

In `src/routes/index.tsx` (or a future `exam.$examSlug` layout):

- Add routes that render the new home / study / mock pages, **or**
- Keep a single set of shared pages and pass `slug` from the URL into `useExam(slug)`.

Today the app defaults to PLAB 1 via `useExam()` / `PLAB1_SLUG`. The smallest PLAB 2 step is:

1. `useExam('plab2')` on a dedicated route prefix (e.g. `/plab2/...`), and  
2. A switcher on the study home that sets the active exam slug (local state or URL).

### 4. Shared features

These already take `examId` — no fork required once the exam row exists:

- Quiz `SessionSetup` / `selectQuestionsForSession`
- Mocks
- Glossary (`fetchGlossaryTerms(examId)`)
- KPI dashboard / attempt log / admin question list

Admin “default exam” helpers (`fetchDefaultExam`) may need a slug argument or a chooser when multiple exams are active.

### 5. Copy and QA

- Confirm English-only strings.
- Smoke-test quiz + mock + glossary + one KPI chart against the new `exam_id`.
- Keep sample items marked SAMPLE/UNVERIFIED until medically reviewed.

## Deploy base path

GitHub **project** Pages serves under `https://<user>.github.io/<repo>/`.

Vite `base` must match that path:

```bash
VITE_BASE=/plab1-study-app/
```

`BrowserRouter` already uses `import.meta.env.BASE_URL` as `basename`. Local `npm run dev` keeps `base: '/'` when `VITE_BASE` is unset.

See **SETUP.md §7** for Actions secrets, enabling Pages, and the SPA `404.html` fallback.

## What not to reinvent

| Need | Use |
| --- | --- |
| New presentation format | Extend shared quiz-engine formats + `SessionSetup` |
| New KPI | Add a chart under `modules/shared/analytics/` |
| New mistake tag | Extend `features/mistakes/tags.ts` (codes are free-text in DB) |
| New exam | New `modules/<exam>/` + DB seed — not a second Vite app |

## Related docs

- Product brief / stage status: agent store `docs/plab-1-study-app-build-brief.md`
- Schema & tokens: agent store `docs/stage-0-schema-structure-tokens.md`
- Operator setup: [SETUP.md](./SETUP.md)
