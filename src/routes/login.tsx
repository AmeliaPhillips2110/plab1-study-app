import { ThemeToggle } from '@/components/layout/ThemeToggle'
import { LoginForm } from '@/features/auth'

export function LoginPage() {
  return (
    <div className="min-h-screen bg-bg text-fg">
      <header className="border-b border-black/10 bg-brand-banner text-white">
        <div className="mx-auto flex w-full max-w-lg flex-col items-center gap-2 px-4 py-4">
          <p className="font-display text-xl font-bold tracking-tight">PLABoratory</p>
          <p className="text-center text-sm text-white/85">PLAB 1 study app — sign in to continue</p>
        </div>
      </header>
      <div className="mx-auto flex w-full max-w-lg flex-col justify-center gap-6 px-4 py-8 sm:gap-8 sm:py-10">
        <div className="flex justify-center">
          <ThemeToggle />
        </div>
        <LoginForm />
      </div>
    </div>
  )
}
