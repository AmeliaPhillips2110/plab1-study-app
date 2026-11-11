/** Synthetic email domain for username→Supabase Auth mapping. Not a real mailbox. */
export const AUTH_EMAIL_DOMAIN = 'users.local'

/**
 * Normalize a username for Auth.
 * Keeps letters, digits, `.`, `_`, `-`; lowercases; strips leading/trailing dots.
 */
export function sanitizeUsername(raw: string): string {
  return raw
    .trim()
    .toLowerCase()
    .replace(/[^a-z0-9._-]+/g, '')
    .replace(/^\.+|\.+$/g, '')
}

export function usernameToEmail(username: string): string {
  const u = sanitizeUsername(username)
  if (u.length < 2) {
    throw new Error('User must be at least 2 characters (letters, numbers, . _ -).')
  }
  return `${u}@${AUTH_EMAIL_DOMAIN}`
}

export function emailToUsername(email: string | null | undefined): string {
  if (!email) return ''
  const at = email.indexOf('@')
  if (at <= 0) return email
  const domain = email.slice(at + 1).toLowerCase()
  if (domain === AUTH_EMAIL_DOMAIN) return email.slice(0, at)
  return email
}
