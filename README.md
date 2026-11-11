# PLABoratory

PLAB 1 study app for Amelia and Hlib — GitHub Pages + Supabase.

**Stage a (this tree):** email/password auth, roles, design tokens, question-bank admin CRUD, student study-home placeholder.

## Quick start

See **[SETUP.md](./SETUP.md)** for Supabase SQL, env vars, admin bootstrap, and GitHub push.

```bash
cp .env.example .env.local   # add anon URL + key
npm install
npm run dev
```

## Stack

- Vite + React + TypeScript + Tailwind
- Supabase Auth + Postgres (RLS)
- Modular folders for PLAB 1 + shared quiz/analytics/admin (later stages stubbed)

## Scripts

| Command | Purpose |
| --- | --- |
| `npm run dev` | Local dev server |
| `npm run build` | Production build |
| `npm run preview` | Preview production build |

## Licence / content note

Sample SBA items in `supabase/seed.sql` are original **unverified** teaching scaffolds for development — not commercial bank content. Review before clinical use.
