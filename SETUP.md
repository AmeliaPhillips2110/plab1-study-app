# PLABoratory — Setup (Stages a–g)

English-only PLAB 1 study app (Vite + React + TypeScript + Tailwind + Supabase).  
This guide gets you from zero to a working local shell and a **GitHub Pages** deploy.

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

Leave `VITE_BASE` unset for local `npm run dev` (serves at `/`).

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

## 6. What you should see (Stages a–g)

| Role | Works now |
| --- | --- |
| Anyone | Dark default theme + light toggle |
| Student | **Quiz**, **Mocks**, **Attempts**, **KPIs**, **Glossary** |
| Admin | Question bank; glossary editor; settings; users; group comparison |
| Deploy | `ARCHITECTURE.md` + GitHub Actions Pages workflow (needs repo + secrets) |

Product smoke tests for Stages b–f are below. Stage g is the push / Pages checklist in **§7**.

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

## 7. Create the GitHub repo and deploy Pages (Stage g)

Architecture notes for adding PLAB 2 later: **[ARCHITECTURE.md](./ARCHITECTURE.md)**.

### Base path (`VITE_BASE`)

| Hosting | `VITE_BASE` |
| --- | --- |
| Local `npm run dev` | unset (defaults to `/`) |
| GitHub **project** Pages (`username.github.io/plab1-study-app/`) | `/plab1-study-app/` |
| User/org root site (`username.github.io/`) | `/` |

Local check that the production bundle embeds the project path:

```bash
npm run build:pages
```

The Actions workflow builds with `VITE_BASE=/plab1-study-app/` by default (override with repo variable `VITE_BASE`). It also copies `dist/index.html` → `dist/404.html` so client-side routes work on refresh.

### A. If `gh` is authenticated on your machine

```bash
cd plaboratory
# ensure you are on a clean tree with Stage g commits
git checkout -B main
git remote remove origin 2>/dev/null || true
gh repo create plab1-study-app --public --source=. --remote=origin --push
```

Then continue from **C. Actions secrets + enable Pages** below.

### B. If GitHub is **not** authenticated (agent / this VM)

Do this once on a machine where you are signed into GitHub (browser or `gh auth login`):

1. Create an empty **public** repository named **`plab1-study-app`**  
   https://github.com/new → name `plab1-study-app` → Public → **do not** add README/license (repo already has files).
2. From the app root, push `main` (replace `YOUR_USERNAME`):

```bash
cd plaboratory
git checkout -B main
git remote remove origin 2>/dev/null || true
git remote add origin https://github.com/YOUR_USERNAME/plab1-study-app.git
git push -u origin main
```

SSH alternative:

```bash
git remote add origin git@github.com:YOUR_USERNAME/plab1-study-app.git
git push -u origin main
```

Expected site URL after Pages is on:

`https://YOUR_USERNAME.github.io/plab1-study-app/`

### C. Actions secrets + enable Pages (click path)

1. Repo → **Settings → Secrets and variables → Actions → New repository secret**
   - `VITE_SUPABASE_URL` = your Supabase Project URL  
   - `VITE_SUPABASE_ANON_KEY` = your Supabase **anon** key  
2. Optional: **Variables** → `VITE_BASE` = `/plab1-study-app/` (workflow already defaults to this).
3. Repo → **Settings → Pages**
   - **Source:** GitHub Actions  
4. Repo → **Actions** → open **Deploy GitHub Pages**  
   - If it did not run on push, click **Run workflow** → Branch `main` → **Run workflow**.
5. Wait for green build + deploy. Open the URL shown on the workflow summary (or `https://YOUR_USERNAME.github.io/plab1-study-app/`).
6. In Supabase → **Authentication → URL configuration**, add that Pages URL to **Site URL** / **Redirect URLs** if email confirm / redirects are enabled.

### D. Live repo (AmeliaPhillips2110) — finish first Pages deploy

**Repo:** https://github.com/AmeliaPhillips2110/plab1-study-app  
**Pages URL:** https://ameliaphillips2110.github.io/plab1-study-app/

The OAuth token used to push lacked the `workflow` scope, so the Actions file is published as [`docs/deploy-pages.yml`](./docs/deploy-pages.yml) until it is installed under `.github/workflows/`.

| Step | Where |
| --- | --- |
| Create `.github/workflows/deploy-pages.yml` (paste from `docs/deploy-pages.yml`) | Repo → Add file → Create new file |
| Add `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY` | Settings → Secrets and variables → Actions |
| Confirm Pages source is **GitHub Actions** | Settings → Pages |
| Run / approve **Deploy GitHub Pages** | Actions tab (first deploy may ask to approve `github-pages`) |
| Allow the Pages URL in Supabase Auth redirects | Supabase → Authentication → URL configuration |

## 8. Troubleshooting

- **“Supabase is not configured”** — missing/incorrect `.env.local`; restart `npm run dev` after edits.
- **Exam not found** — seed SQL not run.
- **Cannot see admin nav** — profile role still `student`; re-run admin SQL and refresh session.
- **RLS errors on write** — confirm you are signed in as admin (for bank edits) or as the owning user (for attempts/sessions) and RLS migration ran.
- **Quiz “No questions matched”** — seed SQL not applied, or topic filter empty; try Random mix first.
- **Flashcard deck empty of native cards** — optional `seed_flashcards.sql` not run; app falls back to SBA stems as cards.
- **Pages blank / 404 on routes** — confirm `VITE_BASE` matches the repo name (including trailing slash), Pages source is Actions, and the workflow uploaded `404.html`.
- **Actions build fails on missing secrets** — set `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY` in repo secrets.
- **Auth redirect fails on Pages** — add the Pages URL in Supabase Auth URL config.
