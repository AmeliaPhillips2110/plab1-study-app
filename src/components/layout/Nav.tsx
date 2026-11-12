import { NavLink } from 'react-router-dom'
import { useAuth } from '@/hooks/useAuth'
import { cn } from '@/lib/cn'

const linkClass = (onBanner: boolean) =>
  ({ isActive }: { isActive: boolean }) =>
    cn(
      'rounded-md px-3 py-2 text-sm font-medium transition',
      onBanner
        ? isActive
          ? 'bg-white/20 text-white'
          : 'text-white/85 hover:bg-white/10 hover:text-white'
        : isActive
          ? 'bg-accent-subtle text-accent'
          : 'text-muted hover:text-fg',
    )

type Props = {
  onBanner?: boolean
}

export function Nav({ onBanner = false }: Props) {
  const { isAdmin } = useAuth()

  return (
    <nav className="flex flex-wrap items-center justify-center gap-1" aria-label="Main">
      <NavLink to="/" end className={linkClass(onBanner)}>
        Home
      </NavLink>
      <NavLink to="/study" className={linkClass(onBanner)}>
        Quiz
      </NavLink>
      <NavLink to="/mock" className={linkClass(onBanner)}>
        Mocks
      </NavLink>
      <NavLink to="/attempts" className={linkClass(onBanner)}>
        Attempts
      </NavLink>
      <NavLink to="/dashboard" className={linkClass(onBanner)}>
        KPIs
      </NavLink>
      <NavLink to="/glossary" className={linkClass(onBanner)}>
        Glossary
      </NavLink>
      {isAdmin ? (
        <>
          <NavLink to="/admin" end className={linkClass(onBanner)}>
            Admin
          </NavLink>
          <NavLink to="/admin/questions" className={linkClass(onBanner)}>
            Questions
          </NavLink>
          <NavLink to="/admin/glossary" className={linkClass(onBanner)}>
            Glossary edit
          </NavLink>
          <NavLink to="/admin/settings" className={linkClass(onBanner)}>
            Settings
          </NavLink>
          <NavLink to="/admin/users" className={linkClass(onBanner)}>
            Users
          </NavLink>
          <NavLink to="/admin/comparison" className={linkClass(onBanner)}>
            Comparison
          </NavLink>
        </>
      ) : null}
    </nav>
  )
}
