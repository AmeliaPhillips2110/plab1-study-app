# PLAB 1 bank v6 — Amelia paste order

Additive import from `PLAB1_Question_Bank_6.xlsx` (**792** SBAs, **38** with click-to-zoom figures).

Paste in **Supabase → SQL → New query → Run**, then hard-refresh.

| # | File |
| --- | --- |
| **1** | [`seed_topics_expand.sql`](./seed_topics_expand.sql) — ensures specialties (no new topics for bank 6; **no** `updated_at`) |
| **2a** | [`seed_question_bank_v6_part01.sql`](./seed_question_bank_v6_part01.sql) — Q1–200 |
| **2b** | [`seed_question_bank_v6_part02.sql`](./seed_question_bank_v6_part02.sql) — Q201–400 |
| **2c** | [`seed_question_bank_v6_part03.sql`](./seed_question_bank_v6_part03.sql) — Q401–600 |
| **2d** | [`seed_question_bank_v6_part04.sql`](./seed_question_bank_v6_part04.sql) — Q601–792 |
| **3** | [`seed_question_bank_v6_confirm.sql`](./seed_question_bank_v6_confirm.sql) — expect **792** SBAs / **38** with images |

Does **not** clear banks v1, v2, v3, or v4. Source tag: `plab1-xlsx-v6`.  
Images use Wikimedia Special:FilePath URLs in `payload.image_url`.  
Bank 6 maps **Orthopaedics** to the Orthopaedics topic (separate from Musculoskeletal).
