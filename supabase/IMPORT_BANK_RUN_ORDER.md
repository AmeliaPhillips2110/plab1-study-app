# PLAB 1 question bank — Amelia paste order

Paste each file in **Supabase → SQL → New query → Run**, in this exact order.
Hard-refresh the site when finished.

## 1. Topics (fixed — no `updated_at`)

File: [`seed_topics_expand.sql`](./seed_topics_expand.sql)

Creates / renames specialties (includes Biomedical Sciences, Clinical Pharmacology, Critical Care, Genetics and Genomics).  
**Do not** use an older copy that sets `topics.updated_at` (`ERROR 42703`).

## 2. Clear sample / example questions

File: [`clear_sample_questions.sql`](./clear_sample_questions.sql)

Removes previous SAMPLE/UNVERIFIED seed SBAs. Keeps topics, glossary, users.

## 3. Import full SBA bank (1008 questions) — run parts in order

Generated from `PLAB_1_Question_Bank.xlsx` (91 blank rows skipped).

| Order | File |
| --- | --- |
| 3a | [`seed_question_bank_part01.sql`](./seed_question_bank_part01.sql) — Q1–250 |
| 3b | [`seed_question_bank_part02.sql`](./seed_question_bank_part02.sql) — Q251–500 |
| 3c | [`seed_question_bank_part03.sql`](./seed_question_bank_part03.sql) — Q501–750 |
| 3d | [`seed_question_bank_part04.sql`](./seed_question_bank_part04.sql) — Q751–1000 |
| 3e | [`seed_question_bank_part05.sql`](./seed_question_bank_part05.sql) — Q1001–1008 |

Full single file also available: [`seed_question_bank.sql`](./seed_question_bank.sql) (large — prefer parts).

## 4. Confirm counts

File: [`seed_question_bank_confirm.sql`](./seed_question_bank_confirm.sql)

Expect **1008** rows with `payload.source = plab1-xlsx`.

## 5. Hard-refresh PLABoratory

Home topics + Practice should show the new bank.

---

## Bank v2 (images) — optional additive

See [`IMPORT_BANK_V2_RUN_ORDER.md`](./IMPORT_BANK_V2_RUN_ORDER.md) for `PLAB_1_Question_Bank_2.xlsx` (234 SBAs + figures).

## Bank v3 — optional additive

See [`IMPORT_BANK_V3_RUN_ORDER.md`](./IMPORT_BANK_V3_RUN_ORDER.md) for `PLAB_1_Question_Bank_3.xlsx` (830 SBAs, no figures) when that PR is on `main`.

## Bank v4 — optional additive

See [`IMPORT_BANK_V4_RUN_ORDER.md`](./IMPORT_BANK_V4_RUN_ORDER.md) for `PLAB_1_Question_Bank_4.xlsx` (342 SBAs, no figures).
