# PLAB 1 bank v4 — Amelia paste order

Additive import from `PLAB_1_Question_Bank_4.xlsx` (**342** SBAs, **0** figures).

Paste in **Supabase → SQL → New query → Run**, then hard-refresh.

| # | File |
| --- | --- |
| **1** | [`seed_topics_expand.sql`](./seed_topics_expand.sql) — ensures specialties (no new topics for bank 4) |
| **2a** | [`seed_question_bank_v4_part01.sql`](./seed_question_bank_v4_part01.sql) — Q1–200 |
| **2b** | [`seed_question_bank_v4_part02.sql`](./seed_question_bank_v4_part02.sql) — Q201–342 |
| **3** | [`seed_question_bank_v4_confirm.sql`](./seed_question_bank_v4_confirm.sql) — expect **342** SBAs / **0** with images |

Does **not** clear banks v1, v2, or v3. Source tag: `plab1-xlsx-v4`. No new topics required (all 28 workbook categories map onto existing seeds).
