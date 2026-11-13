# PLAB 1 bank v2 (images) — Amelia paste order

Additive import from `PLAB_1_Question_Bank_2.xlsx` (**234** SBAs, **27** with click-to-zoom figures).

Paste in **Supabase → SQL → New query → Run**, then hard-refresh.

| # | File |
| --- | --- |
| **1** | [`seed_topics_expand.sql`](./seed_topics_expand.sql) — ensures **Neurology** (renamed from Neurosciences) + all specialties |
| **2a** | [`seed_question_bank_v2_part01.sql`](./seed_question_bank_v2_part01.sql) — Q1–120 |
| **2b** | [`seed_question_bank_v2_part02.sql`](./seed_question_bank_v2_part02.sql) — Q121–234 |
| **3** | [`seed_question_bank_v2_confirm.sql`](./seed_question_bank_v2_confirm.sql) — expect **234** / **27** with images / topic name Neurology |

Does **not** clear bank v1. Images use Wikimedia Special:FilePath URLs in `payload.image_url`; the app shows a click-to-zoom figure under the stem.
