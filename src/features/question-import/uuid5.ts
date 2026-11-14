/** UUID v5 (SHA-1) for stable question/option IDs — matches scripts/xlsx_to_seed_sql.py namespace. */

const BANK_NAMESPACE = 'b1000000-0000-4000-8000-000000000001'

function hexToBytes(hex: string): Uint8Array {
  const clean = hex.replace(/-/g, '')
  const out = new Uint8Array(clean.length / 2)
  for (let i = 0; i < out.length; i++) {
    out[i] = parseInt(clean.slice(i * 2, i * 2 + 2), 16)
  }
  return out
}

function bytesToUuid(bytes: Uint8Array): string {
  const hex = Array.from(bytes)
    .map((b) => b.toString(16).padStart(2, '0'))
    .join('')
  return `${hex.slice(0, 8)}-${hex.slice(8, 12)}-${hex.slice(12, 16)}-${hex.slice(16, 20)}-${hex.slice(20, 32)}`
}

async function sha1(data: Uint8Array): Promise<Uint8Array> {
  const copy = new Uint8Array(data.byteLength)
  copy.set(data)
  const digest = await crypto.subtle.digest('SHA-1', copy.buffer)
  return new Uint8Array(digest)
}

export async function uuid5(name: string, namespace: string = BANK_NAMESPACE): Promise<string> {
  const ns = hexToBytes(namespace)
  const nameBytes = new TextEncoder().encode(name)
  const joined = new Uint8Array(ns.length + nameBytes.length)
  joined.set(ns, 0)
  joined.set(nameBytes, ns.length)
  const hash = await sha1(joined)
  hash[6] = (hash[6]! & 0x0f) | 0x50
  hash[8] = (hash[8]! & 0x3f) | 0x80
  return bytesToUuid(hash.slice(0, 16))
}

export async function sha1Hex(text: string): Promise<string> {
  const hash = await sha1(new TextEncoder().encode(text))
  return Array.from(hash)
    .map((b) => b.toString(16).padStart(2, '0'))
    .join('')
}
