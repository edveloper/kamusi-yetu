'use client'

import { useEffect, useRef, useState } from 'react'
import type React from 'react'
import { submitSuggestion } from '@/lib/api/suggestions'
import { uploadEntryAudio } from '@/lib/api/entries'
import { validateEntryRules } from '@/lib/validation/entry-rules'

interface ActionModalProps {
  type: 'edit' | 'report'
  entry: any
  onClose: () => void
  onSubmit?: (data: any) => Promise<void>
}

type FormState = {
  headword: string
  primary_definition: string
  english_translation: string
  swahili_translation: string
  part_of_speech: string
  dialect_variant: string
  pronunciation_ipa: string
  etymology: string
  audio_url: string
  usage_example: string
  category: string
  register: string
  reason: string
  details: string
  source_type: string
  source_reference: string
  confidence: string
}

const DRAFT_KEY = (entryId: string | undefined, type: string) => `suggestion_draft:${type}:${entryId || 'new'}`

export default function EntryActionModal({ type, entry, onClose, onSubmit }: ActionModalProps) {
  const isEdit = type === 'edit'
  const languageCode = String(entry?.language?.code || '').toLowerCase()

  const initial: FormState = {
    headword: entry?.headword ?? '',
    primary_definition: entry?.primary_definition ?? '',
    english_translation: entry?.english_translation ?? '',
    swahili_translation: entry?.swahili_translation ?? '',
    part_of_speech: entry?.part_of_speech ?? '',
    dialect_variant: entry?.dialect_variant ?? '',
    pronunciation_ipa: entry?.pronunciation_ipa ?? '',
    etymology: entry?.etymology ?? '',
    audio_url: entry?.audio_url ?? '',
    usage_example: entry?.usage_examples?.[0]?.context_text ?? '',
    category: entry?.category ?? '',
    register: entry?.register ?? '',
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
  const [uploadingAudio, setUploadingAudio] = useState(false)
  const [audioUploadError, setAudioUploadError] = useState('')
  const [recordingSupported, setRecordingSupported] = useState(false)
  const [isRecording, setIsRecording] = useState(false)
  const [recordedPreviewUrl, setRecordedPreviewUrl] = useState<string | null>(null)
  const [recordedBlob, setRecordedBlob] = useState<Blob | null>(null)
  const firstRef = useRef<HTMLInputElement | HTMLTextAreaElement | null>(null)
  const mediaRecorderRef = useRef<MediaRecorder | null>(null)
  const mediaStreamRef = useRef<MediaStream | null>(null)
  const recordedChunksRef = useRef<Blob[]>([])

  useEffect(() => {
    const key = DRAFT_KEY(entry?.id, type)
    try {
      const raw = localStorage.getItem(key)
      if (raw) {
        const parsed = JSON.parse(raw)
        setForm((prev) => ({ ...prev, ...parsed }))
      }
    } catch {
      // ignore draft parse failures
    }
    setTimeout(() => firstRef.current?.focus(), 0)
  }, [entry?.id, type])

  useEffect(() => {
    const key = DRAFT_KEY(entry?.id, type)
    const t = setTimeout(() => {
      try {
        localStorage.setItem(key, JSON.stringify(form))
      } catch {
        // ignore localStorage failures
      }
    }, 400)
    return () => clearTimeout(t)
  }, [form, entry?.id, type])

  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') onClose()
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [onClose])

  useEffect(() => {
    const hasSupport =
      typeof window !== 'undefined' &&
      typeof navigator !== 'undefined' &&
      !!navigator.mediaDevices?.getUserMedia &&
      typeof MediaRecorder !== 'undefined'
    setRecordingSupported(hasSupport)
  }, [])

  useEffect(() => {
    return () => {
      if (recordedPreviewUrl) URL.revokeObjectURL(recordedPreviewUrl)
      mediaStreamRef.current?.getTracks().forEach((t) => t.stop())
    }
  }, [recordedPreviewUrl])

  const clean = (v: string) => v.trim()

  const validate = (): { ok: boolean; message?: string } => {
    if (isEdit) {
      if (!clean(form.headword)) return { ok: false, message: 'Headword is required.' }
      if (!clean(form.primary_definition)) return { ok: false, message: 'Corrected definition is required.' }

      try {
        validateEntryRules({
          languageCode,
          headword: form.headword,
          primaryDefinition: form.primary_definition,
          partOfSpeech: form.part_of_speech,
          englishTranslation: form.english_translation,
          swahiliTranslation: form.swahili_translation,
          usageExample: form.usage_example
        })
      } catch (error) {
        return { ok: false, message: error instanceof Error ? error.message : 'Entry validation failed.' }
      }
    }

    if (!clean(form.reason)) return { ok: false, message: 'Please select a reason.' }
    if (clean(form.audio_url)) {
      try {
        new URL(clean(form.audio_url))
      } catch {
        return { ok: false, message: 'Audio URL is not valid.' }
      }
    }
    if (clean(form.source_reference) && form.source_type === 'url') {
      try {
        new URL(clean(form.source_reference))
      } catch {
        return { ok: false, message: 'Source URL is not valid.' }
      }
    }
    return { ok: true }
  }

  const handleAudioFileChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0]
    if (!file || !entry?.currentUserId) return

    setUploadingAudio(true)
    setAudioUploadError('')
    try {
      const url = await uploadEntryAudio(entry.currentUserId, file)
      update({ audio_url: url })
    } catch (err) {
      setAudioUploadError(err instanceof Error ? err.message : 'Failed to upload audio.')
    } finally {
      setUploadingAudio(false)
    }
  }

  const startAudioRecording = async () => {
    if (!recordingSupported) {
      setAudioUploadError('Audio recording is not supported in this browser.')
      return
    }

    try {
      setAudioUploadError('')
      const stream = await navigator.mediaDevices.getUserMedia({ audio: true })
      mediaStreamRef.current = stream
      recordedChunksRef.current = []

      const recorder = new MediaRecorder(stream)
      mediaRecorderRef.current = recorder

      recorder.ondataavailable = (event: BlobEvent) => {
        if (event.data && event.data.size > 0) recordedChunksRef.current.push(event.data)
      }

      recorder.onstop = () => {
        const blob = new Blob(recordedChunksRef.current, { type: recorder.mimeType || 'audio/webm' })
        setRecordedBlob(blob)
        if (recordedPreviewUrl) URL.revokeObjectURL(recordedPreviewUrl)
        setRecordedPreviewUrl(URL.createObjectURL(blob))
        stream.getTracks().forEach((t) => t.stop())
        mediaStreamRef.current = null
        setIsRecording(false)
      }

      recorder.start()
      setIsRecording(true)
    } catch {
      setAudioUploadError('Microphone access denied or unavailable.')
      setIsRecording(false)
    }
  }

  const stopAudioRecording = () => {
    if (mediaRecorderRef.current && mediaRecorderRef.current.state !== 'inactive') {
      mediaRecorderRef.current.stop()
    }
  }

  const uploadRecordedAudio = async () => {
    if (!recordedBlob || !entry?.currentUserId) return

    setUploadingAudio(true)
    setAudioUploadError('')
    try {
      const fileExt = recordedBlob.type.includes('webm') ? 'webm' : 'wav'
      const recordedFile = new File([recordedBlob], `suggestion-audio-${Date.now()}.${fileExt}`, {
        type: recordedBlob.type || 'audio/webm'
      })
      const url = await uploadEntryAudio(entry.currentUserId, recordedFile)
      update({ audio_url: url })
    } catch (err) {
      setAudioUploadError(err instanceof Error ? err.message : 'Failed to upload recorded audio.')
    } finally {
      setUploadingAudio(false)
    }
  }

  const clearDraft = () => {
    try {
      localStorage.removeItem(DRAFT_KEY(entry?.id, type))
    } catch {
      // ignore
    }
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
      user_id: entry?.currentUserId,
      type,
      headword: clean(form.headword) || undefined,
      primary_definition: clean(form.primary_definition) || undefined,
      english_translation: clean(form.english_translation) || undefined,
      swahili_translation: clean(form.swahili_translation) || undefined,
      part_of_speech: clean(form.part_of_speech) || undefined,
      dialect_variant: clean(form.dialect_variant) || undefined,
      pronunciation_ipa: clean(form.pronunciation_ipa) || undefined,
      etymology: clean(form.etymology) || undefined,
      audio_url: clean(form.audio_url) || undefined,
      usage_example: clean(form.usage_example) || undefined,
      category: clean(form.category) || undefined,
      register: clean(form.register) || undefined,
      reason: clean(form.reason),
      details: clean(form.details) || undefined,
      source_type: clean(form.source_type) || undefined,
      source_reference: clean(form.source_reference) || undefined,
      confidence: clean(form.confidence) || undefined
    }

    try {
      if (onSubmit) {
        await onSubmit(payload)
      } else {
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

  const update = (patch: Partial<FormState>) => setForm((prev) => ({ ...prev, ...patch }))

  return (
    <div className="fixed inset-0 bg-stone-900/60 backdrop-blur-md z-[100] flex items-center justify-center p-4 overflow-y-auto" role="dialog" aria-modal="true">
      <div className="bg-white rounded-[2.5rem] max-w-3xl w-full p-6 md:p-10 shadow-2xl max-h-[90vh] overflow-y-auto">
        <div className="sticky top-4 z-20 flex justify-end">
          <button onClick={onClose} aria-label="Close" className="text-stone-400 hover:text-stone-900 font-black text-xl p-2">x</button>
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
                  <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">
                    {String(form.part_of_speech).toLowerCase() === 'phrase' ? 'Word or Phrase' : 'Headword'}
                  </label>
                  <input
                    ref={firstRef as any}
                    type="text"
                    value={form.headword}
                    onChange={(e) => update({ headword: e.target.value })}
                    className="w-full p-4 bg-stone-50 border-2 border-stone-100 rounded-2xl focus:border-emerald-500 outline-none font-bold"
                    aria-required
                    maxLength={120}
                  />
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
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <div>
                    <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">English Translation</label>
                    <input
                      type="text"
                      value={form.english_translation}
                      onChange={(e) => update({ english_translation: e.target.value })}
                      className="w-full p-3 bg-stone-50 border-2 border-stone-100 rounded-2xl"
                    />
                  </div>
                  <div>
                    <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Swahili Translation</label>
                    <input
                      type="text"
                      value={form.swahili_translation}
                      onChange={(e) => update({ swahili_translation: e.target.value })}
                      className="w-full p-3 bg-stone-50 border-2 border-stone-100 rounded-2xl"
                    />
                  </div>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-3 gap-3">
                  <div>
                    <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Part of Speech</label>
                    <select
                      value={form.part_of_speech}
                      onChange={(e) => update({ part_of_speech: e.target.value })}
                      className="w-full p-3 bg-stone-50 border-2 border-stone-100 rounded-2xl"
                    >
                      <option value="">Select part of speech...</option>
                      <option value="noun">Noun</option>
                      <option value="verb">Verb</option>
                      <option value="adjective">Adjective</option>
                      <option value="adverb">Adverb</option>
                      <option value="pronoun">Pronoun</option>
                      <option value="preposition">Preposition</option>
                      <option value="conjunction">Conjunction</option>
                      <option value="interjection">Interjection</option>
                      <option value="phrase">Phrase</option>
                    </select>
                  </div>
                  <div>
                    <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Dialect Variant</label>
                    <input
                      type="text"
                      value={form.dialect_variant}
                      onChange={(e) => update({ dialect_variant: e.target.value })}
                      className="w-full p-3 bg-stone-50 border-2 border-stone-100 rounded-2xl"
                    />
                  </div>
                  <div>
                    <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Pronunciation (IPA)</label>
                    <input
                      type="text"
                      value={form.pronunciation_ipa}
                      onChange={(e) => update({ pronunciation_ipa: e.target.value })}
                      className="w-full p-3 bg-stone-50 border-2 border-stone-100 rounded-2xl"
                    />
                  </div>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                  <div>
                    <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Category</label>
                    <input
                      type="text"
                      value={form.category}
                      onChange={(e) => update({ category: e.target.value })}
                      className="w-full p-3 bg-stone-50 border-2 border-stone-100 rounded-2xl"
                    />
                  </div>
                  <div>
                    <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Register</label>
                    <input
                      type="text"
                      value={form.register}
                      onChange={(e) => update({ register: e.target.value })}
                      className="w-full p-3 bg-stone-50 border-2 border-stone-100 rounded-2xl"
                    />
                  </div>
                </div>

                <div>
                  <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Audio URL</label>
                  <input
                    type="url"
                    value={form.audio_url}
                    onChange={(e) => update({ audio_url: e.target.value })}
                    placeholder="https://..."
                    className="w-full p-3 bg-stone-50 border-2 border-stone-100 rounded-2xl"
                  />
                  <div className="mt-3 space-y-3 rounded-2xl border border-stone-100 bg-stone-50 p-4">
                    <input
                      type="file"
                      accept="audio/*"
                      onChange={handleAudioFileChange}
                      disabled={uploadingAudio}
                      className="w-full text-xs text-stone-500 file:mr-3 file:rounded-lg file:border-0 file:bg-emerald-600 file:px-3 file:py-2 file:text-xs file:font-bold file:text-white"
                    />
                    <div className="flex flex-wrap gap-2">
                      {!isRecording ? (
                        <button
                          type="button"
                          onClick={startAudioRecording}
                          disabled={!recordingSupported || uploadingAudio}
                          className="px-4 py-2 rounded-xl bg-stone-900 text-white text-xs font-black uppercase tracking-widest disabled:opacity-50"
                        >
                          Start Recording
                        </button>
                      ) : (
                        <button
                          type="button"
                          onClick={stopAudioRecording}
                          className="px-4 py-2 rounded-xl bg-red-600 text-white text-xs font-black uppercase tracking-widest"
                        >
                          Stop Recording
                        </button>
                      )}
                      <button
                        type="button"
                        onClick={uploadRecordedAudio}
                        disabled={!recordedBlob || uploadingAudio}
                        className="px-4 py-2 rounded-xl bg-emerald-600 text-white text-xs font-black uppercase tracking-widest disabled:opacity-50"
                      >
                        Upload Recording
                      </button>
                    </div>
                    {audioUploadError && <p className="text-xs text-red-600 font-bold">{audioUploadError}</p>}
                    {recordedPreviewUrl && (
                      <audio controls className="w-full">
                        <source src={recordedPreviewUrl} />
                      </audio>
                    )}
                  </div>
                </div>

                <div>
                  <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Etymology</label>
                  <textarea
                    rows={3}
                    value={form.etymology}
                    onChange={(e) => update({ etymology: e.target.value })}
                    className="w-full p-4 bg-stone-50 border-2 border-stone-100 rounded-2xl"
                  />
                </div>

                <div>
                  <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Usage Example</label>
                  <textarea
                    rows={3}
                    value={form.usage_example}
                    onChange={(e) => update({ usage_example: e.target.value })}
                    placeholder="Show the word or phrase in context..."
                    className="w-full p-4 bg-stone-50 border-2 border-stone-100 rounded-2xl"
                  />
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
                    <option value="enrichment">Add lexical metadata</option>
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
              <button type="button" onClick={() => setShowPreview((s) => !s)} className="flex-1 py-4 font-black text-[10px] uppercase tracking-widest text-stone-600 rounded-2xl border border-stone-200">
                {showPreview ? 'Hide Preview' : 'Preview'}
              </button>

              <button type="submit" disabled={loading} className="flex-1 py-4 bg-emerald-600 text-white rounded-2xl font-black text-[10px] uppercase tracking-[0.3em] hover:bg-emerald-700 transition-all disabled:opacity-50">
                {loading ? 'Submitting...' : isEdit ? 'Send Suggestion' : 'Report Issue'}
              </button>
            </div>

            {showPreview && (
              <div className="mt-4 p-4 bg-stone-50 border border-stone-100 rounded-xl">
                <h4 className="font-black mb-2">Preview</h4>
                {isEdit && (
                  <>
                    <div className="text-sm font-bold">{form.headword || entry?.headword}</div>
                    <div className="text-sm text-stone-700 mt-2">{form.primary_definition || entry?.primary_definition}</div>
                    {form.english_translation && <div className="text-sm mt-2">EN: {form.english_translation}</div>}
                    {form.swahili_translation && <div className="text-sm">SW: {form.swahili_translation}</div>}
                    {form.usage_example && <div className="text-sm mt-2 italic">Example: {form.usage_example}</div>}
                  </>
                )}
                <div className="mt-3 text-[13px]">
                  <div className="font-black">Reason</div>
                  <div className="text-stone-700">{form.reason}</div>
                </div>
              </div>
            )}
          </form>
        )}
      </div>
    </div>
  )
}
