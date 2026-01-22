'use client'

import { useEffect, useRef, useState } from 'react'
import type React from 'react'
import dynamic from 'next/dynamic'

import { submitSuggestion } from '@/lib/api/suggestions' // server helper
// If you keep onSubmit prop, you can call that instead; this component calls submitSuggestion directly.

interface ActionModalProps {
  type: 'edit' | 'report'
  entry: any
  onClose: () => void
  onSubmit?: (data: any) => Promise<void> // optional external handler
}

type FormState = {
  headword: string
  primary_definition: string
  reason: string
  details: string
  source_type: string
  source_reference: string
  confidence: string
}

const DRAFT_KEY = (entryId: string | undefined, type: string) => `suggestion_draft:${type}:${entryId || 'new'}`

export default function EntryActionModal({ type, entry, onClose, onSubmit }: ActionModalProps) {
  const isEdit = type === 'edit'
  const initial: FormState = {
    headword: entry?.headword ?? '',
    primary_definition: entry?.primary_definition ?? '',
    reason: '',
    details: '',
    source_type: '',
    source_reference: '',
    confidence: 'medium'
  }

  const [form, setForm] = useState<FormState>(initial)
  const [loading, setLoading] = useState(false)
  const [submitted, setSubmitted] = useState(false)
  const [showPreview, setShowPreview] = useState(false)
  const firstRef = useRef<HTMLInputElement | HTMLTextAreaElement | null>(null)

  // load draft from localStorage
  useEffect(() => {
    const key = DRAFT_KEY(entry?.id, type)
    try {
      const raw = localStorage.getItem(key)
      if (raw) {
        const parsed = JSON.parse(raw)
        setForm(prev => ({ ...prev, ...parsed }))
      }
    } catch (e) {
      // ignore
    }
    setTimeout(() => firstRef.current?.focus(), 0)
  }, [entry?.id, type])

  // autosave draft
  useEffect(() => {
    const key = DRAFT_KEY(entry?.id, type)
    const t = setTimeout(() => {
      try {
        localStorage.setItem(key, JSON.stringify(form))
      } catch (e) {}
    }, 400)
    return () => clearTimeout(t)
  }, [form, entry?.id, type])

  // ESC to close
  useEffect(() => {
    const onKey = (e: KeyboardEvent) => { if (e.key === 'Escape') onClose() }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [onClose])

  const validate = (): { ok: boolean; message?: string } => {
    if (isEdit) {
      if (!form.headword.trim()) return { ok: false, message: 'Headword is required.' }
      if (!form.primary_definition.trim()) return { ok: false, message: 'Corrected definition is required.' }
    }
    if (!form.reason.trim()) return { ok: false, message: 'Please select a reason.' }
    if (form.source_reference && form.source_type === 'url') {
      try {
        new URL(form.source_reference)
      } catch {
        return { ok: false, message: 'Source URL is not valid.' }
      }
    }
    return { ok: true }
  }

  const clearDraft = () => {
    try {
      localStorage.removeItem(DRAFT_KEY(entry?.id, type))
    } catch {}
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    const v = validate()
    if (!v.ok) {
      alert(v.message)
      return
    }
    setLoading(true)
    const payload = {
      entry_id: entry?.id,
      user_id: undefined, // server helper will use auth; if not, pass user id from context
      type,
      headword: form.headword || undefined,
      primary_definition: form.primary_definition || undefined,
      reason: form.reason,
      details: form.details || undefined,
      source_type: form.source_type || undefined,
      source_reference: form.source_reference || undefined,
      confidence: form.confidence || undefined
    }

    try {
      if (onSubmit) {
        await onSubmit(payload)
      } else {
        // call server helper directly
        await submitSuggestion(payload as any)
      }
      clearDraft()
      setSubmitted(true)
      setTimeout(() => {
        setSubmitted(false)
        onClose()
      }, 1200)
    } catch (err: any) {
      console.error('Suggestion submit failed:', err)
      alert(err?.message || 'Submission failed. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  // small helpers
  const update = (patch: Partial<FormState>) => setForm(prev => ({ ...prev, ...patch }))

  return (
    <div className="fixed inset-0 bg-stone-900/60 backdrop-blur-md z-[100] flex items-center justify-center p-4 overflow-y-auto" role="dialog" aria-modal="true">
      <div className="bg-white rounded-[2.5rem] max-w-2xl w-full p-6 md:p-10 shadow-2xl max-h-[90vh] overflow-y-auto">
        <div className="sticky top-4 z-20 flex justify-end">
          <button onClick={onClose} aria-label="Close" className="text-stone-400 hover:text-stone-900 font-black text-xl p-2">✕</button>
        </div>

        <h2 className="text-3xl font-black mb-2 uppercase tracking-tight">{isEdit ? 'Suggest an Amendment' : 'Report an Issue'}</h2>
        <p className="text-stone-500 text-sm mb-6">{isEdit ? 'Your suggestion will be reviewed by the Guardian Authority.' : 'Help us maintain the integrity of the Archive.'}</p>

        {submitted ? (
          <div className="p-8 text-center">
            <div className="text-emerald-600 text-3xl font-black mb-4">Thanks</div>
            <div className="text-stone-600">Your suggestion has been sent to the Guardian Authority for review.</div>
          </div>
        ) : (
          <form onSubmit={handleSubmit} className="space-y-6">
            {isEdit && (
              <>
                <div>
                  <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Headword</label>
                  <input
                    ref={firstRef as any}
                    type="text"
                    value={form.headword}
                    onChange={(e) => update({ headword: e.target.value })}
                    className="w-full p-4 bg-stone-50 border-2 border-stone-100 rounded-2xl focus:border-emerald-500 outline-none font-bold"
                    aria-required
                    maxLength={120}
                  />
                  <div className="text-[11px] text-stone-400 mt-1">{form.headword.length}/120</div>
                </div>

                <div>
                  <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Corrected Definition</label>
                  <textarea
                    rows={4}
                    value={form.primary_definition}
                    onChange={(e) => update({ primary_definition: e.target.value })}
                    className="w-full p-4 bg-stone-50 border-2 border-stone-100 rounded-2xl focus:border-emerald-500 outline-none font-medium text-sm"
                    maxLength={2000}
                    aria-required
                  />
                  <div className="text-[11px] text-stone-400 mt-1">{form.primary_definition.length}/2000</div>
                </div>
              </>
            )}

            <div>
              <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Reason</label>
              <select
                value={form.reason}
                onChange={(e) => update({ reason: e.target.value })}
                required
                className="w-full p-4 bg-stone-50 border-2 border-stone-100 rounded-2xl focus:border-emerald-500 outline-none font-bold text-sm"
              >
                <option value="">Select a reason...</option>
                {isEdit ? (
                  <>
                    <option value="typo">Spelling / grammar correction</option>
                    <option value="accuracy">Factually incorrect definition</option>
                    <option value="missing">Missing critical context</option>
                  </>
                ) : (
                  <>
                    <option value="spam">Spam or nonsense</option>
                    <option value="offensive">Inappropriate / offensive content</option>
                    <option value="duplicate">Duplicate of another entry</option>
                  </>
                )}
              </select>
            </div>

            <div>
              <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Additional Details</label>
              <textarea
                rows={3}
                placeholder={isEdit ? 'Provide sources or more context...' : 'Please explain the problem...'}
                value={form.details}
                onChange={(e) => update({ details: e.target.value })}
                className="w-full p-4 bg-stone-50 border-2 border-stone-100 rounded-2xl focus:border-emerald-500 outline-none font-medium text-sm"
                maxLength={3000}
              />
              <div className="text-[11px] text-stone-400 mt-1">{form.details.length}/3000</div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-3">
              <div>
                <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Source Type</label>
                <select value={form.source_type} onChange={(e) => update({ source_type: e.target.value })} className="w-full p-3 bg-stone-50 border-2 border-stone-100 rounded-2xl">
                  <option value="">None</option>
                  <option value="oral">Oral</option>
                  <option value="written">Written</option>
                  <option value="url">URL</option>
                  <option value="other">Other</option>
                </select>
              </div>

              <div>
                <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Source Reference</label>
                <input
                  type="text"
                  value={form.source_reference}
                  onChange={(e) => update({ source_reference: e.target.value })}
                  placeholder={form.source_type === 'url' ? 'https://example.com' : 'Citation or notes'}
                  className="w-full p-3 bg-stone-50 border-2 border-stone-100 rounded-2xl"
                />
              </div>

              <div>
                <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Confidence</label>
                <select value={form.confidence} onChange={(e) => update({ confidence: e.target.value })} className="w-full p-3 bg-stone-50 border-2 border-stone-100 rounded-2xl">
                  <option value="low">Low</option>
                  <option value="medium">Medium</option>
                  <option value="high">High</option>
                </select>
              </div>
            </div>

            <div className="flex gap-3">
              <button type="button" onClick={() => setShowPreview(s => !s)} className="flex-1 py-4 font-black text-[10px] uppercase tracking-widest text-stone-600 rounded-2xl border border-stone-200">
                {showPreview ? 'Hide Preview' : 'Preview'}
              </button>

              <button type="submit" disabled={loading} className="flex-1 py-4 bg-emerald-600 text-white rounded-2xl font-black text-[10px] uppercase tracking-[0.3em] hover:bg-emerald-700 transition-all disabled:opacity-50">
                {loading ? 'Submitting…' : isEdit ? 'Send Suggestion' : 'Report Issue'}
              </button>
            </div>

            {showPreview && (
              <div className="mt-4 p-4 bg-stone-50 border border-stone-100 rounded-xl">
                <h4 className="font-black mb-2">Preview</h4>
                {isEdit && (
                  <>
                    <div className="text-sm font-bold">{form.headword || entry?.headword}</div>
                    <div className="text-sm text-stone-700 mt-2">{form.primary_definition || entry?.primary_definition}</div>
                  </>
                )}
                <div className="mt-3 text-[13px]">
                  <div className="font-black">Reason</div>
                  <div className="text-stone-700">{form.reason}</div>
                </div>
                {form.details && (
                  <div className="mt-3">
                    <div className="font-black">Details</div>
                    <div className="text-stone-700">{form.details}</div>
                  </div>
                )}
                {form.source_type && (
                  <div className="mt-3 text-[13px]">
                    <div className="font-black">Source</div>
                    <div className="text-stone-700">{form.source_type}{form.source_reference ? ` — ${form.source_reference}` : ''}</div>
                  </div>
                )}
                <div className="mt-3 text-[13px]">
                  <div className="font-black">Confidence</div>
                  <div className="text-stone-700">{form.confidence}</div>
                </div>
              </div>
            )}
          </form>
        )}
      </div>
    </div>
  )
}
