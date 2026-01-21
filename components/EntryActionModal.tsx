'use client'

import { useEffect, useRef, useState } from 'react'

interface ActionModalProps {
  type: 'edit' | 'report'
  entry: any
  onClose: () => void
  onSubmit: (data: any) => Promise<void>
}

export default function EntryActionModal({ type, entry, onClose, onSubmit }: ActionModalProps) {
  const [loading, setLoading] = useState(false)
  const [formData, setFormData] = useState({
    headword: '',
    primary_definition: '',
    reason: '',
    details: ''
  })

  const isEdit = type === 'edit'
  const firstInputRef = useRef<HTMLInputElement | HTMLTextAreaElement | null>(null)
  const modalRef = useRef<HTMLDivElement | null>(null)

  // Initialize form data when entry changes
  useEffect(() => {
    setFormData({
      headword: entry?.headword || '',
      primary_definition: entry?.primary_definition || '',
      reason: '',
      details: ''
    })
    // focus first input after a tick
    setTimeout(() => {
      firstInputRef.current?.focus()
    }, 0)
  }, [entry])

  // Close on Escape
  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') onClose()
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [onClose])

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    try {
      await onSubmit(formData)
      onClose()
    } catch (err) {
      alert('Submission failed. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div
      role="dialog"
      aria-modal="true"
      aria-labelledby="entry-action-title"
      className="fixed inset-0 bg-stone-900/60 backdrop-blur-md z-[100] flex items-center justify-center p-4"
    >
      {/* Modal box: constrained height and scrollable */}
      <div
        ref={modalRef}
        className="bg-white rounded-[2.5rem] max-w-2xl w-full p-6 md:p-10 shadow-2xl relative
                   max-h-[90vh] overflow-y-auto"
      >
        {/* Sticky close button so it remains visible while scrolling */}
        <div className="sticky top-4 z-20 flex justify-end">
          <button
            onClick={onClose}
            aria-label="Close dialog"
            className="text-stone-400 hover:text-stone-900 font-black text-xl bg-white/0 p-2 rounded-lg"
          >
            ✕
          </button>
        </div>

        <div className="pt-2">
          <h2 id="entry-action-title" className="text-3xl font-black font-logo mb-2 uppercase tracking-tight">
            {isEdit ? 'Suggest an Amendment' : 'Report an Issue'}
          </h2>
          <p className="text-stone-500 text-sm mb-6 font-medium">
            {isEdit
              ? 'Your suggestion will be reviewed by the Guardian Authority before the record is updated.'
              : 'Help us maintain the integrity of the Archive. Describe the issue and provide any context.'}
          </p>

          <form onSubmit={handleSubmit} className="space-y-6">
            {isEdit && (
              <>
                <div>
                  <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">
                    Headword
                  </label>
                  <input
                    ref={firstInputRef as any}
                    type="text"
                    value={formData.headword}
                    onChange={(e) => setFormData({ ...formData, headword: e.target.value })}
                    className="w-full p-4 bg-stone-50 border-2 border-stone-100 rounded-2xl focus:border-emerald-500 outline-none font-bold"
                    aria-label="Headword"
                    required
                  />
                </div>

                <div>
                  <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">
                    Corrected Definition
                  </label>
                  <textarea
                    rows={4}
                    value={formData.primary_definition}
                    onChange={(e) => setFormData({ ...formData, primary_definition: e.target.value })}
                    className="w-full p-4 bg-stone-50 border-2 border-stone-100 rounded-2xl focus:border-emerald-500 outline-none font-medium text-sm"
                    aria-label="Corrected definition"
                    required
                  />
                </div>
              </>
            )}

            <div>
              <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">
                {isEdit ? 'Reason for Change' : 'Nature of Issue'}
              </label>
              <select
                className="w-full p-4 bg-stone-50 border-2 border-stone-100 rounded-2xl focus:border-emerald-500 outline-none font-bold text-sm"
                onChange={(e) => setFormData({ ...formData, reason: e.target.value })}
                value={formData.reason}
                required
                aria-label={isEdit ? 'Reason for change' : 'Nature of issue'}
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
              <p className="text-[11px] text-stone-400 mt-2">
                Choose the option that best describes your suggestion. This helps moderators triage quickly.
              </p>
            </div>

            <div>
              <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">
                Additional Details
              </label>
              <textarea
                rows={3}
                placeholder={isEdit ? 'Provide sources or more context...' : 'Please explain the problem...'}
                value={formData.details}
                onChange={(e) => setFormData({ ...formData, details: e.target.value })}
                className="w-full p-4 bg-stone-50 border-2 border-stone-100 rounded-2xl focus:border-emerald-500 outline-none font-medium text-sm"
                aria-label="Additional details"
              />
              <p className="text-[11px] text-stone-400 mt-2">Optional — add links, citations, or examples to support your suggestion.</p>
            </div>

            <div className="flex gap-3">
              <button
                type="button"
                onClick={onClose}
                className="flex-1 py-4 font-black text-[10px] uppercase tracking-widest text-stone-600 rounded-2xl border border-stone-200"
              >
                Cancel
              </button>

              <button
                type="submit"
                disabled={loading}
                className="flex-1 py-4 bg-emerald-600 text-white rounded-2xl font-black text-[10px] uppercase tracking-[0.3em] hover:bg-emerald-700 transition-all disabled:opacity-50"
                aria-disabled={loading}
              >
                {loading ? 'Submitting…' : isEdit ? 'Send Suggestion' : 'Report Issue'}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  )
}
