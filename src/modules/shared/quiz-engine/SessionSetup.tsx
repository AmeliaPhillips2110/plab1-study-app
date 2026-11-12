import { useEffect, useMemo, useState, type FormEvent } from 'react'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { Select } from '@/components/ui/Select'
import type { PresentationFormat, SessionType, Topic, WeaknessVariant } from '@/types/database'
import type { SessionSetupConfig } from '@/types/quiz'
import {
  FORMAT_LABELS,
  SESSION_TYPE_LABELS,
  STAGE_B_FORMATS,
  STAGE_B_SESSION_TYPES,
  WEAKNESS_LABELS,
} from '@/types/quiz'

export type SessionSetupInitial = {
  sessionType?: SessionType
  presentationFormat?: PresentationFormat
  topicId?: string | null
  weaknessVariant?: WeaknessVariant | null
  questionLimit?: number
  unseenOnly?: boolean
  openEnded?: boolean
  autostart?: boolean
}

type Props = {
  examId: string
  topics: Topic[]
  onStart: (config: SessionSetupConfig) => void
  initial?: SessionSetupInitial
}

export function SessionSetup({ examId, topics, onStart, initial }: Props) {
  const [sessionType, setSessionType] = useState<SessionType>(initial?.sessionType ?? 'topic')
  const [format, setFormat] = useState<PresentationFormat>(initial?.presentationFormat ?? 'sba')
  const [topicId, setTopicId] = useState(initial?.topicId || topics[0]?.id || '')
  const [weaknessVariant, setWeaknessVariant] = useState<WeaknessVariant>(
    initial?.weaknessVariant ?? 'recent_mistakes',
  )
  const [unseenOnly, setUnseenOnly] = useState(Boolean(initial?.unseenOnly))
  const [ukPracticeOnly, setUkPracticeOnly] = useState(false)
  const [patientCentredOnly, setPatientCentredOnly] = useState(false)
  const [longStemOnly, setLongStemOnly] = useState(false)
  const [limit, setLimit] = useState(String(initial?.questionLimit ?? 10))
  const [rapidSeconds, setRapidSeconds] = useState('15')
  const autostarted = useMemo(() => ({ done: false }), [])

  const topicOptions = useMemo(
    () => topics.map((t) => ({ value: t.id, label: t.name })),
    [topics],
  )

  function buildConfig(): SessionSetupConfig {
    const questionLimit = Math.min(50, Math.max(1, Number(limit) || 10))
    const rapidFireSeconds = Math.min(120, Math.max(5, Number(rapidSeconds) || 15))
    let presentationFormat = format
    if (sessionType === 'flashcard') presentationFormat = 'flashcard'
    return {
      examId,
      sessionType,
      presentationFormat,
      topicId: sessionType === 'topic' ? topicId : null,
      weaknessVariant: sessionType === 'weakness' ? weaknessVariant : null,
      unseenOnly,
      openEnded: Boolean(initial?.openEnded),
      questionLimit,
      rapidFireSeconds,
      ukPracticeOnly,
      patientCentredOnly,
      longStemOnly,
    }
  }

  function onSubmit(e: FormEvent) {
    e.preventDefault()
    onStart(buildConfig())
  }

  useEffect(() => {
    if (!initial?.autostart || autostarted.done) return
    if (sessionType === 'topic' && !topicId) return
    if (topics.length === 0 && sessionType === 'topic') return
    autostarted.done = true
    onStart(buildConfig())
    // eslint-disable-next-line react-hooks/exhaustive-deps -- one-shot autostart from Focus next links
  }, [initial?.autostart, topicId, topics.length, sessionType])

  return (
    <form onSubmit={onSubmit} className="flex max-w-xl flex-col gap-4 rounded-md border border-border bg-surface p-4">
      <Select
        label="Session type"
        name="sessionType"
        value={sessionType}
        onChange={(e) => {
          const next = e.target.value as SessionType
          setSessionType(next)
          if (next === 'flashcard') setFormat('flashcard')
        }}
        options={STAGE_B_SESSION_TYPES.map((t) => ({
          value: t,
          label: SESSION_TYPE_LABELS[t],
        }))}
      />

      <Select
        label="Presentation format"
        name="format"
        value={sessionType === 'flashcard' ? 'flashcard' : format}
        disabled={sessionType === 'flashcard'}
        onChange={(e) => setFormat(e.target.value as PresentationFormat)}
        options={STAGE_B_FORMATS.map((f) => ({
          value: f,
          label: FORMAT_LABELS[f],
        }))}
      />

      {sessionType === 'topic' ? (
        topicOptions.length > 0 ? (
          <Select
            label="Topic"
            name="topic"
            value={topicId}
            onChange={(e) => setTopicId(e.target.value)}
            options={topicOptions}
          />
        ) : (
          <p className="text-sm text-muted">No topics loaded yet.</p>
        )
      ) : null}

      {sessionType === 'weakness' ? (
        <Select
          label="Weakness variant"
          name="weakness"
          value={weaknessVariant}
          onChange={(e) => setWeaknessVariant(e.target.value as WeaknessVariant)}
          options={(Object.keys(WEAKNESS_LABELS) as WeaknessVariant[]).map((k) => ({
            value: k,
            label: WEAKNESS_LABELS[k],
          }))}
        />
      ) : null}

      <div className="grid gap-3 sm:grid-cols-2">
        <Input
          label="Question limit"
          name="limit"
          type="number"
          min={1}
          max={50}
          value={limit}
          onChange={(e) => setLimit(e.target.value)}
        />
        {format === 'rapid_fire' && sessionType !== 'flashcard' ? (
          <Input
            label="Rapid-fire seconds"
            name="rapid"
            type="number"
            min={5}
            max={120}
            value={rapidSeconds}
            onChange={(e) => setRapidSeconds(e.target.value)}
          />
        ) : (
          <div />
        )}
      </div>

      <fieldset className="space-y-2 rounded-md border border-border px-3 py-3">
        <legend className="px-1 text-sm font-medium">Filters</legend>
        <label className="flex items-center gap-2 text-sm">
          <input
            type="checkbox"
            checked={unseenOnly}
            onChange={(e) => setUnseenOnly(e.target.checked)}
          />
          Unseen only
        </label>
        <label className="flex items-center gap-2 text-sm">
          <input
            type="checkbox"
            checked={ukPracticeOnly}
            onChange={(e) => setUkPracticeOnly(e.target.checked)}
          />
          UK practice only
        </label>
        <label className="flex items-center gap-2 text-sm">
          <input
            type="checkbox"
            checked={patientCentredOnly}
            onChange={(e) => setPatientCentredOnly(e.target.checked)}
          />
          Patient-centred only
        </label>
        <label className="flex items-center gap-2 text-sm">
          <input
            type="checkbox"
            checked={longStemOnly}
            onChange={(e) => setLongStemOnly(e.target.checked)}
          />
          Long-stem practice (≥80 words)
        </label>
      </fieldset>

      <p className="text-xs text-muted">
        Tutor mode: you get immediate feedback and an explanation after each item. For exam
        conditions (no mid-test feedback), use <span className="text-fg">Mocks</span> instead.
        Long stems show a reading tip based on your glossary WPM preference.
      </p>

      <Button type="submit" disabled={sessionType === 'topic' && !topicId}>
        Start session
      </Button>
    </form>
  )
}
