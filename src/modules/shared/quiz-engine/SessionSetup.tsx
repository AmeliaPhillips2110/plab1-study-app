import { useMemo, useState, type FormEvent } from 'react'
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

type Props = {
  examId: string
  topics: Topic[]
  onStart: (config: SessionSetupConfig) => void
}

export function SessionSetup({ examId, topics, onStart }: Props) {
  const [sessionType, setSessionType] = useState<SessionType>('topic')
  const [format, setFormat] = useState<PresentationFormat>('sba')
  const [topicId, setTopicId] = useState(topics[0]?.id ?? '')
  const [weaknessVariant, setWeaknessVariant] = useState<WeaknessVariant>('recent_mistakes')
  const [unseenOnly, setUnseenOnly] = useState(false)
  const [limit, setLimit] = useState('10')
  const [rapidSeconds, setRapidSeconds] = useState('15')

  const topicOptions = useMemo(
    () => topics.map((t) => ({ value: t.id, label: t.name })),
    [topics],
  )

  function onSubmit(e: FormEvent) {
    e.preventDefault()
    const questionLimit = Math.min(50, Math.max(1, Number(limit) || 10))
    const rapidFireSeconds = Math.min(120, Math.max(5, Number(rapidSeconds) || 15))

    let presentationFormat = format
    if (sessionType === 'flashcard') presentationFormat = 'flashcard'

    onStart({
      examId,
      sessionType,
      presentationFormat,
      topicId: sessionType === 'topic' ? topicId : null,
      weaknessVariant: sessionType === 'weakness' ? weaknessVariant : null,
      unseenOnly,
      questionLimit,
      rapidFireSeconds,
    })
  }

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
          <p className="text-sm text-incorrect">No topics loaded. Run the seed SQL.</p>
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

      <label className="inline-flex items-center gap-2 text-sm">
        <input
          type="checkbox"
          checked={unseenOnly}
          onChange={(e) => setUnseenOnly(e.target.checked)}
        />
        Unseen only (skip questions you have already attempted)
      </label>

      <p className="text-xs text-muted">
        Tutor mode: you get immediate feedback and an explanation after each item. Full mocks and
        as-many-as-you-can arrive in Stage c.
      </p>

      <Button type="submit" disabled={sessionType === 'topic' && !topicId}>
        Start session
      </Button>
    </form>
  )
}
