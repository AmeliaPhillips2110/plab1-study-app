import { Navigate, Route, Routes } from 'react-router-dom'
import { HomePage } from '@/modules/plab1/pages/HomePage'
import { LoginPage } from '@/routes/login'
import { RedirectIfAuthed, RequireAdmin, RequireAuth } from '@/routes/protect'
import { AdminHomePage } from '@/routes/admin/AdminHomePage'
import { AdminQuestionsPage } from '@/routes/admin/AdminQuestionsPage'
import { AdminSettingsPage } from '@/routes/admin/AdminSettingsPage'
import { AdminUsersPage } from '@/routes/admin/AdminUsersPage'
import { SetupHintPage } from '@/routes/SetupHintPage'
import { StudySetupPage } from '@/routes/study/StudySetupPage'

export function AppRoutes() {
  return (
    <Routes>
      <Route element={<RedirectIfAuthed />}>
        <Route path="/login" element={<LoginPage />} />
      </Route>

      <Route path="/setup-hint" element={<SetupHintPage />} />

      <Route element={<RequireAuth />}>
        <Route path="/" element={<HomePage />} />
        <Route path="/study" element={<StudySetupPage />} />
      </Route>

      <Route element={<RequireAdmin />}>
        <Route path="/admin" element={<AdminHomePage />} />
        <Route path="/admin/questions" element={<AdminQuestionsPage />} />
        <Route path="/admin/settings" element={<AdminSettingsPage />} />
        <Route path="/admin/users" element={<AdminUsersPage />} />
      </Route>

      <Route path="*" element={<Navigate to="/" replace />} />
    </Routes>
  )
}
