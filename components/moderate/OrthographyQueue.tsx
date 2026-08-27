'use client'

import { useCallback, useEffect, useState } from 'react'
import {
  getOrthographyQueue,
  repairOrthography,
  type OrthographyItem,
} from '@/lib/api/moderation'

/**
 * The quarantined spellings.
 *
 * An old import destroyed the vowels that distinguish Kikuyu, Embu, Meru and
 * Gusii orthography, and there is no clean copy to restore from. 358 entries
 * are held back until someone who speaks the language types the correct form.
 *
 * This is the one queue where a first-language speaker with no qualifications
 * outranks everyone else on the project, so the interface asks for exactly one
 * thing and shows the meaning as the clue.
 */
export default function OrthographyQueue() {
  const [items, setItems] = useState<OrthographyItem[]>([])
  const [drafts, setDrafts] = useState<Record<string, string>>({})
  const [loading, setLoading] = useState(true)
  const [busy, setBusy] = useState<Record<string, boolean>>({})
  const [error, setError] = useState('')
  const [fixed, setFixed] = useState(0)

  const load = useCallback(async () => {
    setLoading(true)
    setError('')
    try {
      const next = await getOrthographyQueue()
      setItems(next)
      setDrafts(Object.fromEntries(next.map((item) => [item.id, item.headword])))
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not load the queue.')
    } finally {
      setLoading(false)
    }
  }, [])

  useEffect(() => {
    load()
  }, [load])

  const save = async (item: OrthographyItem) => {
    const value = (drafts[item.id] ?? '').trim()
    if (!value || value === item.headword) return

    setBusy((prev) => ({ ...prev, [item.id]: true }))
    setError('')
    try {
      await repairOrthography(item.id, value)
      setItems((prev) => prev.filter((row) => row.id !== item.id))
      setFixed((count) => count + 1)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not save that spelling.')
    } finally {
      setBusy((prev) => ({ ...prev, [item.id]: false }))
    }
  }

  if (loading) return <p className="text-ink-600">Loading damaged entries.</p>

  return (
    <div>
      <p className="mb-6 max-w-2xl text-ink-700">
        An old import destroyed the vowels that distinguish Kikuyu, Embu, Meru and Gusii
        spelling, and there is no clean copy to restore from. Type the word as it should be
        written and it rejoins the corpus. Only correct a language you speak.
      </p>

      {fixed > 0 && (
        <p className="mb-6 border border-petrol-200 bg-petrol-50 px-4 py-3 text-sm font-semibold text-petrol-600">
          {fixed} {fixed === 1 ? 'spelling' : 'spellings'} repaired this session.
        </p>
      )}

      {error && (
        <p
          role="alert"
          className="mb-6 border border-signal-200 bg-signal-50 px-4 py-3 text-sm font-semibold text-signal-700"
        >
          {error}
        </p>
      )}

      {items.length === 0 ? (
        <div className="border-y-2 border-ink-900 py-12 text-center">
          <p className="display mb-2 text-2xl text-ink-900">Nothing left here</p>
          <p className="text-ink-600">Every damaged spelling has been repaired.</p>
        </div>
      ) : (
        <ul className="stagger border-t border-ink-200">
          {items.map((item, index) => (
            <li
              key={item.id}
              style={{ '--i': index } as React.CSSProperties}
              className="border-b border-ink-200 py-5"
            >
              <div className="flex flex-wrap items-baseline justify-between gap-x-6 gap-y-1">
                <p className="font-mono text-lg text-signal-600">{item.headword}</p>
                <span className="label text-ink-500">{item.language?.name}</span>
              </div>

              <p className="mt-1.5 text-ink-700">
                {item.english_translation || item.primary_definition}
                {item.swahili_translation ? ` · ${item.swahili_translation}` : ''}
              </p>

              <div className="mt-3 flex flex-wrap gap-2">
                <label htmlFor={`fix-${item.id}`} className="sr-only">
                  Corrected spelling
                </label>
                <input
                  id={`fix-${item.id}`}
                  type="text"
                  value={drafts[item.id] ?? ''}
                  onChange={(event) =>
                    setDrafts((prev) => ({ ...prev, [item.id]: event.target.value }))
                  }
                  autoComplete="off"
                  autoCapitalize="none"
                  spellCheck={false}
                  className="min-w-0 flex-1 border border-ink-300 bg-card px-3 py-2 text-ink-900 outline-none focus:border-ink-900"
                />
                <button
                  onClick={() => save(item)}
                  disabled={busy[item.id] || (drafts[item.id] ?? '') === item.headword}
                  className="btn-primary py-2 text-sm"
                >
                  Save
                </button>
              </div>
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}
