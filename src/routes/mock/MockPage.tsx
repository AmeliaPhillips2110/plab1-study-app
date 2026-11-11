import { Navigate } from 'react-router-dom'
import { useAuth } from '@/hooks/useAuth'
import { MockIntroPage } from '@/modules/plab1/pages/MockIntroPage'

export function MockPage() {
  const { user } = useAuth()
  if (!user) return <Navigate to="/login" replace />
  return <MockIntroPage />
}
