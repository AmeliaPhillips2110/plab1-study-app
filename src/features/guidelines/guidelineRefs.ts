export type GuidelineRef = {
  label: string
  url: string
}

type PayloadShape = {
  guidelines?: GuidelineRef[]
  guideline_refs?: GuidelineRef[]
}

/** Known UK guidance hubs for auto-linking from explanation text. */
const AUTO_PATTERNS: Array<{ re: RegExp; label: (m: RegExpMatchArray) => string; url: (m: RegExpMatchArray) => string }> = [
  {
    re: /\bNICE\s+(NG|CG|QS|TA)?\s*(\d{1,4})\b/gi,
    label: (m) => `NICE ${[m[1], m[2]].filter(Boolean).join(' ')}`.trim(),
    url: (m) => {
      const code = `${(m[1] ?? 'ng').toLowerCase()}${m[2]}`
      return `https://www.nice.org.uk/guidance/${code}`
    },
  },
  {
    re: /\bBNF\b/gi,
    label: () => 'BNF',
    url: () => 'https://bnf.nice.org.uk/',
  },
  {
    re: /\bFSRH\b/gi,
    label: () => 'FSRH',
    url: () => 'https://www.fsrh.org/',
  },
  {
    re: /\bGMC\b/gi,
    label: () => 'GMC',
    url: () => 'https://www.gmc-uk.org/',
  },
]

function dedupe(refs: GuidelineRef[]): GuidelineRef[] {
  const seen = new Set<string>()
  const out: GuidelineRef[] = []
  for (const r of refs) {
    const key = r.url.toLowerCase()
    if (seen.has(key)) continue
    seen.add(key)
    out.push(r)
  }
  return out
}

/** Prefer payload.guidelines; also surface NICE/BNF/FSRH/GMC mentions in explanation text. */
export function collectGuidelineRefs(params: {
  explanation?: string | null
  payload?: Record<string, unknown> | null
}): GuidelineRef[] {
  const payload = (params.payload ?? {}) as PayloadShape
  const fromPayload = [
    ...(Array.isArray(payload.guidelines) ? payload.guidelines : []),
    ...(Array.isArray(payload.guideline_refs) ? payload.guideline_refs : []),
  ].filter((r) => r && typeof r.label === 'string' && typeof r.url === 'string')

  const text = params.explanation ?? ''
  const fromText: GuidelineRef[] = []
  for (const pattern of AUTO_PATTERNS) {
    pattern.re.lastIndex = 0
    let match: RegExpExecArray | null
    while ((match = pattern.re.exec(text)) != null) {
      fromText.push({ label: pattern.label(match), url: pattern.url(match) })
    }
  }

  // Generic “NICE” mention without a code → homepage
  if (/\bNICE\b/i.test(text) && !fromText.some((r) => /nice\.org\.uk/i.test(r.url))) {
    fromText.push({ label: 'NICE', url: 'https://www.nice.org.uk/' })
  }

  return dedupe([...fromPayload, ...fromText])
}
