import type { ReactNode } from 'react'

/** Simple stroke icons for Practice / Tests hub tiles (no emoji). */
const iconClass = 'h-5 w-5 shrink-0 text-accent'

function Svg({ children }: { children: ReactNode }) {
  return (
    <svg
      className={iconClass}
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="1.75"
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden
    >
      {children}
    </svg>
  )
}

const ICONS: Record<string, ReactNode> = {
  topics: (
    <Svg>
      <path d="M4 6h16M4 12h10M4 18h14" />
    </Svg>
  ),
  flashcards: (
    <Svg>
      <rect x="4" y="5" width="12" height="14" rx="1.5" />
      <path d="M9 5v14M16 8h4v11a1.5 1.5 0 0 1-1.5 1.5H9" />
    </Svg>
  ),
  'open-quiz': (
    <Svg>
      <circle cx="12" cy="12" r="8" />
      <path d="M12 8v4l2.5 2.5" />
    </Svg>
  ),
  'new-questions': (
    <Svg>
      <path d="M12 5v14M5 12h14" />
    </Svg>
  ),
  'daily-questions': (
    <Svg>
      <rect x="4" y="5" width="16" height="15" rx="2" />
      <path d="M8 3v4M16 3v4M4 10h16" />
    </Svg>
  ),
  'revise-flagged': (
    <Svg>
      <path d="M6 4v16M6 5h9l-1.5 3L15 11H6" />
    </Svg>
  ),
  'timed-drill': (
    <Svg>
      <circle cx="12" cy="13" r="7" />
      <path d="M12 10v3l2 1M9 4h6" />
    </Svg>
  ),
  'spaced-review': (
    <Svg>
      <path d="M4 12a8 8 0 0 1 14-5M20 12a8 8 0 0 1-14 5" />
      <path d="M18 4v3h-3M6 20v-3h3" />
    </Svg>
  ),
  'most-missed': (
    <Svg>
      <path d="M12 4v4M12 16v4M4 12h4M16 12h4" />
      <circle cx="12" cy="12" r="3" />
    </Svg>
  ),
  'error-tests': (
    <Svg>
      <circle cx="12" cy="12" r="8" />
      <path d="M12 8v5M12 16h.01" />
    </Svg>
  ),
  'long-questions': (
    <Svg>
      <path d="M5 6h14M5 10h14M5 14h10M5 18h8" />
    </Svg>
  ),
  'full-test': (
    <Svg>
      <rect x="5" y="4" width="14" height="16" rx="2" />
      <path d="M9 8h6M9 12h6M9 16h4" />
    </Svg>
  ),
  unlimited: (
    <Svg>
      <path d="M7 8c-2 0-3 1.5-3 4s1 4 3 4c2.5 0 3.5-2 5-4s2.5-4 5-4c2 0 3 1.5 3 4s-1 4-3 4c-2.5 0-3.5-2-5-4s-2.5-4-5-4z" />
    </Svg>
  ),
  'themed-test': (
    <Svg>
      <path d="M4 7h16M4 12h10M4 17h14" />
      <circle cx="18" cy="12" r="2" />
    </Svg>
  ),
}

const FALLBACK = (
  <Svg>
    <circle cx="12" cy="12" r="8" />
  </Svg>
)

export function modeIcon(slug: string): ReactNode {
  return ICONS[slug] ?? FALLBACK
}
