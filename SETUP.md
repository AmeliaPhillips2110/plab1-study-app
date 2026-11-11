# PLABoratory — Setup (Stages a–b)

English-only PLAB 1 study app (Vite + React + TypeScript + Tailwind + Supabase).  
This guide gets you from zero to a working local admin/student shell **with tutor-mode quizzes**.

## 1. Create a Supabase project

1. Go to [https://supabase.com](https://supabase.com) and create a project (free tier is fine).
2. Wait until the database is ready.
3. Open **Project Settings → API** and copy:
   - **Project URL** → `VITE_SUPABASE_URL`
   - **anon public** key → `VITE_SUPABASE_ANON_KEY`
4. Do **not** put the **service_role** key in the frontend or commit it anywhere.

Optional Auth settings (Authentication → Providers → Email):

- Enable Email provider.
- For early testing you may disable “Confirm email” so signup works immediately.
- Re-enable confirmation later if you want.

## 2. Run SQL (schema → RLS → seed)

In the Supabase dashboard open **SQL → New query** and run these files **in order** (paste each file’s contents and Run):

1. `supabase/migrations/20261111000001_schema.sql`
2. `supabase/migrations/20261111000002_rls.sql`
3. `supabase/seed.sql`
4. Optional (Stage b): `supabase/seed_flashcards.sql` — 8 sample flashcards for flashcard / SR decks (SBA bank still works as flashcard fallback if you skip this)

### Quick RLS check

Still in SQL editor:

```sql
select tablename, rowsecurity
from pg_tables
where schemaname = 'public'
order by tablename;
```

Every app table should show `rowsecurity = true`.

Also confirm seed:

```sql
select slug, name from public.exams;
select count(*) as topic_count from public.topics;
select count(*) as question_count from public.questions;
select pass_mark_percent from public.exam_settings;
```

Expect: exam `plab1`, ~14 topics, **40** sample SBA questions, pass mark **65**.

## 3. Environment variables (local)

From the repo root (`plaboratory/`):

```bash
cp .env.example .env.local
```

Edit `.env.local`:

```bash
VITE_SUPABASE_URL=https://YOUR_PROJECT_REF.supabase.co
VITE_SUPABASE_ANON_KEY=your-anon-key-here
```

Anon key only. Never commit `.env.local`.

## 4. Install and run locally

```bash
cd plaboratory   # if you are not already in the app root
npm install
npm run dev
```

Open the URL Vite prints (usually `http://localhost:5173`).

## 5. Create accounts and make Amelia admin

1. In the app, use **Create account** with Amelia’s email/password (or create the user under Supabase **Authentication → Users**).
2. Promote Amelia to admin in the SQL editor (no password in SQL):

```sql
update public.profiles
set role = 'admin',
    display_name = coalesce(display_name, 'Amelia')
where email = 'ameliaphillips1324@gmail.com';
```

3. Sign out and sign back in (or refresh) so the app reloads the profile role.
4. Create Hlib (or any student) the same way with **Create account** — they stay `student` by default.
5. New students are **opted in** to peer comparison (`comparison_opt_out = false`) via `user_preferences`.

### Invite / add path (also documented in Admin → Users)

1. User signs up in the app (or you add them in Supabase Auth).
2. Trigger creates `profiles` (role `student`) + `user_preferences`.
3. Promote to admin only via SQL as above when needed.

## 6. What you should see (Stage a + b)

| Role | Works now |
| --- | --- |
| Anyone | Dark default theme + light toggle |
| Student | Login → study home → **Quiz** (`/study`): topic, random, weakness, spaced repetition, flashcard; formats SBA / flashcard / cover-the-options / rapid fire; tutor feedback; attempts + SR saved |
| Admin | Question bank add/edit/delete/preview; settings pass mark; user list + invite notes |

Not yet: full mocks / as-many-as-you-can (Stage c), KPI charts (e), glossary UI (f), live Pages deploy (g).

Sample questions are **original SAMPLE/UNVERIFIED** teaching items for wiring the bank — not copied from commercial question banks. Review before relying on them medically.

### Stage b smoke test

1. Sign in → **Quiz** in the nav (or Start quiz on the home page).
2. Topic + SBA: answer one item, confirm immediate Correct/Incorrect + explanation, finish the session.
3. Cover-the-options: reveal options after thinking from the stem alone.
4. Rapid fire: confirm the countdown; letting it hit zero marks skipped.
5. Flashcard deck: flip → Again/Hard/Good/Easy → Next (run optional `seed_flashcards.sql` or SBA-as-card fallback).
6. Weakness / spaced repetition: usable even with little history (falls back to random / due bank).

## 7. Create / push the GitHub repo (for later Pages)

If `gh` is authenticated as Amelia:

```bash
cd plaboratory
git init
git add .
git commit -m "Stage a: auth, admin question bank, schema, tokens"
gh repo create plab1-study-app --public --source=. --remote=origin --push
```

If GitHub is **not** authenticated on this machine, create an empty public repo named `plab1-study-app` on github.com, then:

```bash
cd plaboratory
git init
git add .
git commit -m "Stage a: auth, admin question bank, schema, tokens"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/plab1-study-app.git
git push -u origin main
```

GitHub Pages deploy workflow is only a **stub** in `.github/workflows/deploy-pages.yml` (Stage g). When deploying later, set `VITE_BASE=/plab1-study-app/` for project pages.

## 8. Troubleshooting

- **“Supabase is not configured”** — missing/incorrect `.env.local`; restart `npm run dev` after edits.
- **Exam not found** — seed SQL not run.
- **Cannot see admin nav** — profile role still `student`; re-run admin SQL and refresh session.
- **RLS errors on write** — confirm you are signed in as admin (for bank edits) or as the owning user (for attempts/sessions) and RLS migration ran.
- **Quiz “No questions matched”** — seed SQL not applied, or topic filter empty; try Random mix first.
- **Flashcard deck empty of native cards** — optional `seed_flashcards.sql` not run; app falls back to SBA stems as cards.
