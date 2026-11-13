#!/usr/bin/env python3
"""Convert PLAB_1_Question_Bank.xlsx → paste-ready Supabase SQL.

Usage:
  python3 scripts/xlsx_to_seed_sql.py [path/to/PLAB_1_Question_Bank.xlsx] \\
      [-o supabase/seed_question_bank.sql]

Looks for the workbook in (first hit wins):
  1) CLI path
  2) ./PLAB_1_Question_Bank.xlsx
  3) ./data/PLAB_1_Question_Bank.xlsx
  4) /cursor/stores/self/inbox/PLAB_1_Question_Bank.xlsx
  5) /cursor/stores/self/docs/PLAB_1_Question_Bank.xlsx
"""

from __future__ import annotations

import argparse
import hashlib
import re
import sys
import uuid
from pathlib import Path

from openpyxl import load_workbook

EXAM_ID = "a1000000-0000-4000-8000-000000000001"
BANK_NAMESPACE = uuid.UUID("b1000000-0000-4000-8000-000000000001")

# Canonical topic slug → (fixed uuid suffix used in seed_topics_expand, display name)
TOPICS: dict[str, tuple[str, str]] = {
    "acute-emergency-medicine": ("023", "Acute and Emergency Medicine"),
    "breast-surgery": ("022", "Breast Surgery"),
    "cancer": ("024", "Cancer"),
    "cardiology": ("001", "Cardiovascular"),
    "clinical-imaging": ("025", "Clinical Imaging"),
    "dermatology": ("012", "Dermatology"),
    "ent": ("026", "ENT"),
    "endocrine": ("004", "Endocrine, Diabetes and Metabolic"),
    "ethics-uk-practice": ("013", "Ethics and UK Practice"),
    "gastroenterology": ("003", "Gastroenterology"),
    "general-practice-primary-healthcare": ("027", "General Practice and Primary Healthcare"),
    "haematology": ("014", "Haematology"),
    "human-factors-quality-improvement": ("028", "Human Factors and Quality Improvement"),
    "infectious-disease": ("010", "Infectious Disease"),
    "medicine-older-adult": ("029", "Medicine of the Older Adult"),
    "psychiatry": ("007", "Mental Health"),
    "musculoskeletal": ("011", "Musculoskeletal"),
    "neurology": ("006", "Neurosciences"),
    "obstetrics-gynaecology": ("008", "Obstetrics and Gynaecology"),
    "ophthalmology": ("015", "Ophthalmology"),
    "orthopaedics": ("016", "Orthopaedics"),
    "paediatrics": ("009", "Paediatrics"),
    "palliative-end-of-life-care": ("017", "Palliative Care and End of Life"),
    "perioperative-anaesthesia": ("018", "Perioperative and Anaesthesia"),
    "renal": ("005", "Renal"),
    "respiratory": ("002", "Respiratory"),
    "rheumatology": ("019", "Rheumatology"),
    "sexual-health": ("020", "Sexual Health"),
    "social-population-health": ("021", "Social and Population Health"),
    "surgery": ("030", "Surgery"),
    "urology": ("031", "Urology"),
    "vascular": ("032", "Vascular"),
}

