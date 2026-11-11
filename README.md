# PLABoratory

PLAB 1 study app for Amelia and Hlib — **GitHub Pages + Supabase**.

Tutor quizzes, timed mocks, attempt/mistake tracking, KPI dashboards, glossary with stem definitions, UK-practice / long-stem filters.

## Quick start

See **[SETUP.md](./SETUP.md)** for Supabase SQL, env vars, admin bootstrap, GitHub push, and Pages.

How to add PLAB 2 later: **[ARCHITECTURE.md](./ARCHITECTURE.md)**.

```bash
cp .env.example .env.local   # add anon URL + key
npm install
npm run dev
```

## Stack

- Vite + React + TypeScript + Tailwind
- Supabase Auth + Postgres (RLS)
- Modular `modules/plab1` + `modules/shared/{quiz-engine,analytics,admin}`

## Scripts

| Command | Purpose |
| --- | --- |
| `npm run dev` | Local dev server (`base` `/`) |
| `npm run build` | Production build |
| `npm run build:pages` | Production build with `VITE_BASE=/plab1-study-app/` + verify |
| `npm run preview` | Preview production build |

## Deploy

Workflow: `.github/workflows/deploy-pages.yml` (push to `main` or workflow_dispatch).

Default project Pages URL pattern:

`https://YOUR_USERNAME.github.io/plab1-study-app/`

Requires Actions secrets `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY`. Details in SETUP.md §7.

## Licence / content note

Sample SBA items in `supabase/seed.sql` are original **unverified** teaching scaffolds for development — not commercial bank content. Review before clinical use.
