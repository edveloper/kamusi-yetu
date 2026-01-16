'use client'

import { useAuth } from '@/lib/contexts/AuthContext'
import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'
import { createEntry } from '@/lib/api/entries'
import { getLanguages } from '@/lib/api/languages'
import { CATEGORIES } from '@/lib/constants'
import { supabase } from '@/lib/supabase' // Added for duplicate check
import Link from 'next/link'

interface ContributionForm {
  language: string
  word: string
  definition: string
  category: string 
  usage: string
  usage_example: string // Added
}

export default function ContributePage() {
  const { user, loading } = useAuth()
  const router = useRouter()
  const [languages, setLanguages] = useState<any[]>([])
  const [status, setStatus] = useState<'idle' | 'submitting' | 'success' | 'error'>('idle')
  const [errorMessage, setErrorMessage] = useState('')
  const [isDuplicate, setIsDuplicate] = useState(false)

  const initialForm: ContributionForm = {
    language: '',
    word: '',
    definition: '',
    category: '', 
    usage: 'both',
    usage_example: ''
  }

  const [formData, setFormData] = useState<ContributionForm>(initialForm)

  useEffect(() => {
    if (!loading && !user) router.push('/login')
  }, [user, loading, router])

  useEffect(() => {
    async function loadLanguages() {
      try {
        const langs = await getLanguages()
        setLanguages(langs)
      } catch (err) {
        console.error('Failed to fetch languages')
      }
    }
    loadLanguages()
  }, [])

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
    setStatus('submitting')
    setErrorMessage('')

    try {
      await createEntry({
        language_id: formData.language,
        headword: formData.word.trim(),
        primary_definition: formData.definition,
        category: formData.category || undefined,
        register: formData.usage,
        created_by: user.id,
        usage_example: formData.usage_example // Passed to API
      })

      setStatus('success')
      window.scrollTo({ top: 0, behavior: 'smooth' })
    } catch (err: any) {
      // Handle the specific Postgres unique constraint error
      if (err.code === '23505') {
        setErrorMessage('This word already exists in the selected language.')
      } else {
        setErrorMessage(err.message || 'Failed to submit word')
      }
      setStatus('error')
    }
  }

  const resetForm = () => {
    setFormData(initialForm)
    setStatus('idle')
    setIsDuplicate(false)
  }

  if (loading || !user) return null

  if (status === 'success') {
    return (
      <div className="min-h-screen bg-stone-50 flex items-center justify-center p-6">
        <div className="bg-white rounded-[3rem] p-12 max-w-xl w-full text-center shadow-2xl border border-stone-100">
          <div className="w-24 h-24 bg-emerald-50 text-emerald-600 rounded-3xl flex items-center justify-center text-5xl mx-auto mb-8 animate-bounce">🎊</div>
          <h2 className="text-4xl font-black text-gray-900 mb-4 font-logo tracking-tight">Asante Sana!</h2>
          <p className="text-stone-500 mb-10 text-xl font-medium leading-relaxed">
            Your contribution of <span className="text-emerald-600 font-black italic">"{formData.word}"</span> has been recorded for review.
          </p>
          <div className="grid gap-4">
            <button onClick={resetForm} className="w-full bg-emerald-600 text-white py-5 rounded-2xl font-black text-lg hover:bg-emerald-700 transition shadow-xl shadow-emerald-900/10">
              Add Another Word
            </button>
            <Link href="/" className="block w-full py-4 text-stone-400 font-bold hover:text-emerald-600 transition-colors uppercase tracking-widest text-xs">Return Home</Link>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-stone-50 py-16">
      <div className="max-w-3xl mx-auto px-4">
        <div className="text-center mb-12">
          <h1 className="text-5xl md:text-6xl font-black text-gray-900 mb-4 tracking-tight font-logo">Contribute</h1>
          <p className="text-stone-500 text-xl font-medium">Record a word, preserve a legacy.</p>
        </div>

        <form onSubmit={handleSubmit} className="bg-white rounded-[2.5rem] shadow-xl border border-stone-200 overflow-hidden">
          <div className="h-2 bg-emerald-600 w-full"></div>
          
          <div className="p-8 md:p-14">
            {(status === 'error' || isDuplicate) && (
              <div className="bg-red-50 text-red-700 p-5 rounded-2xl mb-10 flex items-center gap-4 border border-red-100 font-bold italic">
                <span>⚠️</span> {isDuplicate ? "This word already exists in this language!" : errorMessage}
              </div>
            )}

            <div className="space-y-10">
              {/* 1. Language */}
              <div className="group">
                <label className="block text-xs font-black text-stone-400 uppercase tracking-widest mb-4 ml-1 group-focus-within:text-emerald-600 transition-colors">1. Choose Language *</label>
                <select
                  required
                  value={formData.language}
                  onChange={(e) => setFormData({...formData, language: e.target.value})}
                  className="w-full px-6 py-5 bg-stone-50 border-2 border-stone-50 rounded-2xl focus:bg-white focus:border-emerald-500 transition-all outline-none font-bold text-gray-900 appearance-none cursor-pointer"
                >
                  <option value="">Select language...</option>
                  {languages.map(lang => (<option key={lang.id} value={lang.id}>{lang.name}</option>))}
                </select>
              </div>

              {/* 2 & 3. Word & Category */}
              <div className="grid md:grid-cols-2 gap-8">
                <div className="group">
                  <label className="block text-xs font-black text-stone-400 uppercase tracking-widest mb-4 ml-1 group-focus-within:text-emerald-600 transition-colors">2. The Word *</label>
                  <input
                    type="text"
                    required
                    placeholder="e.g. Amani"
                    value={formData.word}
                    onChange={(e) => setFormData({...formData, word: e.target.value})}
                    className={`w-full px-6 py-5 bg-stone-50 border-2 rounded-2xl focus:bg-white transition-all outline-none font-black text-2xl text-gray-900 font-logo ${isDuplicate ? 'border-red-200 focus:border-red-500' : 'border-stone-50 focus:border-emerald-500'}`}
                  />
                </div>
                <div className="group">
                  <label className="block text-xs font-black text-stone-400 uppercase tracking-widest mb-4 ml-1 group-focus-within:text-emerald-600 transition-colors">3. Category</label>
                  <select
                    value={formData.category}
                    onChange={(e) => setFormData({...formData, category: e.target.value})}
                    className="w-full px-6 py-5 bg-stone-50 border-2 border-stone-50 rounded-2xl focus:bg-white focus:border-emerald-500 transition-all outline-none font-bold text-gray-900 appearance-none cursor-pointer"
                  >
                    <option value="">Select topic...</option>
                    {CATEGORIES.map(cat => (<option key={cat.id} value={cat.id}>{cat.icon} {cat.name}</option>))}
                  </select>
                </div>
              </div>

              {/* 4. Definition */}
              <div className="group">
                <label className="block text-xs font-black text-stone-400 uppercase tracking-widest mb-4 ml-1 group-focus-within:text-emerald-600 transition-colors">4. Meaning & Definition *</label>
                <textarea
                  required
                  rows={3}
                  placeholder="What does this word mean?"
                  value={formData.definition}
                  onChange={(e) => setFormData({...formData, definition: e.target.value})}
                  className="w-full px-6 py-5 bg-stone-50 border-2 border-stone-50 rounded-2xl focus:bg-white focus:border-emerald-500 transition-all outline-none font-medium text-gray-800 resize-none leading-relaxed"
                />
              </div>

              {/* 5. Usage Example (NEW) */}
              <div className="group">
                <label className="block text-xs font-black text-stone-400 uppercase tracking-widest mb-4 ml-1 group-focus-within:text-emerald-600 transition-colors">5. Usage Example (Optional)</label>
                <textarea
                  rows={2}
                  placeholder="Use the word in a sentence or explain its cultural context..."
                  value={formData.usage_example}
                  onChange={(e) => setFormData({...formData, usage_example: e.target.value})}
                  className="w-full px-6 py-5 bg-stone-50 border-2 border-stone-50 rounded-2xl focus:bg-white focus:border-emerald-500 transition-all outline-none font-medium text-gray-800 resize-none leading-relaxed italic"
                />
              </div>
            </div>

            <div className="mt-14 pt-10 border-t border-stone-100">
              <button
                type="submit"
                disabled={status === 'submitting' || isDuplicate}
                className="w-full bg-emerald-600 text-white px-8 py-6 rounded-[1.5rem] hover:bg-emerald-700 transition-all font-black text-xl shadow-2xl shadow-emerald-900/20 disabled:opacity-50 flex items-center justify-center gap-4 group"
              >
                {status === 'submitting' ? "Recording..." : "Submit for Review →"}
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
  )
}