# Free-text specialty / topic aliases → slug
TOPIC_ALIASES: dict[str, str] = {
    "acute and emergency medicine": "acute-emergency-medicine",
    "acute medicine": "acute-emergency-medicine",
    "emergency medicine": "acute-emergency-medicine",
    "a&e": "acute-emergency-medicine",
    "emergency": "acute-emergency-medicine",
    "breast surgery": "breast-surgery",
    "breast": "breast-surgery",
    "cancer": "cancer",
    "oncology": "cancer",
    "cardiology": "cardiology",
    "cardiovascular": "cardiology",
    "cardio": "cardiology",
    "clinical imaging": "clinical-imaging",
    "radiology": "clinical-imaging",
    "imaging": "clinical-imaging",
    "dermatology": "dermatology",
    "derm": "dermatology",
    "ent": "ent",
    "otolaryngology": "ent",
    "ear nose throat": "ent",
    "endocrine": "endocrine",
    "endocrinology": "endocrine",
    "diabetes": "endocrine",
    "endocrine diabetes and metabolic": "endocrine",
    "endocrine, diabetes and metabolic": "endocrine",
    "ethics": "ethics-uk-practice",
    "ethics and uk practice": "ethics-uk-practice",
    "uk practice": "ethics-uk-practice",
    "gastroenterology": "gastroenterology",
    "gastro": "gastroenterology",
    "gi": "gastroenterology",
    "general practice": "general-practice-primary-healthcare",
    "general practice and primary healthcare": "general-practice-primary-healthcare",
    "gp": "general-practice-primary-healthcare",
    "primary care": "general-practice-primary-healthcare",
    "haematology": "haematology",
    "hematology": "haematology",
    "human factors": "human-factors-quality-improvement",
    "human factors and quality improvement": "human-factors-quality-improvement",
    "quality improvement": "human-factors-quality-improvement",
    "infectious disease": "infectious-disease",
    "infectious diseases": "infectious-disease",
    "infection": "infectious-disease",
    "medicine of the older adult": "medicine-older-adult",
    "geriatrics": "medicine-older-adult",
    "elderly": "medicine-older-adult",
    "care of the elderly": "medicine-older-adult",
    "mental health": "psychiatry",
    "psychiatry": "psychiatry",
    "psych": "psychiatry",
    "musculoskeletal": "musculoskeletal",
    "msk": "musculoskeletal",
    "rheumatology / msk": "musculoskeletal",
    "neurosciences": "neurology",
    "neurology": "neurology",
    "neuro": "neurology",
    "obstetrics and gynaecology": "obstetrics-gynaecology",
    "obstetrics & gynaecology": "obstetrics-gynaecology",
    "obs and gynae": "obstetrics-gynaecology",
    "obgyn": "obstetrics-gynaecology",
    "o&g": "obstetrics-gynaecology",
    "gynaecology": "obstetrics-gynaecology",
    "obstetrics": "obstetrics-gynaecology",
    "ophthalmology": "ophthalmology",
    "eyes": "ophthalmology",
    "orthopaedics": "orthopaedics",
    "orthopedics": "orthopaedics",
    "ortho": "orthopaedics",
    "paediatrics": "paediatrics",
    "pediatrics": "paediatrics",
    "paeds": "paediatrics",
    "palliative care and end of life": "palliative-end-of-life-care",
    "palliative": "palliative-end-of-life-care",
    "palliative care": "palliative-end-of-life-care",
    "perioperative and anaesthesia": "perioperative-anaesthesia",
    "anaesthesia": "perioperative-anaesthesia",
    "anesthesia": "perioperative-anaesthesia",
    "perioperative": "perioperative-anaesthesia",
    "renal": "renal",
    "renal and urology": "renal",
    "nephrology": "renal",
    "respiratory": "respiratory",
    "resp": "respiratory",
    "rheumatology": "rheumatology",
    "rheum": "rheumatology",
    "sexual health": "sexual-health",
    "genitourinary": "sexual-health",
    "guh": "sexual-health",
    "social and population health": "social-population-health",
    "public health": "social-population-health",
    "population health": "social-population-health",
    "surgery": "surgery",
    "general surgery": "surgery",
    "urology": "urology",
    "vascular": "vascular",
    "vascular surgery": "vascular",
}


def topic_id_for_slug(slug: str) -> str:
    suffix = TOPICS[slug][0]
    return f"a2000000-0000-4000-8000-000000000{suffix}"


def norm_header(value: object) -> str:
    s = str(value or "").strip().lower()
    s = re.sub(r"[^a-z0-9]+", " ", s)
    return re.sub(r"\s+", " ", s).strip()


def sql_str(value: object) -> str:
    if value is None:
        return "null"
    text = str(value).replace("\r\n", "\n").replace("\r", "\n").strip()
    return "'" + text.replace("'", "''") + "'"


def resolve_topic(raw: object) -> str | None:
    if raw is None:
        return None
    key = norm_header(raw)
    if not key:
        return None
    if key in TOPIC_ALIASES:
        return TOPIC_ALIASES[key]
    # fuzzy contains
    for alias, slug in TOPIC_ALIASES.items():
        if alias in key or key in alias:
            return slug
    return None


def pick_col(headers: list[str], *candidates: str) -> int | None:
    for cand in candidates:
        c = norm_header(cand)
        for i, h in enumerate(headers):
            if h == c:
                return i
    for cand in candidates:
        c = norm_header(cand)
        for i, h in enumerate(headers):
            if c and (c in h or h in c):
                return i
    return None


def stable_uuid(seed: str) -> str:
    return str(uuid.uuid5(BANK_NAMESPACE, seed))


def cell(row: tuple, idx: int | None) -> object:
    if idx is None or idx >= len(row):
        return None
    return row[idx]


def parse_correct(raw: object, options: dict[str, str]) -> str | None:
    if raw is None:
        return None
    s = str(raw).strip()
    if not s:
        return None
    # Letter
    m = re.match(r"^([A-Ea-e])\b", s)
    if m:
        return m.group(1).upper()
    # Full text match against option bodies
    low = s.lower()
    for lab, body in options.items():
        if body and body.strip().lower() == low:
            return lab
    # "Option B" / "answer: C"
    m = re.search(r"\b([A-Ea-e])\b", s)
    if m:
        return m.group(1).upper()
    return None


