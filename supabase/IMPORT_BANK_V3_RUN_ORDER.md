# PLAB 1 bank v3 — Amelia paste order

Additive import from `PLAB_1_Question_Bank_3.xlsx` (**830** SBAs, **0** figures).

Paste in **Supabase → SQL → New query → Run**, then hard-refresh.

| # | File |
| --- | --- |
| **1** | [`seed_topics_expand.sql`](./seed_topics_expand.sql) — ensures specialties (incl. Maxillofacial Surgery from PR #23) |
| **2a** | [`seed_question_bank_v3_part01.sql`](./seed_question_bank_v3_part01.sql) — Q1–200 |
| **2b** | [`seed_question_bank_v3_part02.sql`](./seed_question_bank_v3_part02.sql) — Q201–400 |
| **2c** | [`seed_question_bank_v3_part03.sql`](./seed_question_bank_v3_part03.sql) — Q401–600 |
| **2d** | [`seed_question_bank_v3_part04.sql`](./seed_question_bank_v3_part04.sql) — Q601–800 |
| **2e** | [`seed_question_bank_v3_part05.sql`](./seed_question_bank_v3_part05.sql) — Q801–830 |
| **3** | [`seed_question_bank_v3_confirm.sql`](./seed_question_bank_v3_confirm.sql) — expect **830** SBAs / **0** with images |

Does **not** clear banks v1 or v2. Source tag: `plab1-xlsx-v3`. No new topics required (all 32 workbook categories map onto existing seeds).
