import { NavLink } from 'react-router-dom'
import { useAuth } from '@/hooks/useAuth'
import { cn } from '@/lib/cn'

const linkClass = ({ isActive }: { isActive: boolean }) =>
  cn(
    'rounded-md px-3 py-2 text-sm font-medium transition',
    isActive ? 'bg-accent-subtle text-accent' : 'text-muted hover:text-fg',
  )

export function Nav() {
  const { isAdmin, profile } = useAuth()

  return (
    <nav className="flex flex-wrap items-center gap-1" aria-label="Main">
      <NavLink to="/" end className={linkClass}>
        Study home
      </NavLink>
      <NavLink to="/study" className={linkClass}>
        Quiz
      </NavLink>
      <NavLink to="/mock" className={linkClass}>
        Mocks
      </NavLink>
      <NavLink to="/attempts" className={linkClass}>
        Attempts
      </NavLink>
      <NavLink to="/dashboard" className={linkClass}>
        KPIs
      </NavLink>
      <NavLink to="/glossary" className={linkClass}>
        Glossary
      </NavLink>
      {isAdmin ? (
        <>
          <NavLink to="/admin" end className={linkClass}>
            Admin
          </NavLink>
          <NavLink to="/admin/questions" className={linkClass}>
            Questions
          </NavLink>
          <NavLink to="/admin/glossary" className={linkClass}>
            Glossary edit
          </NavLink>
          <NavLink to="/admin/settings" className={linkClass}>
            Settings
          </NavLink>
          <NavLink to="/admin/users" className={linkClass}>
            Users
          </NavLink>
          <NavLink to="/admin/comparison" className={linkClass}>
            Comparison
          </NavLink>
        </>
      ) : null}
      {profile ? (
        <span className="ml-2 hidden text-xs text-muted sm:inline">
          {profile.display_name || profile.email.split('@')[0]} · {profile.role}
        </span>
      ) : null}
    </nav>
  )
}