def find_workbook(cli: str | None) -> Path:
    candidates = []
    if cli:
        candidates.append(Path(cli))
    candidates.extend(
        [
            Path("PLAB_1_Question_Bank.xlsx"),
            Path("data/PLAB_1_Question_Bank.xlsx"),
            Path("/cursor/stores/self/inbox/PLAB_1_Question_Bank.xlsx"),
            Path("/cursor/stores/self/docs/PLAB_1_Question_Bank.xlsx"),
            Path("/cursor/stores/self/media/PLAB_1_Question_Bank.xlsx"),
        ]
    )
    for p in candidates:
        if p.is_file():
            return p
    raise FileNotFoundError(
        "PLAB_1_Question_Bank.xlsx not found. Place it at data/PLAB_1_Question_Bank.xlsx "
        "or pass the path as argv[1]."
    )


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("xlsx", nargs="?", help="Path to PLAB_1_Question_Bank.xlsx")
    ap.add_argument("-o", "--output", default="supabase/seed_question_bank.sql")
    ap.add_argument("--sheet", default=None, help="Worksheet name (default: first)")
    args = ap.parse_args()

    try:
        path = find_workbook(args.xlsx)
    except FileNotFoundError as e:
        print(str(e), file=sys.stderr)
        return 2

    wb = load_workbook(path, read_only=True, data_only=True)
    ws = wb[args.sheet] if args.sheet else wb[wb.sheetnames[0]]
    rows = ws.iter_rows(values_only=True)
    try:
        header_row = next(rows)
    except StopIteration:
        print("Empty workbook", file=sys.stderr)
        return 2

    headers = [norm_header(h) for h in header_row]
    print("Headers:", headers, file=sys.stderr)

    i_stem = pick_col(headers, "stem", "question", "question text", "question stem", "sba", "vignette")
    i_a = pick_col(headers, "option a", "a", "answer a", "choice a")
    i_b = pick_col(headers, "option b", "b", "answer b", "choice b")
    i_c = pick_col(headers, "option c", "c", "answer c", "choice c")
    i_d = pick_col(headers, "option d", "d", "answer d", "choice d")
    i_e = pick_col(headers, "option e", "e", "answer e", "choice e")
    i_correct = pick_col(
        headers,
        "correct",
        "correct answer",
        "answer",
        "correct option",
        "key",
        "ans",
    )
    i_expl = pick_col(headers, "explanation", "explain", "rationale", "feedback", "notes")
    i_topic = pick_col(
        headers,
        "topic",
        "specialty",
        "speciality",
        "subject",
        "category",
        "system",
        "theme",
    )
    i_uk = pick_col(headers, "uk practice", "uk", "is uk practice", "uk_practice")
    i_guidelines = pick_col(headers, "guidelines", "guideline", "nice", "refs", "references")

    if i_stem is None or i_a is None or i_b is None or i_c is None or i_d is None or i_e is None:
        print(
            "Could not map required columns (stem + options A–E). Headers were:",
            headers,
            file=sys.stderr,
        )
        return 2

    out_lines: list[str] = []
    out_lines.append("-- =============================================================================")
    out_lines.append("-- PLAB 1 full SBA bank import (generated from PLAB_1_Question_Bank.xlsx)")
    out_lines.append(f"-- Source: {path.name}")
    out_lines.append("-- Paste into Supabase SQL after: seed_topics_expand.sql + clear_sample_questions.sql")
    out_lines.append("-- Safe to re-run (stable UUIDs from uuid5 of stem+options).")
    out_lines.append("-- =============================================================================")
    out_lines.append("")
    out_lines.append(f"-- Ensure exam exists")
    out_lines.append(
        "insert into public.exams (id, slug, name, description, is_active) values "
        f"('{EXAM_ID}', 'plab1', 'PLAB 1', 'PLAB 1 single best answer study bank (PLABoratory).', true) "
        "on conflict (slug) do update set name = excluded.name, is_active = true;"
    )
    out_lines.append("")

    imported = 0
    skipped = 0
    unmapped_topics: dict[str, int] = {}
    topic_counts: dict[str, int] = {}

    for n, row in enumerate(rows, start=2):
        stem = cell(row, i_stem)
        if stem is None or not str(stem).strip():
            skipped += 1
            continue
        opts = {
            "A": str(cell(row, i_a) or "").strip(),
            "B": str(cell(row, i_b) or "").strip(),
            "C": str(cell(row, i_c) or "").strip(),
            "D": str(cell(row, i_d) or "").strip(),
            "E": str(cell(row, i_e) or "").strip(),
        }
        if sum(1 for v in opts.values() if v) < 2:
            skipped += 1
            continue

        correct = parse_correct(cell(row, i_correct), opts)
        if correct not in opts or not opts[correct]:
            # default: leave none correct flagged? better skip
            skipped += 1
            print(f"Row {n}: could not resolve correct answer ({cell(row, i_correct)!r})", file=sys.stderr)
            continue

        topic_raw = cell(row, i_topic)
        slug = resolve_topic(topic_raw)
        if slug is None:
            key = str(topic_raw or "").strip() or "(blank)"
            unmapped_topics[key] = unmapped_topics.get(key, 0) + 1
            topic_id_sql = "null"
        else:
            topic_id_sql = f"'{topic_id_for_slug(slug)}'"
            topic_counts[slug] = topic_counts.get(slug, 0) + 1

        expl = cell(row, i_expl)
        uk_raw = cell(row, i_uk)
        is_uk = False
        if uk_raw is not None:
            is_uk = str(uk_raw).strip().lower() in {"1", "true", "yes", "y", "uk", "uk practice"}

        guidelines_raw = cell(row, i_guidelines)
        payload_bits = ["'source', 'plab1-xlsx'"]
        if guidelines_raw and str(guidelines_raw).strip():
            # Store free-text; UI also auto-linkifies NICE/BNF in explanation
            g = str(guidelines_raw).strip().replace("'", "''")
            payload_bits.append(f"'guidelines_text', '{g}'")
            # If explanation empty, append guideline text there too for linkify
            if not expl:
                expl = str(guidelines_raw).strip()

        seed = "|".join(
            [
                str(stem).strip(),
                opts["A"],
                opts["B"],
                opts["C"],
                opts["D"],
                opts["E"],
                correct,
            ]
        )
        qid = stable_uuid(f"q:{hashlib.sha1(seed.encode('utf-8')).hexdigest()}")
        imported += 1
        idx = imported

        out_lines.append(f"-- Q{idx}")
        out_lines.append(
            "insert into public.questions "
            "(id, exam_id, topic_id, question_type, stem, explanation, difficulty, is_active, is_uk_practice, payload) values ("
            f"'{qid}', '{EXAM_ID}', {topic_id_sql}, 'sba', {sql_str(stem)}, {sql_str(expl)}, "
            f"null, true, {'true' if is_uk else 'false'}, "
            f"jsonb_build_object({', '.join(payload_bits)})"
            ") on conflict (id) do update set "
            "stem = excluded.stem, explanation = excluded.explanation, topic_id = excluded.topic_id, "
            "is_uk_practice = excluded.is_uk_practice, payload = excluded.payload, "
            "is_active = true, updated_at = now();"
        )
        out_lines.append(f"delete from public.question_options where question_id = '{qid}';")
        opt_rows = []
        for sort, lab in enumerate("ABCDE"):
            body = opts[lab]
            if not body:
                continue
            oid = stable_uuid(f"o:{qid}:{lab}")
            opt_rows.append(
                f"('{oid}', '{qid}', '{lab}', {sql_str(body)}, {'true' if lab == correct else 'false'}, {sort})"
            )
        out_lines.append(
            "insert into public.question_options (id, question_id, label, body, is_correct, sort_order) values\n  "
            + ",\n  ".join(opt_rows)
            + ";"
        )
        out_lines.append("")

    out_lines.append("-- Summary")
    out_lines.append(
        "select count(*) as sba_count from public.questions "
        f"where exam_id = '{EXAM_ID}' and question_type = 'sba' and is_active = true "
        "and coalesce(payload->>'source','') = 'plab1-xlsx';"
    )
    out_lines.append(
        "select t.name, count(*) as n from public.questions q "
        "left join public.topics t on t.id = q.topic_id "
        f"where q.exam_id = '{EXAM_ID}' and coalesce(q.payload->>'source','') = 'plab1-xlsx' "
        "group by t.name order by n desc;"
    )

    out_path = Path(args.output)
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text("\n".join(out_lines) + "\n", encoding="utf-8")

    print(f"Wrote {out_path} — imported={imported} skipped={skipped}", file=sys.stderr)
    if topic_counts:
        print("Topic counts:", sorted(topic_counts.items(), key=lambda x: -x[1])[:20], file=sys.stderr)
    if unmapped_topics:
        print("Unmapped topics (left topic_id null):", unmapped_topics, file=sys.stderr)
    return 0 if imported > 0 else 1


if __name__ == "__main__":
    raise SystemExit(main())
