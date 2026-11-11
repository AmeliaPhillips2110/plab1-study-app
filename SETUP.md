# PLABoratory — Setup (Stages a–f)

English-only PLAB 1 study app (Vite + React + TypeScript + Tailwind + Supabase).  
This guide gets you from zero to a working local shell **with quizzes, mocks, attempt tracking, KPI / weakness dashboards, glossary, and UK-practice / long-stem reading tools**.

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
3. `supabase/seed.sql` (includes Stage f glossary terms, patient-centred tag, long-stem Q41)
4. Optional (Stage b): `supabase/seed_flashcards.sql` — 8 sample flashcards for flashcard / SR decks (SBA bank still works as flashcard fallback if you skip this)
5. Optional if you already seeded before Stage f: `supabase/seed_stage_f.sql` — incremental glossary / tags / Q41 only

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

Expect: exam `plab1`, ~14 topics, **41** sample SBA questions (incl. long-stem Q41), pass mark **65**.

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

## 6. What you should see (Stages a–f)

| Role | Works now |
| --- | --- |
| Anyone | Dark default theme + light toggle |
| Student | **Quiz**, **Mocks**, **Attempts**, **KPIs**, **Glossary** (tap/hover defs in stems; WPM; UK / patient-centred / long-stem filters) |
| Admin | Question bank; **Glossary editor**; settings; users; **Group comparison** (opt-out respected) |

Not yet: live Pages deploy (Stage g).

Sample questions are **original SAMPLE/UNVERIFIED** teaching items for wiring the bank — not copied from commercial question banks. Review before relying on them medically.

### Stage b smoke test

1. Sign in → **Quiz** in the nav (or Start quiz on the home page).
2. Topic + SBA: answer one item, confirm immediate Correct/Incorrect + explanation, finish the session.
3. Cover-the-options: reveal options after thinking from the stem alone.
4. Rapid fire: confirm the countdown; letting it hit zero marks skipped.
5. Flashcard deck: flip → Again/Hard/Good/Easy → Next (run optional `seed_flashcards.sql` or SBA-as-card fallback).
6. Weakness / spaced repetition: usable even with little history (falls back to random / due bank).

### Stage c smoke test

1. Sign in → **Mocks** (or Timed mock on the home page).
2. For a quick check set **5 questions / 10 minutes** (defaults remain 180 Q / 180 min from exam settings).
3. **Full mock:** answer/flag/navigate, confirm **no** Correct/Incorrect until Submit; see pace widget + countdown.
4. Submit → score vs pass mark, pace report, review with explanations (filter incorrect/flagged/skipped).
5. Start another run, answer one item, refresh the page → **Resume unfinished** should restore answers/flags/index.
6. **As many as you can:** End test early; score is vs answered items.
7. If the bank has fewer than the target (seed is ~40 SBA), the UI uses all available and says so.

### Stage d smoke test

1. Run a short **Quiz** session and get an item **wrong** — confirm mistake-tag chips appear (auto-suggested), adjust tags, click Next.
2. Open **Attempts** — see the attempt, filter by result / session type / mistake tag, sort, search.
3. Click **Timeline** on a row — chronological history for that question.
4. Export **attempts CSV** and **sessions CSV**; open in a spreadsheet.
5. Finish a short **Mock**, open incorrect items in review, **Save tags**, confirm they show in the attempt log.

### Stage e smoke test

1. Generate a few graded attempts (and ideally one finished mock) so charts have data.
2. Open **KPIs** — check headline tiles, score trend (pass-mark line), specialty bars, mistake pie, QPM, coverage, calendars/heatmaps.
3. Under Weakness analysis, use **Drill this topic** or **Recent mistakes quiz** (auto-starts tutor session).
4. As admin, open **Comparison** — confirm opted-out students are excluded from the peer list / group average.

### Stage f smoke test

1. Open **Glossary** — search terms; set **reading speed (WPM)** and Save.
2. As admin, open **Admin → Glossary editor** — add/edit a term; confirm it appears on `/glossary`.
3. Start **Quiz** with **UK practice only** — stems show UK practice badge; glossary terms are underlined (tap/hover).
4. Enable **Patient-centred only** and/or **Long-stem practice** — confirm Q41 (or tagged ethics items) can appear; reading tip shows word count / estimated seconds.
5. Answer a UK-practice item incorrectly — confirm suggested tags include **UK practice gap** (and **Language / wording** on long stems).
6. Open **KPIs** — **Pace vs stem length** panel + language / UK-practice mistake counts in the subtitle.

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
