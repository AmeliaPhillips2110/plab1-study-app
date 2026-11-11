import { countWords, estimatedReadSeconds } from '@/features/glossary/glossaryApi'

type Props = {
  stem: string
  readingSpeedWpm: number | null | undefined
}

export function ReadingTip({ stem, readingSpeedWpm }: Props) {
  const words = countWords(stem)
  const seconds = estimatedReadSeconds(words, readingSpeedWpm)
  const long = words >= 80
  const wpm = readingSpeedWpm && readingSpeedWpm > 0 ? readingSpeedWpm : 200

  return (
    <div className="rounded-md border border-border bg-accent-subtle/60 px-3 py-2 text-sm">
      <p className="font-medium text-fg">Reading tip</p>
      <p className="mt-1 text-muted">
        Stem ≈ {words} words · ~{seconds}s at {wpm} WPM
        {long
          ? '. Long stem: skim the last line (the ask) first, then scan for age/sex/acuity/red flags before options.'
          : '. Read the question ask first if the stem feels dense.'}
      </p>
    </div>
  )
}
