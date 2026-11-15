import { Link, Navigate, useParams } from 'react-router-dom'
import { useEffect, useState } from 'react'
import { AppShell } from '@/components/layout/AppShell'
import { emailToUsername } from '@/features/auth/username'
import { useExam } from '@/hooks/useExam'
import { supabase } from '@/lib/supabase'
import { TopicProgressPanel } from '@/modules/shared/topics/TopicProgressPanel'
import type { Profile } from '@/types/database'

export function AdminUserTopicsPage() {
  const { userId = '' } = useParams()
  const { exam, topics, loading: examLoading } = useExam()
  const [profile, setProfile] = useState<Profile | null>(null)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    if (!userId) return
    void (async () => {
      const { data, error: err } = await supabase.from('profiles').select('*').eq('id', userId).maybeSingle()
      if (err) setError(err.message)
      else setProfile((data as Profile | null) ?? null)
    })()
  }, [userId])

  if (!userId) return <Navigate to="/admin/users" replace />

  const label =
    profile?.display_name || (profile ? emailToUsername(profile.email) : null) || profile?.email || 'User'

  return (
    <AppShell title="User Topics">
      <div className="mb-4 flex flex-wrap items-center justify-between gap-2">
        <div>
          <p className="font-display text-lg font-semibold text-accent">{label}</p>
          <p className="text-xs text-muted">Home-page topic summary for this account</p>
        </div>
        <Link to="/admin/users" className="text-sm text-accent hover:underline">
          ← Back to users
        </Link>
      </div>
      {error ? <p className="mb-3 text-sm text-incorrect">{error}</p> : null}
      {examLoading ? <p className="text-sm text-muted">Loading exam…</p> : null}
      {exam ? (
        <TopicProgressPanel examId={exam.id} userId={userId} topics={topics} />
      ) : !examLoading ? (
        <p className="text-sm text-muted">No exam loaded.</p>
      ) : null}
    </AppShell>
  )
}
