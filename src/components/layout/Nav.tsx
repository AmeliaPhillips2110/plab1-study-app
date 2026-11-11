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
      {isAdmin ? (
        <>
          <NavLink to="/admin" end className={linkClass}>
            Admin
          </NavLink>
          <NavLink to="/admin/questions" className={linkClass}>
            Questions
          </NavLink>
          <NavLink to="/admin/settings" className={linkClass}>
            Settings
          </NavLink>
          <NavLink to="/admin/users" className={linkClass}>
            Users
          </NavLink>
        </>
      ) : null}
      {profile ? (
        <span className="ml-2 hidden text-xs text-muted sm:inline">
          {profile.display_name || profile.email} · {profile.role}
        </span>
      ) : null}
    </nav>
  )
}
