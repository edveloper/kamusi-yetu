'use client'

import { useCallback, useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase'

// Speakers' corrections of machine translations, in the languages this
// reviewer holds (app/api/moderation/machine-feedback). Accepting keeps the
// speaker's sentence, as edited here, as a real sentence pair.

type Item = {
  id: string
  own: boolean
  createdAt: string
  from: { code: string; name: string }
  to: { code: string; name: string }
  sourceText: string
  machine: string
  better: string
}

async function call(method: 'GET' | 'POST', body?: unknown) {
  const { data } = await supabase.auth.getSession()
  const token = data.session?.access_token
  if (!token) throw new Error('Sign in again.')
  const res = await fetch('/api/moderation/machine-feedback', {
    method,
    headers: { Authorization: `Bearer ${token}`, ...(body ? { 'Content-Type': 'application/json' } : {}) },
    body: body ? JSON.stringify(body) : undefined,
  })
  const json = await res.json().catch(() => ({}))
  if (!res.ok) throw new Error(json.error || 'That did not work.')
  return json
}

export default function MachineFeedbackQueue({ onCount }: { onCount?: (n: number) => void }) {
  const [items, setItems] = useState<Item[]>([])
  const [confirmations, setConfirmations] = useState(0)
  const [edits, setEdits] = useState<Record<string, string>>({})
  const [busy, setBusy] = useState<string | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')

  const load = useCallback(async () => {
    setLoading(true)
    setError('')
    try {
      const json = await call('GET')
      setItems(json.items ?? [])
      setConfirmations(json.confirmations ?? 0)
      onCount?.((json.items ?? []).length)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not load corrections.')
    } finally {
      setLoading(false)
    }
  }, [onCount])

  useEffect(() => {
    load()
  }, [load])

  const decide = async (item: Item, decision: 'accept' | 'reject') => {
    setBusy(item.id)
    setError('')
    try {
      await call('POST', { id: item.id, decision, text: decision === 'accept' ? edits[item.id] ?? item.better : undefined })
      const rest = items.filter((i) => i.id !== item.id)
      setItems(rest)
      onCount?.(rest.length)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'That did not work.')
    } finally {
      setBusy(null)
    }
  }

  if (loading) return <p className="text-ink-600">Loading corrections.</p>

  return (
    <div>
      <p className="mb-8 max-w-2xl text-ink-700">
        Speakers who saw a machine translation on the Translate page and wrote a better one.
        Accepting keeps their sentence, as you leave it below, as a real sentence pair that helps
        future translations. The machine&rsquo;s own wording is never kept.
        {confirmations > 0 && ` Speakers have also confirmed ${confirmations} machine translation${confirmations === 1 ? '' : 's'} as right.`}
      </p>

      {error && (
        <p role="alert" className="mb-6 border border-signal-200 bg-signal-50 px-4 py-3 text-sm font-semibold text-signal-700">
          {error}
        </p>
      )}

      {items.length === 0 ? (
        <div className="border-y-2 border-ink-900 py-12 text-center">
          <p className="display mb-2 text-2xl text-ink-900">Nothing to check</p>
          <p className="text-ink-600">No corrections waiting in your languages.</p>
        </div>
      ) : (
        <ul className="space-y-8">
          {items.map((item) => (
            <li key={item.id} className="border-t-2 border-ink-900 pt-5">
              <p className="label mb-4 text-ink-500">
                {item.from.name} to {item.to.name}
                {item.own ? ' · your own correction' : ''}
              </p>
              <dl className="space-y-4">
                <div>
                  <dt className="label mb-1 text-ink-500">Typed in {item.from.name}</dt>
                  <dd className="text-lg text-ink-900" lang={item.from.code}>{item.sourceText}</dd>
                </div>
                <div>
                  <dt className="label mb-1 text-ink-500">Machine translation</dt>
                  <dd className="text-ink-600 line-through decoration-ink-300" lang={item.to.code}>{item.machine}</dd>
                </div>
                <div>
                  <dt>
                    <label htmlFor={`better-${item.id}`} className="label mb-1 block text-ink-900">
                      Speaker&rsquo;s version in {item.to.name}, edit if needed
                    </label>
                  </dt>
                  <dd>
                    <textarea
                      id={`better-${item.id}`}
                      value={edits[item.id] ?? item.better}
                      onChange={(e) => setEdits((prev) => ({ ...prev, [item.id]: e.target.value }))}
                      rows={2}
                      maxLength={400}
                      lang={item.to.code}
                      className="w-full border border-ink-300 px-3 py-2 text-lg text-ink-900 outline-none focus:border-ink-900"
                    />
                  </dd>
                </div>
              </dl>
              <div className="mt-4 flex flex-wrap gap-3">
                <button type="button" disabled={busy === item.id} onClick={() => decide(item, 'accept')} className="btn-primary">
                  Accept
                </button>
                <button type="button" disabled={busy === item.id} onClick={() => decide(item, 'reject')} className="btn-secondary">
                  Reject
                </button>
              </div>
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}
