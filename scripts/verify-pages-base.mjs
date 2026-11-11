/**
 * Quick check that a production build under VITE_BASE embeds the repo path.
 * Usage: node scripts/verify-pages-base.mjs [expectedBase]
 */
import { readFileSync, existsSync } from 'node:fs'
import { resolve } from 'node:path'

const expected = process.argv[2] || '/plab1-study-app/'
const indexPath = resolve('dist/index.html')
if (!existsSync(indexPath)) {
  console.error('dist/index.html missing — run npm run build first')
  process.exit(1)
}
const html = readFileSync(indexPath, 'utf8')
const ok =
  html.includes(`src="${expected}`) ||
  html.includes(`href="${expected}`) ||
  html.includes(expected)
if (!ok) {
  console.error(`Expected base path "${expected}" not found in dist/index.html`)
  process.exit(1)
}
console.log(`OK: dist/index.html references base ${expected}`)
