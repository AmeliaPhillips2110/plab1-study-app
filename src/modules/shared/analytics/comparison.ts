import { supabase } from '@/lib/supabase'
import { isIncludedInComparison as include } from '@/modules/shared/analytics/comparisonInclude'
import type { Profile, UserPreferences } from '@/types/database'

export { isIncludedInComparison } from '@/modules/shared/analytics/comparisonInclude'

export type PeerRow = {
  userId: string
  displayName: string
  attemptCount: number
  gradedCount: number
  correctCount: number
  accuracyPercent: number
  isCurrentUser: boolean
}

export type GroupComparison = {
  peers: PeerRow[]
  groupAverageAccuracy: number
  optedInCount: number
  optedOutCount: number
  currentUserAccuracy: number | null
}

/**
 * Admin-only peer comparison. Excludes users with comparison_opt_out = true.
 * Students should not call this (RLS may still hide other profiles).
 */
export async function fetchGroupComparison(params: {
  examId: string
  currentUserId: string
}): Promise<{ data: GroupComparison | null; error: string | null }> {
  const [{ data: profiles, error: pErr }, { data: prefs, error: prefErr }] = await Promise.all([
    supabase.from('profiles').select('*').eq('role', 'student'),
    supabase.from('user_preferences').select('*'),
  ])

  if (pErr) return { data: null, error: pErr.message }
  if (prefErr) return { data: null, error: prefErr.message }

  const prefMap = new Map(
    ((prefs as UserPreferences[] | null) ?? []).map((p) => [p.user_id, p]),
  )
  const students = (profiles as Profile[] | null) ?? []
  let optedOutCount = 0
  const optedIn = students.filter((p) => {
    const optOut = prefMap.get(p.id)?.comparison_opt_out ?? false
    if (!include(optOut)) {
      optedOutCount += 1
      return false
    }
    return true
  })

  // Always include current user in the result set for personal delta, even if they opted out of the group avg.
  const ids = [...new Set([...optedIn.map((p) => p.id), params.currentUserId])]

  const { data: attempts, error: aErr } = await supabase
    .from('attempts')
    .select('user_id, result')
    .eq('exam_id', params.examId)
    .in('user_id', ids)
    .limit(5000)

  if (aErr) return { data: null, error: aErr.message }

  const stats = new Map<string, { attempts: number; graded: number; correct: number }>()
  for (const id of ids) stats.set(id, { attempts: 0, graded: 0, correct: 0 })
  for (const row of (attempts as { user_id: string; result: string }[] | null) ?? []) {
    const s = stats.get(row.user_id) ?? { attempts: 0, graded: 0, correct: 0 }
    s.attempts += 1
    if (row.result === 'correct' || row.result === 'incorrect') {
      s.graded += 1
      if (row.result === 'correct') s.correct += 1
    }
    stats.set(row.user_id, s)
  }

  const profileMap = new Map(students.map((p) => [p.id, p]))
  // Ensure current user profile available even if admin
  if (!profileMap.has(params.currentUserId)) {
    const { data: me } = await supabase
      .from('profiles')
      .select('*')
      .eq('id', params.currentUserId)
      .maybeSingle()
    if (me) profileMap.set(params.currentUserId, me as Profile)
  }

  const peers: PeerRow[] = optedIn.map((p) => {
    const s = stats.get(p.id) ?? { attempts: 0, graded: 0, correct: 0 }
    return {
      userId: p.id,
      displayName: p.display_name || p.email,
      attemptCount: s.attempts,
      gradedCount: s.graded,
      correctCount: s.correct,
      accuracyPercent: s.graded ? Math.round((s.correct / s.graded) * 1000) / 10 : 0,
      isCurrentUser: p.id === params.currentUserId,
    }
  })

  const withData = peers.filter((p) => p.gradedCount > 0)
  const groupAverageAccuracy = withData.length
    ? Math.round(
        (withData.reduce((sum, p) => sum + p.accuracyPercent, 0) / withData.length) * 10,
      ) / 10
    : 0

  const meStats = stats.get(params.currentUserId)
  const currentUserAccuracy =
    meStats && meStats.graded
      ? Math.round((meStats.correct / meStats.graded) * 1000) / 10
      : null

  peers.sort((a, b) => b.accuracyPercent - a.accuracyPercent)

  return {
    data: {
      peers,
      groupAverageAccuracy,
      optedInCount: optedIn.length,
      optedOutCount,
      currentUserAccuracy,
    },
    error: null,
  }
}
