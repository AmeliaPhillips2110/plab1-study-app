import { useEffect, useMemo, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import { Button } from '@/components/ui/Button'
import { countWords, fetchGlossaryTerms } from '@/features/glossary/glossaryApi'
import { saveMistakeTags } from '@/features/mistakes'
import { LabValuesButton } from '@/features/lab-values'
import { saveReadingSpeedWpm } from '@/features/preferences/readingSpeed'
import { useExam } from '@/hooks/useExam'
import { QuestionView } from '@/modules/shared/quiz-engine/QuestionView'
import {
  createStudySession,
  finishStudySession,
  saveAttempt,
  updateSpacedRepetition,
} from '@/modules/shared/quiz-engine/persist'
import { formatDuration } from '@/modules/shared/quiz-engine/pace'
import { selectQuestionsForSession } from '@/modules/shared/quiz-engine/selectQuestions'
import { summariseAttempts } from '@/modules/shared/quiz-engine/scoring'
import type { GlossaryTerm, QuestionWithOptions } from '@/types/database'
import type { LocalAttempt, SessionSetupConfig } from '@/types/quiz'
import { FORMAT_LABELS, SESSION_TYPE_LABELS } from '@/types/quiz'

type Props = {
  userId: string
  config: SessionSetupConfig
  onExit?: () => void
}

type Phase = 'loading' | 'running' | 'summary' | 'error'

type AttemptMap = Record<
  string,
  LocalAttempt & { answerChanges: number }
>

export function SessionRunner({ userId, config, onExit }: Props) {
  const { topics } = useExam()
  const [phase, setPhase] = useState<Phase>('loading')
  const [error, setError] = useState<string | null>(null)
  const [questions, setQuestions] = useState<QuestionWithOptions[]>([])
  const [glossaryTerms, setGlossaryTerms] = useState<GlossaryTerm[]>([])
  const [sessionId, setSessionId] = useState<string | null>(null)
  const [index, setIndex] = useState(0)
  const [attemptMap, setAttemptMap] = useState<AttemptMap>({})
  const [draftByQuestion, setDraftByQuestion] = useState<Record<string, string>>({})
  const [saving, setSaving] = useState(false)
  const [finalPercent, setFinalPercent] = useState<number | null>(null)
  const [questionElapsedSec, setQuestionElapsedSec] = useState(0)
  const questionStartedAt = useRef(Date.now())
  const bootstrapped = useRef(false)
  const attemptMapRef = useRef<AttemptMap>({})
  const draftRef = useRef<Record<string, string>>({})
  const sessionIdRef = useRef<string | null>(null)
  const questionsRef = useRef<QuestionWithOptions[]>([])
  const indexRef = useRef(0)
  const phaseRef = useRef<Phase>('loading')

  useEffect(() => {
    attemptMapRef.current = attemptMap
  }, [attemptMap])
  useEffect(() => {
    draftRef.current = draftByQuestion
  }, [draftByQuestion])
  useEffect(() => {
    sessionIdRef.current = sessionId
  }, [sessionId])
  useEffect(() => {
    questionsRef.current = questions
  }, [questions])
  useEffect(() => {
    indexRef.current = index
  }, [index])
  useEffect(() => {
    phaseRef.current = phase
  }, [phase])

  const topicNameById = useMemo(() => {
    const m: Record<string, string> = {}
    for (const t of topics) m[t.id] = t.name
    return m
  }, [topics])

  // Persist draft selection + answered progress when leaving the page
  useEffect(() => {
    function persistDraft() {
      const sid = sessionIdRef.current
      if (!sid || phaseRef.current !== 'running') return
      const q = questionsRef.current[indexRef.current]
      const draft = q ? draftRef.current[q.id] : undefined
      const payload = {
        version: 1,
        index: indexRef.current,
        drafts: draftRef.current,
        answeredIds: Object.keys(attemptMapRef.current),
        lastSelected: draft ?? null,
        savedAt: new Date().toISOString(),
      }
      try {
        localStorage.setItem(`plaboratory-study-draft:${sid}`, JSON.stringify(payload))
      } catch {
        /* ignore */
      }
    }
    window.addEventListener('beforeunload', persistDraft)
    window.addEventListener('pagehide', persistDraft)
    return () => {
      persistDraft()
      window.removeEventListener('beforeunload', persistDraft)
      window.removeEventListener('pagehide', persistDraft)
    }
  }, [])

  const attempts = useMemo(() => Object.values(attemptMap), [attemptMap])
  const openProgress = Boolean(config.openEnded)

  useEffect(() => {
    if (phase !== 'running') return
    questionStartedAt.current = Date.now()
    setQuestionElapsedSec(0)
    const id = window.setInterval(() => {
      setQuestionElapsedSec(Math.floor((Date.now() - questionStartedAt.current) / 1000))
    }, 500)
    return () => window.clearInterval(id)
  }, [phase, index])

  useEffect(() => {
    if (bootstrapped.current) return
    bootstrapped.current = true

    void (async () => {
      const [selected, glossary] = await Promise.all([
        selectQuestionsForSession(config, userId),
        fetchGlossaryTerms(config.examId),
      ])
      if (selected.error || selected.questions.length === 0) {
        const exhausted =
          config.unseenOnly &&
          (!selected.error || /matched these filters|unseen|new questions/i.test(selected.error))
        setError(
          exhausted
            ? 'No new questions left — you have already answered every available item in the bank.'
            : selected.error ?? 'No questions available for this session.',
        )
        setPhase('error')
        return
      }

      const created = await createStudySession({
        userId,
        config,
        questionCount: selected.questions.length,
      })
      if (created.error || !created.sessionId) {
        setError(created.error ?? 'Could not start session.')
        setPhase('error')
        return
      }

      setGlossaryTerms(glossary.terms)
      setQuestions(selected.questions)
      setSessionId(created.sessionId)
      setPhase('running')
    })()
  }, [config, userId])

  async function endSession(nextMap: AttemptMap) {
    if (!sessionId) return
    const list = Object.values(nextMap)
    const finished = await finishStudySession({ sessionId, attempts: list })
    setFinalPercent(finished.percent)
    setPhase('summary')
    // Auto-update reading speed from this session's timed stems.
    const totalMs = list.reduce((s, a) => s + (a.timeSpentMs ?? 0), 0)
    const totalWords = list.reduce((s, a) => {
      const q = questions.find((x) => x.id === a.questionId)
      return s + (q ? countWords(q.stem) : 0)
    }, 0)
    if (totalMs > 0 && totalWords > 0) {
      const wpm = Math.round(totalWords / (totalMs / 60_000))
      if (wpm >= 80 && wpm <= 600) {
        void saveReadingSpeedWpm(userId, wpm)
      }
    }
  }

  async function handleSubmit(args: {
    result: LocalAttempt['result']
    selectedOptionId: string | null
    payload: LocalAttempt['responsePayload']
    timeSpentMs?: number | null
    answerChanges: number
  }) {
    if (!sessionId) return
    const q = questions[index]
    if (!q) return
    if (attemptMapRef.current[q.id]) {
      // Already saved — just advance
      if (index + 1 >= questions.length) await endSession(attemptMapRef.current)
      else setIndex((i) => i + 1)
      return
    }
    setSaving(true)
    const timeSpentMs = args.timeSpentMs ?? null
    const attempt: AttemptMap[string] = {
      questionId: q.id,
      selectedOptionId: args.selectedOptionId,
      result: args.result,
      responsePayload: args.payload,
      timeSpentMs,
      answerChanges: args.answerChanges,
    }

    const save = await saveAttempt({
      sessionId,
      examId: config.examId,
      userId,
      questionId: q.id,
      selectedOptionId: args.selectedOptionId,
      result: args.result,
      responsePayload: args.payload,
      timeSpentMs,
    })
    if (save.error || !save.attemptId) {
      setError(save.error ?? 'Could not save attempt.')
      setSaving(false)
      return
    }

    if (
      (args.result === 'incorrect' || args.result === 'partial') &&
      args.payload.mistakeTags &&
      args.payload.mistakeTags.length > 0
    ) {
      const tagErr = await saveMistakeTags({
        attemptId: save.attemptId,
        tags: args.payload.mistakeTags.map((tag) => ({
          tag,
          note: args.payload.mistakeNote ?? null,
          source: 'manual',
        })),
      })
      if (tagErr.error) {
        setError(tagErr.error)
        setSaving(false)
        return
      }
    }

    await updateSpacedRepetition({
      userId,
      examId: config.examId,
      questionId: q.id,
      grade: args.payload.grade,
      result: args.result,
    })

    const nextMap = { ...attemptMapRef.current, [q.id]: attempt }
    setAttemptMap(nextMap)
    setSaving(false)

    if (index + 1 >= questions.length) {
      await endSession(nextMap)
      return
    }
    setIndex((i) => i + 1)
  }

  async function handleFinishEarly() {
    if (!sessionId || phase !== 'running') return
    const n = Object.keys(attemptMapRef.current).length
    if (
      !window.confirm(
        n === 0 ? 'Finish without answering any questions?' : `Finish now with ${n} answered?`,
      )
    ) {
      return
    }
    setSaving(true)
    await endSession(attemptMapRef.current)
    setSaving(false)
  }

  if (phase === 'loading') {
    return <p className="text-sm text-muted">Preparing your session…</p>
  }

  if (phase === 'error') {
    return (
      <div className="flex flex-col gap-3">
        <p className="text-sm text-incorrect">{error}</p>
        <div className="flex gap-2">
          <Link className="text-sm text-accent hover:underline" to="/study">
            Back to Practice
          </Link>
          {onExit ? (
            <Button variant="ghost" onClick={onExit}>
              Close
            </Button>
          ) : null}
        </div>
      </div>
    )
  }

  if (phase === 'summary') {
    const stats = summariseAttempts(attempts)
    const totalMs = attempts.reduce((s, a) => s + (a.timeSpentMs ?? 0), 0)
    const answered = attempts.length || 1
    const avgTimeSec = Math.round(totalMs / answered / 1000)
    const totalWords = attempts.reduce((s, a) => {
      const q = questions.find((x) => x.id === a.questionId)
      return s + (q ? countWords(q.stem) : 0)
    }, 0)
    const minutes = totalMs / 60000
    const avgWpm = minutes > 0 ? Math.round(totalWords / minutes) : 0
    const timesChanged = attempts.reduce(
      (s, a) => s + (a.answerChanges || a.responsePayload.answerChanges || 0),
      0,
    )

    return (
      <div className="flex w-full flex-col gap-4 rounded-md border border-border bg-surface p-4">
        <h2 className="font-display text-xl font-semibold">Session Complete</h2>
        <p className="text-sm text-muted">
          {config.openEnded ? 'Open Quiz' : SESSION_TYPE_LABELS[config.sessionType]} ·{' '}
          {FORMAT_LABELS[config.presentationFormat]}
        </p>
        <dl className="grid grid-cols-2 gap-3 text-sm sm:grid-cols-3 lg:grid-cols-6">
          <Stat label="Score" value={`${finalPercent ?? stats.percent}%`} />
          <Stat label="Correct" value={String(stats.correct)} />
          <Stat label="Incorrect" value={String(stats.incorrect)} />
          <Stat label="Average WPM" value={String(avgWpm)} />
          <Stat label="Time Per Question" value={`${avgTimeSec}s`} />
          <Stat label="Times Changed" value={String(timesChanged)} />
        </dl>
        <div className="flex flex-wrap gap-2">
          <Link
            to="/study"
            className="inline-flex items-center rounded-md bg-accent px-3 py-2 text-sm font-medium text-white hover:bg-accent-hover"
          >
            Practice Hub
          </Link>
          <Link
            to="/tests"
            className="inline-flex items-center rounded-md border border-border bg-surface px-3 py-2 text-sm font-medium hover:bg-accent-subtle"
          >
            Tests Hub
          </Link>
          <Link
            to="/attempts"
            className="inline-flex items-center rounded-md border border-border bg-surface px-3 py-2 text-sm font-medium hover:bg-accent-subtle"
          >
            Attempt Log
          </Link>
          <Link
            to="/kpis"
            className="inline-flex items-center rounded-md border border-border bg-surface px-3 py-2 text-sm font-medium hover:bg-accent-subtle"
          >
            KPIs
          </Link>
          <Link
            to="/"
            className="inline-flex items-center rounded-md border border-border bg-surface px-3 py-2 text-sm font-medium hover:bg-accent-subtle"
          >
            Home
          </Link>
          <Link
            to="/glossary"
            className="inline-flex items-center rounded-md border border-border bg-surface px-3 py-2 text-sm font-medium hover:bg-accent-subtle"
          >
            Glossary
          </Link>
        </div>
      </div>
    )
  }

  const current = questions[index]
  if (!current) return null
  const locked = attemptMap[current.id] ?? null
  const topicName = current.topic_id ? topicNameById[current.topic_id] ?? null : null

  return (
    <div className="flex w-full flex-col gap-4">
      <div className="flex flex-wrap items-center justify-between gap-2 text-sm text-muted">
        <span>
          {config.openEnded ? 'Open Quiz' : SESSION_TYPE_LABELS[config.sessionType]} ·{' '}
          {FORMAT_LABELS[config.openEnded ? 'sba' : config.presentationFormat]}
        </span>
        <div className="flex flex-wrap items-center gap-2">
          <LabValuesButton />
          <span className="tabular-nums font-medium text-fg" aria-live="polite">
            This question: {formatDuration(questionElapsedSec)}
          </span>
        </div>
      </div>
      {saving ? <p className="text-xs text-muted">Saving…</p> : null}
      {error ? <p className="text-sm text-incorrect">{error}</p> : null}
      <QuestionView
        key={`${current.id}-${locked ? 'locked' : 'live'}`}
        question={current}
        format={config.openEnded ? 'sba' : config.presentationFormat}
        rapidFireSeconds={config.openEnded ? undefined : config.rapidFireSeconds ?? 15}
        index={index}
        total={questions.length}
        openProgress={openProgress}
        completedCount={attempts.length}
        glossaryTerms={glossaryTerms}
        topicName={topicName}
        lockedResult={locked?.result ?? null}
        lockedSelectedId={locked?.selectedOptionId ?? null}
        initialSelectedId={draftByQuestion[current.id] ?? null}
        canGoBack={index > 0}
        onBack={() => setIndex((i) => Math.max(0, i - 1))}
        onFinish={() => void handleFinishEarly()}
        finishDisabled={saving}
        onDraftSelect={(optionId) => {
          if (!optionId) return
          setDraftByQuestion((prev) => ({ ...prev, [current.id]: optionId }))
        }}
        onSubmit={(args) =>
          void handleSubmit({
            result: args.result,
            selectedOptionId: args.selectedOptionId,
            payload: args.payload,
            timeSpentMs: args.timeSpentMs,
            answerChanges: args.answerChanges,
          })
        }
      />
    </div>
  )
}

function Stat({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded border border-border px-3 py-2">
      <dt className="text-xs text-muted">{label}</dt>
      <dd className="text-lg font-semibold">{value}</dd>
    </div>
  )
}
