import { lazy, Suspense } from 'react'
import { Navigate, Route, Routes } from 'react-router-dom'
import { HomePage } from '@/modules/plab1/pages/HomePage'
import { LoginPage } from '@/routes/login'
import { RedirectIfAuthed, RequireAdmin, RequireAuth } from '@/routes/protect'
import { AdminHomePage } from '@/routes/admin/AdminHomePage'
import { AdminQuestionsPage } from '@/routes/admin/AdminQuestionsPage'
import { AdminSettingsPage } from '@/routes/admin/AdminSettingsPage'
import { AdminUsersPage } from '@/routes/admin/AdminUsersPage'
import { SetupHintPage } from '@/routes/SetupHintPage'
import { StudyHubPage } from '@/routes/study/StudyHubPage'
import { StudyModePage } from '@/routes/study/StudyModePage'
import { TestHubPage } from '@/modules/plab1/pages/TestHubPage'
import { TestModePage } from '@/modules/plab1/pages/TestModePage'
import { AttemptsPage } from '@/routes/attempts/AttemptsPage'
import { QuestionTimelinePage } from '@/routes/attempts/QuestionTimelinePage'
import { SessionTimelinePage } from '@/routes/attempts/SessionTimelinePage'
import { DashboardPage } from '@/routes/dashboard/DashboardPage'
import { AdminComparisonPage } from '@/routes/admin/AdminComparisonPage'
import { AdminGlossaryPage } from '@/routes/admin/AdminGlossaryPage'
import { GlossaryPage } from '@/routes/glossary/GlossaryPage'
import { AccountPage } from '@/routes/account/AccountPage'

const AdminImportPage = lazy(() =>
  import('@/routes/admin/AdminImportPage').then((m) => ({ default: m.AdminImportPage })),
)

export function AppRoutes() {
  return (
    <Routes>
      <Route element={<RedirectIfAuthed />}>
        <Route path="/login" element={<LoginPage />} />
      </Route>

      <Route path="/setup-hint" element={<SetupHintPage />} />

      <Route element={<RequireAuth />}>
        <Route path="/" element={<HomePage />} />
        <Route path="/study" element={<StudyHubPage />} />
        <Route path="/study/:modeSlug" element={<StudyModePage />} />
        <Route path="/tests" element={<TestHubPage />} />
        <Route path="/tests/:modeSlug" element={<TestModePage />} />
        <Route path="/mock" element={<Navigate to="/tests/full-test" replace />} />
        <Route path="/attempts" element={<AttemptsPage />} />
        <Route path="/attempts/session/:sessionId" element={<SessionTimelinePage />} />
        <Route path="/attempts/question/:questionId" element={<QuestionTimelinePage />} />
        <Route path="/dashboard" element={<DashboardPage />} />
        <Route path="/kpis" element={<DashboardPage />} />
        <Route path="/glossary" element={<GlossaryPage />} />
        <Route path="/account" element={<AccountPage />} />
      </Route>

      <Route element={<RequireAdmin />}>
        <Route path="/admin" element={<AdminHomePage />} />
        <Route path="/admin/questions" element={<AdminQuestionsPage />} />
        <Route
          path="/admin/import"
          element={
            <Suspense fallback={<p className="p-6 text-sm text-muted">Loading import…</p>}>
              <AdminImportPage />
            </Suspense>
          }
        />
        <Route path="/admin/settings" element={<AdminSettingsPage />} />
        <Route path="/admin/users" element={<AdminUsersPage />} />
        <Route path="/admin/comparison" element={<AdminComparisonPage />} />
        <Route path="/admin/glossary" element={<AdminGlossaryPage />} />
      </Route>

      <Route path="*" element={<Navigate to="/" replace />} />
    </Routes>
  )
}
