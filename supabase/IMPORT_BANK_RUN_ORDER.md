# PLAB 1 question bank — Amelia run order

Paste each file in **Supabase → SQL → New query → Run**, in this order.

## 1. Topics (fixed — no `updated_at`)

File: [`seed_topics_expand.sql`](./seed_topics_expand.sql)

Creates / renames the full specialty list. **Do not** use an older copy that sets `topics.updated_at` (column does not exist → `ERROR 42703`).

## 2. Clear sample / example questions

File: [`clear_sample_questions.sql`](./clear_sample_questions.sql)

Removes previous SAMPLE/UNVERIFIED seed SBAs (and tagged examples). Keeps topics, glossary, users.

## 3. Import full SBA bank from Excel

File: [`seed_question_bank.sql`](./seed_question_bank.sql) *(generated)*

Generate on a machine that has the workbook:

```bash
# place workbook at data/PLAB_1_Question_Bank.xlsx  OR pass the path
python3 scripts/xlsx_to_seed_sql.py data/PLAB_1_Question_Bank.xlsx \
  -o supabase/seed_question_bank.sql
```

Then paste `seed_question_bank.sql` into Supabase.

Expected columns (flexible names): stem/question, option A–E, correct answer, explanation, topic/specialty. Optional: UK practice, guidelines.

## 4. Optional guideline chips on a few samples

Only if you still have sample Qs: [`seed_guidelines.sql`](./seed_guidelines.sql). Skip after a full bank replace.

## 5. Hard-refresh the site

Open PLABoratory → hard refresh. Home topics + Practice modes should show the new bank counts.

---

**Prior app features (already on `main` via #18):** Daily Questions, homepage study streak, Revise Flagged, guideline-linked explanations, Times Changed on session summary + Account.
