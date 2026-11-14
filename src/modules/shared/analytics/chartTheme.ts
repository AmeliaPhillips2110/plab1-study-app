import type { CSSProperties } from 'react'

/** Stage 0 token colours for Recharts (hex — SVG cannot use CSS vars reliably). */
export const CHART = {
  accent: '#337d8a',
  accentHover: '#2a6873',
  correct: '#2f6f6a',
  incorrect: '#b54a4a',
  skipped: '#eab308',
  muted: '#737373',
  border: '#404040',
  grid: '#262626',
  surface: '#171717',
  fg: '#f5f5f5',
  pass: '#337d8a',
  series: ['#337d8a', '#2f6f6a', '#eab308', '#b54a4a', '#2a6873', '#d4d4d4'],
} as const

export const tooltipStyle: CSSProperties = {
  background: '#171717',
  border: '1px solid #262626',
  borderRadius: 6,
  color: '#f5f5f5',
  fontSize: 12,
}
