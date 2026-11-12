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

**Required Auth settings** — signup must **not** send email:

1. **Authentication → Providers → Email**
   - Enable the **Email** provider (Supabase still stores a synthetic address under the hood).
   - **Confirm email → Off** (required). With this **Off**, signup returns a session and does **not** send mail. With it **On**, every Create account burns the free mail quota (2/hour) and you will see `email rate limit exceeded` — including for `{user}@plaboratory.app`.
2. Optional but recommended (same Email provider panel / Auth settings):
   - **Secure email change** / double-confirm email change → Off (unused; we never change email in-app).
   - Do **not** enable magic link / OTP for this app.
3. **Authentication → Rate Limits**
   - Built-in provider: **2 emails/hour** project-wide while Confirm email is On.
   - After turning Confirm email **Off**, new signups should stop hitting the mail quota. If you already exhausted it, **wait ~1 hour** or configure **custom SMTP** / **Send Email Hook** (then you can raise the email limit).
4. This app maps User → `{username}@plaboratory.app`. That address is **not** a real inbox — Confirm email must stay **Off**.

## 2. Run SQL (required — fixes missing `public.exams`)

If the live app shows **`Could not find the table 'public.exams' in the schema cache`**, this step was not done yet. Deploying the website does **not** create tables.

### One paste (recommended)

1. Open the repo file [`supabase/APPLY_ALL.sql`](./supabase/APPLY_ALL.sql) (GitHub → raw view is fine).
2. Select **all** of it → Copy.
3. Supabase dashboard → **SQL** → **New query**.
4. Paste → **Run** (wait until it finishes without errors).
5. Confirm:

```sql
select slug, name from public.exams;
select count(*) as topic_count from public.topics;
select count(*) as question_count from public.questions;
select count(*) as glossary_count from public.glossary_terms;
select pass_mark_percent from public.exam_settings;
```

Expect: exam `plab1`, ~14 topics, **~49** questions (41 SBA + 8 flashcards), glossary practice terms, pass mark **65**.

That single paste creates:

- All tables / enums / helpers (including `public.exams`)
- Row Level Security policies
- PLAB 1 exam + settings (65% pass)
- Topics, tags, sectioned glossary, sample SBAs, and flashcards

If you already partially applied older SQL and get “already exists” errors, use a **fresh** Supabase project **or** drop the conflicting public objects, then re-run `APPLY_ALL.sql`.

**Manual (same content, split):** run in order:

1. `supabase/migrations/20261111000001_schema.sql`
2. `supabase/migrations/20261111000002_rls.sql`
3. `supabase/migrations/20261112000003_glossary_section.sql` (only if schema was applied before the `section` column existed)
4. `supabase/seed.sql`
5. `supabase/seed_flashcards.sql`
6. Optional if you already seeded before Stage f: `supabase/seed_stage_f.sql`

### Quick RLS check

```sql
select tablename, rowsecurity
from pg_tables
where schemaname = 'public'
order by tablename;
```

Every app table should show `rowsecurity = true`.

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

The login screen asks for **User** + **Password** only (no email field). The app maps:

`username` → synthetic Auth email `{sanitized_username}@plaboratory.app`  
`display_name` → same sanitized username

Example: User `Amelia` → Auth email `amelia@plaboratory.app`, profile display name `amelia`.

1. Confirm §1: **Confirm email = Off**. Then in the app, **Create account** with Amelia’s user name + password. You should land signed in with **no** email sent.
2. If you still see `email rate limit exceeded`: Confirm email is still On, or the free quota is exhausted — turn it Off, wait ~1 hour (or add custom SMTP), retry.
3. Promote Amelia to **Administrator** — paste [`supabase/PROMOTE_AMELIA.sql`](./supabase/PROMOTE_AMELIA.sql) into the SQL editor and Run (or run this):

```sql
update public.profiles
set role = 'admin',
    display_name = coalesce(nullif(trim(display_name), ''), 'amelia'),
    updated_at = now()
where lower(coalesce(display_name, '')) = 'amelia'
   or lower(email) in ('amelia@plaboratory.app', 'ameliaphillips1324@gmail.com')
   or lower(email) like 'amelia%@plaboratory.app';
```

4. Sign out and sign back in (or refresh) so the app reloads the profile role. Account should show **Administrator**.
5. Create Hlib (or any student) the same way with **Create account** — they stay `student` by default.
6. New students are **opted in** to peer comparison (`comparison_opt_out = false`) via `user_preferences`.

### Invite / add path (also documented in Admin → Users)

1. User signs up in the app with User + Password.
2. Trigger creates `profiles` (role `student`, display_name = username) + `user_preferences`.
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
