import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { GlossaryEditor } from '@/features/glossary/GlossaryEditor'
import { fetchDefaultExam } from '@/lib/exam'

export function AdminGlossaryPage() {
  const [examId, setExamId] = useState<string | null>(null)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    void (async () => {
      const exam = await fetchDefaultExam()
      if (!exam) setError('No exam found.')
      else setExamId(exam.id)
    })()
  }, [])

  return (
    <AppShell>
      <div className="mx-auto max-w-3xl space-y-6 px-4 py-8">
        <div>
          <Link to="/admin" className="text-sm text-accent hover:underline">
            ← Admin
          </Link>
          <h1 className="mt-2 font-display text-2xl font-semibold">Glossary editor</h1>
          <p className="mt-1 text-sm text-muted">
            Terms appear as tap/hover definitions in question stems.
          </p>
        </div>
        {error ? <p className="text-sm text-incorrect">{error}</p> : null}
        {examId ? <GlossaryEditor examId={examId} /> : null}
      </div>
    </AppShell>
  )
}
