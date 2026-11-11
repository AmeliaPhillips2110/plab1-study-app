import { ThemeToggle } from '@/components/layout/ThemeToggle'
import { LoginForm } from '@/features/auth'

export function LoginPage() {
  return (
    <div className="min-h-screen bg-bg text-fg">
      <div className="mx-auto flex min-h-screen w-full max-w-lg flex-col justify-center gap-6 px-4 py-8 sm:gap-8 sm:py-10">
        <div className="flex items-start justify-between gap-4">
          <div className="min-w-0">
            <p className="text-2xl font-semibold tracking-tight">PLABoratory</p>
            <p className="mt-1 text-sm text-muted">PLAB 1 study app — sign in to continue</p>
          </div>
          <ThemeToggle />
        </div>
        <LoginForm />
      </div>
    </div>
  )
}
