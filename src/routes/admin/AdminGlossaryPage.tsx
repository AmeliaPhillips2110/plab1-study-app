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
      if (!exam) setError('No exam found yet.')
      else setExamId(exam.id)
    })()
  }, [])

  return (
    <AppShell title="Glossary Editor">
      <div className="mx-auto max-w-3xl space-y-6">
        <div className="text-center">
          <Link to="/admin" className="text-sm text-accent hover:underline">
            ← Admin
          </Link>
          <p className="mt-1 text-sm text-muted">
            Terms appear as tap/hover definitions in question stems.
          </p>
        </div>
        {error ? <p className="text-center text-sm text-incorrect">{error}</p> : null}
        {examId ? <GlossaryEditor examId={examId} /> : null}
      </div>
    </AppShell>
  )
}
