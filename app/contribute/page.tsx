'use client'

import { useAuth } from '@/lib/contexts/AuthContext'
import { useRouter } from 'next/navigation'
import { useEffect, useRef, useState } from 'react'
import { createEntry, uploadEntryAudio } from '@/lib/api/entries'
import { getLanguages } from '@/lib/api/languages'
import { CATEGORIES } from '@/lib/constants'
import { supabase } from '@/lib/supabase'
import { validateEntryRules } from '@/lib/validation/entry-rules'
import Link from 'next/link'
import { groupLanguages } from '@/lib/constants/languageGroups'

interface ContributionForm {
  language: string
  word: string
  definition: string
  category: string
  part_of_speech: string
  pronunciation_ipa: string
  dialect_variant: string
  etymology: string
  audio_url: string
  usage: string
  usage_example: string
  english_translation: string
  swahili_translation: string
}

export default function ContributePage() {
  const { user, loading } = useAuth()
  const router = useRouter()
  const [languages, setLanguages] = useState<any[]>([])
  const [status, setStatus] = useState<'idle' | 'submitting' | 'success' | 'error'>('idle')
  const [errorMessage, setErrorMessage] = useState('')
  const [isDuplicate, setIsDuplicate] = useState(false)
  const [uploadingAudio, setUploadingAudio] = useState(false)
  const [audioUploadError, setAudioUploadError] = useState('')
  const [recordingSupported, setRecordingSupported] = useState(false)
  const [isRecording, setIsRecording] = useState(false)
  const [recordedPreviewUrl, setRecordedPreviewUrl] = useState<string | null>(null)
  const [recordedBlob, setRecordedBlob] = useState<Blob | null>(null)
  const mediaRecorderRef = useRef<MediaRecorder | null>(null)
  const mediaStreamRef = useRef<MediaStream | null>(null)
  const recordedChunksRef = useRef<Blob[]>([])

  const initialForm: ContributionForm = {
    language: '',
    word: '',
    definition: '',
    category: '',
    part_of_speech: '',
    pronunciation_ipa: '',
    dialect_variant: '',
    etymology: '',
    audio_url: '',
    usage: 'both',
    usage_example: '',
    english_translation: '',
    swahili_translation: ''
  }

  const [formData, setFormData] = useState<ContributionForm>(initialForm)
  const [contributionMode, setContributionMode] = useState<'word' | 'phrase'>('word')
  const selectedLanguage = languages.find((l: any) => l.id === formData.language)
  const selectedLanguageCode = String(selectedLanguage?.code || '').toLowerCase()
  const isPhrase = contributionMode === 'phrase'
  const englishRequired = selectedLanguageCode === 'sw'
  const swahiliRequired = selectedLanguageCode === 'en'
  const groupedLanguages = groupLanguages(languages)

  useEffect(() => {
    if (!loading && !user) router.push('/login')
  }, [user, loading, router])

  useEffect(() => {
    async function loadLanguages() {
      try {
        const langs = await getLanguages()
        setLanguages(langs)

        const requestedCode = typeof window !== 'undefined'
          ? String(new URLSearchParams(window.location.search).get('lang') || '').toLowerCase()
          : ''
        if (requestedCode && !formData.language) {
          const matched = (langs || []).find((l: any) => String(l.code || '').toLowerCase() === requestedCode)
          if (matched?.id) {
            setFormData((prev) => ({ ...prev, language: matched.id }))
          }
        }
      } catch (err) {
        console.error('Failed to fetch languages')
      }
    }
    loadLanguages()
  }, [formData.language])

  useEffect(() => {
    const requestedType =
      typeof window !== 'undefined'
        ? String(new URLSearchParams(window.location.search).get('type') || '').toLowerCase()
        : ''

    if (requestedType === 'phrase') {
      setContributionMode('phrase')
      setFormData((prev) => ({ ...prev, part_of_speech: 'phrase' }))
      return
    }

    setContributionMode('word')
    setFormData((prev) => ({
      ...prev,
      part_of_speech: String(prev.part_of_speech || '').toLowerCase() === 'phrase' ? '' : prev.part_of_speech
    }))
  }, [])

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

  // Duplicate Check Logic
  useEffect(() => {
    const checkDuplicate = async () => {
      if (formData.word.length > 1 && formData.language) {
        const { data } = await supabase
          .from('entries')
          .select('id')
          .eq('headword', formData.word.trim())
          .eq('language_id', formData.language)
          .maybeSingle()
        setIsDuplicate(!!data)
      }
    }
    const timer = setTimeout(checkDuplicate, 500)
    return () => clearTimeout(timer)
  }, [formData.word, formData.language])

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!user || isDuplicate) return

    const english = formData.english_translation.trim()
    const swahili = formData.swahili_translation.trim()

    try {
      validateEntryRules({
        languageCode: selectedLanguageCode,
        headword: formData.word,
        primaryDefinition: formData.definition,
        partOfSpeech: isPhrase ? 'phrase' : formData.part_of_speech,
        englishTranslation: english,
        swahiliTranslation: swahili,
        usageExample: formData.usage_example
      })

      if (isPhrase && !formData.usage_example.trim()) {
        throw new Error('Phrase submissions should include a usage example.')
      }
    } catch (validationError) {
      setStatus('error')
      setErrorMessage(validationError instanceof Error ? validationError.message : 'Entry validation failed.')
      return
    }

    setStatus('submitting')
    setErrorMessage('')

    try {
      await createEntry({
        language_id: formData.language,
        headword: formData.word.trim(),
        primary_definition: formData.definition,
        category: formData.category || undefined,
        part_of_speech: isPhrase ? 'phrase' : formData.part_of_speech || undefined,
        pronunciation_ipa: formData.pronunciation_ipa || undefined,
        dialect_variant: formData.dialect_variant || undefined,
        etymology: formData.etymology || undefined,
        audio_url: formData.audio_url || undefined,
        register: formData.usage,
        created_by: user.id,
        usage_example: formData.usage_example,
        english_translation: english,
        swahili_translation: swahili
      })

      setStatus('success')
      window.scrollTo({ top: 0, behavior: 'smooth' })
    } catch (err: any) {
      if (err.code === '23505') {
        setErrorMessage(`This ${isPhrase ? 'phrase' : 'word'} already exists in the selected language.`)
      } else {
        setErrorMessage(err.message || `Failed to submit ${isPhrase ? 'phrase' : 'word'}`)
      }
      setStatus('error')
    }
  }

  const handleAudioFileChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
    if (!user) return
    const file = e.target.files?.[0]
    if (!file) return

    setUploadingAudio(true)
    setAudioUploadError('')
    try {
      const url = await uploadEntryAudio(user.id, file)
      setFormData((prev) => ({ ...prev, audio_url: url }))
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to upload audio.'
      setAudioUploadError(message)
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
        if (event.data && event.data.size > 0) {
          recordedChunksRef.current.push(event.data)
        }
      }

      recorder.onstop = () => {
        const blob = new Blob(recordedChunksRef.current, { type: recorder.mimeType || 'audio/webm' })
        setRecordedBlob(blob)
        if (recordedPreviewUrl) {
          URL.revokeObjectURL(recordedPreviewUrl)
        }
        setRecordedPreviewUrl(URL.createObjectURL(blob))
        stream.getTracks().forEach((t) => t.stop())
        mediaStreamRef.current = null
        setIsRecording(false)
      }

      recorder.start()
      setIsRecording(true)
    } catch (err) {
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
    if (!user || !recordedBlob) return
    setUploadingAudio(true)
    setAudioUploadError('')
    try {
      const fileExt = recordedBlob.type.includes('webm') ? 'webm' : 'wav'
      const recordedFile = new File([recordedBlob], `recorded-pronunciation-${Date.now()}.${fileExt}`, {
        type: recordedBlob.type || 'audio/webm'
      })
      const url = await uploadEntryAudio(user.id, recordedFile)
      setFormData((prev) => ({ ...prev, audio_url: url }))
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to upload recorded audio.'
      setAudioUploadError(message)
    } finally {
      setUploadingAudio(false)
    }
  }

  const resetForm = () => {
    setFormData({
      ...initialForm,
      part_of_speech: contributionMode === 'phrase' ? 'phrase' : ''
    })
    setStatus('idle')
    setIsDuplicate(false)
  }

  if (loading || !user) return null

  if (status === 'success') {
    return (
      <div className="min-h-screen bg-neutral-100 flex items-center justify-center p-6">
        <div className="bg-neutral-100 rounded-[3rem] p-12 max-w-xl w-full text-center shadow-soft border border-accent-200">
          <div className="w-24 h-24 bg-accent-50 text-accent-700 rounded-3xl flex items-center justify-center text-5xl mx-auto mb-8 animate-bounce">🎊</div>
          <h2 className="text-4xl font-black text-heritage-dark mb-4 font-display tracking-tight">Asante Sana!</h2>
          <p className="text-neutral-500 mb-10 text-xl font-medium leading-relaxed">
            Your {isPhrase ? 'phrase' : 'word'} contribution of <span className="text-accent-700 font-black italic">"{formData.word}"</span> has been recorded for review.
          </p>
          <div className="grid gap-4">
            <button onClick={resetForm} className="btn-primary">
              {isPhrase ? 'Add Another Phrase' : 'Add Another Word'}
            </button>
            <Link href="/" className="block w-full py-4 text-neutral-400 font-bold hover:text-accent-700 transition-colors uppercase tracking-widest text-xs">Return Home</Link>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-neutral-100 pb-20">
      <div className="relative overflow-hidden bg-heritage-dark text-white py-20 md:py-28 px-4 sm:px-6">
        <div className="relative max-w-5xl mx-auto text-center">
          <p className="text-xs uppercase tracking-[0.35em] text-accent-300 mb-4 font-semibold\">Be a Guardian of Language</p>
          <h1 className="text-5xl md:text-6xl lg:text-7xl font-black leading-tight max-w-3xl mx-auto font-display\">
            {isPhrase ? 'Share a Phrase' : 'Share a Word'}
          </h1>
          <p className="mt-6 text-base md:text-lg text-white max-w-2xl mx-auto leading-8\">
            {isPhrase
              ? 'Document the expressions, proverbs, and sayings that carry your culture. Show the world how your language truly lives.'
              : "The words you know might be the only place they're recorded. Help us preserve them."}
          </p>
        </div>
      </div>

      <div className="max-w-3xl mx-auto px-4 -mt-10 relative z-20">
        <form onSubmit={handleSubmit} className="bg-neutral-50 rounded-[2.5rem] shadow-xl border border-neutral-200 overflow-hidden">
          <div className="h-2 bg-heritage-dark w-full"></div>
          
          <div className="p-8 md:p-14">
            {(status === 'error' || isDuplicate) && (
              <div className="bg-red-50 text-red-700 p-5 rounded-2xl mb-10 flex items-center gap-4 border border-red-100 font-bold italic">
                <span>⚠️</span> {isDuplicate ? "This word already exists in this language!" : errorMessage}
              </div>
            )}

            <div className="space-y-10">
              <div className="group">
                <label className="block text-xs font-black text-neutral-400 uppercase mb-4">Contribution Type</label>
                <div className="grid md:grid-cols-2 gap-4">
                  <button
                    type="button"
                    onClick={() => {
                      setContributionMode('word')
                      setFormData((prev) => ({
                        ...prev,
                        part_of_speech: String(prev.part_of_speech || '').toLowerCase() === 'phrase' ? '' : prev.part_of_speech
                      }))
                    }}
                    className={`rounded-2xl border-2 px-5 py-5 text-left transition-all ${
                      !isPhrase ? 'border-heritage-dark bg-accent-50' : 'border-neutral-200 bg-neutral-50 hover:border-neutral-300'
                    }`}
                  >
                    <p className="text-sm font-black text-neutral-900 uppercase tracking-widest mb-1">Word Entry</p>
                    <p className="text-sm text-neutral-500 font-medium">
                      Use this for a single lexical item such as a noun, verb, adjective, or interjection.
                    </p>
                  </button>
                  <button
                    type="button"
                    onClick={() => {
                      setContributionMode('phrase')
                      setFormData((prev) => ({ ...prev, part_of_speech: 'phrase' }))
                    }}
                    className={`rounded-2xl border-2 px-5 py-5 text-left transition-all ${
                      isPhrase ? 'border-heritage-dark bg-accent-50' : 'border-neutral-200 bg-neutral-50 hover:border-neutral-300'
                    }`}
                  >
                    <p className="text-sm font-black text-neutral-900 uppercase tracking-widest mb-1">Phrase Entry</p>
                    <p className="text-sm text-stone-500 font-medium">
                      Use this for greetings, idioms, proverbs, set expressions, and multi-word speech patterns.
                    </p>
                  </button>
                </div>
              </div>

              {/* Language */}
              <div className="group">
                <label className="block text-xs font-black text-neutral-400 uppercase mb-4">Choose Language *</label>
                <select
                  required
                  value={formData.language}
                  onChange={(e) => setFormData({...formData, language: e.target.value})}
                  className="w-full px-6 py-5 bg-neutral-50 border-2 rounded-2xl focus:bg-white focus:border-heritage-dark outline-none"
                >
                  <option value="">Select language...</option>
                  {groupedLanguages.map((group) => (
                    <optgroup key={group.key} label={group.label}>
                      {group.languages.map((lang) => (
                        <option key={lang.id} value={lang.id}>{lang.name}</option>
                      ))}
                    </optgroup>
                  ))}
                </select>
              </div>

              {/* Word & Category */}
              <div className="grid md:grid-cols-2 gap-8">
                <div className="group">
                  <label className="block text-xs font-black text-stone-400 uppercase mb-4">
                    {isPhrase ? 'The Phrase *' : 'The Word *'}
                  </label>
                  <input
                    type="text"
                    required
                    placeholder={isPhrase ? 'e.g. habari yako' : 'e.g. Amani'}
                    value={formData.word}
                    onChange={(e) => setFormData({...formData, word: e.target.value})}
                    className="w-full px-6 py-5 bg-neutral-50 border-2 rounded-2xl focus:bg-white focus:border-heritage-dark outline-none"
                  />
                </div>
                <div className="group">
                  <label className="block text-xs font-black text-neutral-400 uppercase mb-4">Category</label>
                  <select
                    value={formData.category}
                    onChange={(e) => setFormData({...formData, category: e.target.value})}
                    className="w-full px-6 py-5 bg-neutral-50 border-2 rounded-2xl focus:bg-white focus:border-heritage-dark outline-none"
                  >
                    <option value="">Select topic...</option>
                    {CATEGORIES.map(cat => (<option key={cat.id} value={cat.id}>{cat.icon} {cat.name}</option>))}
                  </select>
                </div>
              </div>

              {/* Linguistic Metadata */}
              <div className="grid md:grid-cols-2 gap-8">
                <div className="group">
                  <label className="block text-xs font-black text-neutral-400 uppercase mb-4">Part of Speech</label>
                  <select
                    value={formData.part_of_speech}
                    onChange={(e) => {
                      const value = e.target.value
                      setFormData({ ...formData, part_of_speech: value })
                      setContributionMode(value === 'phrase' ? 'phrase' : 'word')
                    }}
                    className="w-full px-6 py-5 bg-neutral-50 border-2 rounded-2xl focus:bg-white focus:border-heritage-dark outline-none"
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
                <div className="group">
                  <label className="block text-xs font-black text-neutral-400 uppercase mb-4">
                    Pronunciation (IPA)
                  </label>
                  <input
                    type="text"
                    placeholder="e.g. /a.ma.ni/"
                    value={formData.pronunciation_ipa}
                    onChange={(e) => setFormData({ ...formData, pronunciation_ipa: e.target.value })}
                    className="w-full px-6 py-5 bg-neutral-50 border-2 rounded-2xl focus:bg-white focus:border-heritage-dark outline-none"
                  />
                </div>
              </div>

              <div className="grid md:grid-cols-2 gap-8">
                <div className="group">
                  <label className="block text-xs font-black text-neutral-400 uppercase mb-4">
                    Dialect Variant
                  </label>
                  <input
                    type="text"
                    placeholder="e.g. Central, Coastal, Urban"
                    value={formData.dialect_variant}
                    onChange={(e) => setFormData({ ...formData, dialect_variant: e.target.value })}
                    className="w-full px-6 py-5 bg-neutral-50 border-2 rounded-2xl focus:bg-white focus:border-heritage-dark outline-none"
                  />
                </div>
                <div className="group">
                  <label className="block text-xs font-black text-stone-400 uppercase mb-4">
                    Audio URL
                  </label>
                  <div className="space-y-3">
                    <input
                      type="url"
                      placeholder="https://..."
                      value={formData.audio_url}
                      onChange={(e) => setFormData({ ...formData, audio_url: e.target.value })}
                      className="w-full px-6 py-5 bg-neutral-50 border-2 rounded-2xl focus:bg-white focus:border-heritage-dark outline-none"
                    />
                    <div className="rounded-2xl border-2 border-dashed border-stone-200 bg-stone-50 p-4">
                      <label className="block text-[10px] font-black text-stone-500 uppercase tracking-widest mb-2">
                        Or Upload Audio File
                      </label>
                      <input
                        type="file"
                        accept="audio/*"
                        onChange={handleAudioFileChange}
                        disabled={uploadingAudio}
                        className="w-full text-xs text-neutral-500 file:mr-3 file:rounded-lg file:border-0 file:bg-heritage-dark file:px-3 file:py-2 file:text-xs file:font-bold file:text-white"
                      />
                      {uploadingAudio && (
                        <p className="text-xs text-accent-600 font-bold mt-2">Uploading audio...</p>
                      )}
                      {audioUploadError && (
                        <p className="text-xs text-red-600 font-bold mt-2">{audioUploadError}</p>
                      )}
                      <p className="text-[11px] text-stone-400 mt-2">
                        Supported: MP3, WAV, M4A, OGG. Max size: 15MB.
                      </p>
                    </div>
                    <div className="rounded-2xl border border-stone-200 bg-white p-4">
                      <p className="text-[10px] font-black text-stone-500 uppercase tracking-widest mb-3">
                        Record Pronunciation
                      </p>
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
                          className="px-4 py-2 rounded-xl bg-heritage-dark text-white text-xs font-black uppercase tracking-widest disabled:opacity-50"
                        >
                          Upload Recording
                        </button>
                      </div>
                      {!recordingSupported && (
                        <p className="text-xs text-stone-400 mt-2">
                          This browser does not support in-app audio recording.
                        </p>
                      )}
                    </div>
                    {recordedPreviewUrl && (
                      <div className="bg-stone-50 border border-stone-200 rounded-2xl p-4">
                        <p className="text-[10px] font-black text-stone-500 uppercase tracking-widest mb-2">
                          Recorded Preview
                        </p>
                        <audio controls className="w-full">
                          <source src={recordedPreviewUrl} />
                          Your browser does not support audio playback.
                        </audio>
                      </div>
                    )}
                    {formData.audio_url && (
                      <div className="bg-stone-50 border border-stone-200 rounded-2xl p-4">
                        <p className="text-[10px] font-black text-stone-500 uppercase tracking-widest mb-2">
                          Audio Preview
                        </p>
                        <audio controls className="w-full">
                          <source src={formData.audio_url} />
                          Your browser does not support audio playback.
                        </audio>
                      </div>
                    )}
                  </div>
                </div>
              </div>

                            {/* Definition */}
              <div className="group">
                <label className="block text-xs font-black text-neutral-400 uppercase mb-4">
                  {isPhrase ? 'Meaning, Use, and Definition *' : 'Meaning & Definition *'}
                </label>
                <textarea
                  required
                  rows={3}
                  placeholder={isPhrase ? 'Explain what this phrase means, when people use it, and what tone or situation it fits...' : 'What does this word mean?'}
                  value={formData.definition}
                  onChange={(e) =>
                    setFormData({ ...formData, definition: e.target.value })
                  }
                  className="w-full px-6 py-5 bg-neutral-50 border-2 border-neutral-50 rounded-2xl focus:bg-white focus:border-heritage-dark outline-none font-medium text-gray-800 resize-none leading-relaxed"
                />
              </div>

              {/* English Translation */}
              <div className="group">
                <label className="block text-xs font-black text-neutral-400 uppercase mb-4">
                  English Translation {englishRequired ? '*' : '(Optional)'}
                </label>
                <input
                  type="text"
                  placeholder="Enter English equivalent..."
                  value={formData.english_translation}
                  onChange={(e) =>
                    setFormData({
                      ...formData,
                      english_translation: e.target.value,
                    })
                  }
                  className="w-full px-6 py-5 bg-neutral-50 border-2 border-neutral-50 rounded-2xl focus:bg-white focus:border-heritage-dark outline-none font-medium text-gray-800"
                />
              </div>

              {/* Swahili Translation */}
              <div className="group">
                <label className="block text-xs font-black text-neutral-400 uppercase mb-4">
                  Swahili Translation {swahiliRequired ? '*' : '(Optional)'}
                </label>
                <input
                  type="text"
                  placeholder="Enter Swahili equivalent..."
                  value={formData.swahili_translation}
                  onChange={(e) =>
                    setFormData({
                      ...formData,
                      swahili_translation: e.target.value,
                    })
                  }
                  className="w-full px-6 py-5 bg-neutral-50 border-2 border-neutral-50 rounded-2xl focus:bg-white focus:border-heritage-dark outline-none font-medium text-gray-800"
                />
              </div>

              {/* Etymology */}
              <div className="group">
                <label className="block text-xs font-black text-neutral-400 uppercase mb-4">
                  {isPhrase ? 'Phrase in Use *' : 'Usage Example (Optional)'}
                </label>
                <textarea
                  rows={2}
                  placeholder={isPhrase ? 'Use the phrase in a natural sentence or dialogue...' : 'Use the word in a sentence or explain its cultural context...'}
                  value={formData.usage_example}
                  onChange={(e) =>
                    setFormData({ ...formData, usage_example: e.target.value })
                  }
                  className="w-full px-6 py-5 bg-neutral-50 border-2 border-neutral-50 rounded-2xl focus:bg-white focus:border-heritage-dark outline-none font-medium text-gray-800 resize-none leading-relaxed italic"
                />
              </div>

              <div className="rounded-2xl border border-accent-300/30 bg-accent-50 p-4">
                <p className="text-[11px] font-black text-accent-700 uppercase tracking-widest mb-1">
                  Bridge Rule
                </p>
                <p className="text-sm text-accent-700">
                  Every {isPhrase ? 'phrase' : 'entry'} must include at least one bridge translation (English or Swahili).
                  {swahiliRequired && ' English entries require Swahili translation.'}
                  {englishRequired && ' Swahili entries require English translation.'}
                </p>
                {isPhrase && (
                  <p className="text-sm text-accent-700 mt-2">
                    Phrase entries should have an explanatory definition and a real usage example, not only a direct gloss.
                  </p>
                )}
              </div>

              {/* Etymology */}
              <div className="group">
                <label className="block text-xs font-black text-stone-400 uppercase mb-4">
                  Etymology (Optional)
                </label>
                <textarea
                  rows={3}
                  placeholder="Origin history of this word, borrowings, or root form..."
                  value={formData.etymology}
                  onChange={(e) => setFormData({ ...formData, etymology: e.target.value })}
                  className="w-full px-6 py-5 bg-neutral-50 border-2 border-neutral-50 rounded-2xl focus:bg-white focus:border-heritage-dark outline-none font-medium text-gray-800 resize-none leading-relaxed"
                />
              </div>
            </div>

            <div className="mt-14 pt-10 border-t border-stone-100">
              <button
                type="submit"
                disabled={status === 'submitting' || isDuplicate}
                className="w-full btn-primary text-xl disabled:opacity-50 flex items-center justify-center gap-4 group"
              >
                {status === 'submitting'
                  ? `Recording ${isPhrase ? 'phrase' : 'word'}...`
                  : `Submit ${isPhrase ? 'Phrase' : 'Word'} for Review ${'->'}`}
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
  )
}
