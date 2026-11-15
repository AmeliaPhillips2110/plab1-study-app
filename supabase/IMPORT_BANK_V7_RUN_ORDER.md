# PLAB 1 bank v7 — Amelia paste order

Additive import from `PLAB1_Question_Bank_7.xlsx` (**95** SBAs, **2** with click-to-zoom figures).

Paste in **Supabase → SQL → New query → Run**, then hard-refresh.

| # | File |
| --- | --- |
| **1** | [`seed_topics_expand.sql`](./seed_topics_expand.sql) — ensures specialties (no new topics for bank 7; **no** `updated_at`) |
| **2a** | [`seed_question_bank_v7_part01.sql`](./seed_question_bank_v7_part01.sql) — Q1–95 |
| **3** | [`seed_question_bank_v7_confirm.sql`](./seed_question_bank_v7_confirm.sql) — expect **95** SBAs / **2** with images |

Does **not** clear banks v1–v6. Source tag: `plab1-xlsx-v7`.  
Images use Wikimedia Special:FilePath URLs in `payload.image_url`.
