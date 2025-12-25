'use client'

import { useAuth } from '@/lib/contexts/AuthContext'
import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'
import { mockLanguages } from '@/lib/mockData'

export default function ContributePage() {
  const { user, loading } = useAuth()
  const router = useRouter()
  const [mounted, setMounted] = useState(false)
  const [showOptional, setShowOptional] = useState(false)
  
  // Form state
  const [formData, setFormData] = useState({
    language: '',
    word: '',
    definition: '',
    englishTranslation: '',
    swahiliTranslation: '',
    exampleSentence: '',
    dialect: '',
    partOfSpeech: '',
    usage: 'both'
  })

  useEffect(() => {
    setMounted(true)
    if (!loading && !user) {
      router.push('/login')
    }
  }, [user, loading, router])

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    // TODO: Connect to Supabase
    alert('Word submitted! (Will connect to database soon)')
    router.push('/profile')
  }

  if (!mounted || loading || !user) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-500 mx-auto mb-4"></div>
          <p className="text-gray-600">Loading...</p>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50 py-8 md:py-12">
      <div className="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Header */}
        <div className="text-center mb-8">
          <h1 className="text-3xl md:text-4xl font-bold text-gray-900 mb-3">
            Contribute a Word
          </h1>
          <p className="text-base md:text-lg text-gray-600">
            Help preserve Kenyan languages for future generations
          </p>
        </div>

        {/* Form */}
        <form onSubmit={handleSubmit} className="bg-white rounded-2xl shadow-lg p-6 md:p-8">
          {/* Required Section */}
          <div className="space-y-6">
            <div className="border-b border-gray-200 pb-4">
              <h2 className="text-lg md:text-xl font-bold text-gray-900">Basic Information</h2>
              <p className="text-xs md:text-sm text-gray-600 mt-1">All fields are required</p>
            </div>

            {/* Language */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                What language is this word in? <span className="text-red-500">*</span>
              </label>
              <select
                required
                value={formData.language}
                onChange={(e) => setFormData({...formData, language: e.target.value})}
                className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500 text-sm md:text-base"
              >
                <option value="">Select a language...</option>
                {mockLanguages.map(lang => (
                  <option key={lang.id} value={lang.code}>{lang.name}</option>
                ))}
              </select>
            </div>

            {/* Word */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Write the word <span className="text-red-500">*</span>
              </label>
              <input
                type="text"
                required
                value={formData.word}
                onChange={(e) => setFormData({...formData, word: e.target.value})}
                placeholder="e.g., mtoto, kaana, nyathi"
                className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500 text-sm md:text-base"
              />
            </div>

            {/* Definition */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                What does it mean? <span className="text-red-500">*</span>
              </label>
              <textarea
                required
                rows={3}
                value={formData.definition}
                onChange={(e) => setFormData({...formData, definition: e.target.value})}
                placeholder="Provide a clear definition..."
                className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500 text-sm md:text-base"
              />
            </div>

            {/* Translations */}
            <div className="grid md:grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  English translation <span className="text-red-500">*</span>
                </label>
                <input
                  type="text"
                  required
                  value={formData.englishTranslation}
                  onChange={(e) => setFormData({...formData, englishTranslation: e.target.value})}
                  placeholder="e.g., child"
                  className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500 text-sm md:text-base"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Swahili translation <span className="text-red-500">*</span>
                </label>
                <input
                  type="text"
                  required
                  value={formData.swahiliTranslation}
                  onChange={(e) => setFormData({...formData, swahiliTranslation: e.target.value})}
                  placeholder="e.g., mtoto"
                  className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500 text-sm md:text-base"
                />
              </div>
            </div>
          </div>

          {/* Optional Section */}
          <div className="mt-8">
            <button
              type="button"
              onClick={() => setShowOptional(!showOptional)}
              className="flex items-center justify-between w-full px-4 py-3 bg-gray-50 hover:bg-gray-100 rounded-lg transition text-sm md:text-base"
            >
              <span className="font-medium text-gray-700">
                📝 Optional details (helps us verify)
              </span>
              <span className="text-gray-500">{showOptional ? '▲' : '▼'}</span>
            </button>

            {showOptional && (
              <div className="mt-6 space-y-6">
                {/* Example Sentence */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Use it in a sentence
                  </label>
                  <textarea
                    rows={2}
                    value={formData.exampleSentence}
                    onChange={(e) => setFormData({...formData, exampleSentence: e.target.value})}
                    placeholder="Show how the word is used..."
                    className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500 text-sm md:text-base"
                  />
                </div>

                {/* Dialect */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Which dialect?
                  </label>
                  <input
                    type="text"
                    value={formData.dialect}
                    onChange={(e) => setFormData({...formData, dialect: e.target.value})}
                    placeholder="e.g., Gĩgĩcũgũ, Maragoli, etc."
                    className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500 text-sm md:text-base"
                  />
                  <p className="text-xs text-gray-500 mt-1">Leave blank if not sure or standard</p>
                </div>

                {/* Part of Speech */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Part of speech
                  </label>
                  <select
                    value={formData.partOfSpeech}
                    onChange={(e) => setFormData({...formData, partOfSpeech: e.target.value})}
                    className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500 text-sm md:text-base"
                  >
                    <option value="">Select...</option>
                    <option value="noun">Noun</option>
                    <option value="verb">Verb</option>
                    <option value="adjective">Adjective</option>
                    <option value="adverb">Adverb</option>
                    <option value="other">Other</option>
                  </select>
                </div>

                {/* Usage Type */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Usage type
                  </label>
                  <div className="flex flex-wrap gap-2">
                    {['formal', 'informal', 'both', 'slang', 'archaic'].map(type => (
                      <button
                        key={type}
                        type="button"
                        onClick={() => setFormData({...formData, usage: type})}
                        className={`px-4 py-2 rounded-full text-sm font-medium transition ${
                          formData.usage === type
                            ? 'bg-primary-500 text-white'
                            : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                        }`}
                      >
                        {type.charAt(0).toUpperCase() + type.slice(1)}
                      </button>
                    ))}
                  </div>
                </div>
              </div>
            )}
          </div>

          {/* Submit */}
          <div className="mt-8 pt-6 border-t border-gray-200">
            <button
              type="submit"
              className="w-full bg-primary-500 text-white px-6 py-4 rounded-xl hover:bg-primary-600 transition font-bold text-base md:text-lg shadow-lg"
            >
              Submit for Review
            </button>
            <p className="text-xs md:text-sm text-gray-600 text-center mt-4">
              💡 Your submission will be reviewed by native speakers within 48 hours
            </p>
          </div>
        </form>
      </div>
    </div>
  )
}