'use client'

import { useState, useEffect } from 'react'
import { getLanguages } from '@/lib/api/languages'

interface LanguageSelectorProps {
  selectedLanguages: string[]
  onLanguagesChange: (languages: string[]) => void
  onClose: () => void
}

export default function LanguageSelector({ 
  selectedLanguages, 
  onLanguagesChange,
  onClose 
}: LanguageSelectorProps) {
  const [allLanguages, setAllLanguages] = useState<any[]>([])
  const [loading, setLoading] = useState(true)
  const [searchQuery, setSearchQuery] = useState('')

  useEffect(() => {
    async function loadLanguages() {
      try {
        const langs = await getLanguages()
        setAllLanguages(langs)
      } catch (err) {
        console.error('Failed to load languages:', err)
      } finally {
        setLoading(false)
      }
    }
    loadLanguages()
  }, [])

  const filteredLanguages = allLanguages.filter(lang => 
    lang.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
    (lang.native_name && lang.native_name.toLowerCase().includes(searchQuery.toLowerCase()))
  )

  const toggleLanguage = (languageId: string) => {
    if (selectedLanguages.includes(languageId)) {
      onLanguagesChange(selectedLanguages.filter(id => id !== languageId))
    } else {
      onLanguagesChange([...selectedLanguages, languageId])
    }
  }

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
      <div className="bg-white rounded-2xl shadow-2xl max-w-2xl w-full max-h-[80vh] flex flex-col">
        {/* Header */}
        <div className="p-6 border-b border-gray-200">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-2xl font-bold text-gray-900">Select Your Languages</h2>
            <button 
              onClick={onClose}
              className="text-gray-400 hover:text-gray-600 text-2xl leading-none"
            >
              ×
            </button>
          </div>
          
          {/* Search */}
          <input
            type="text"
            placeholder="Search languages..."
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500"
          />
        </div>

        {/* Language List */}
        <div className="flex-1 overflow-y-auto p-6">
          {loading ? (
            <div className="text-center py-8">
              <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-primary-500 mx-auto"></div>
            </div>
          ) : filteredLanguages.length === 0 ? (
            <div className="text-center py-8 text-gray-600">
              No languages found matching "{searchQuery}"
            </div>
          ) : (
            <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
              {filteredLanguages.map((lang) => {
                const isSelected = selectedLanguages.includes(lang.id)
                return (
                  <button
                    key={lang.id}
                    onClick={() => toggleLanguage(lang.id)}
                    className={`p-4 rounded-lg border-2 transition text-left ${
                      isSelected
                        ? 'border-primary-500 bg-primary-50'
                        : 'border-gray-200 hover:border-primary-300'
                    }`}
                  >
                    <div className="flex items-center justify-between">
                      <div>
                        <p className="font-bold text-gray-900">{lang.name}</p>
                        {lang.native_name && lang.native_name !== lang.name && (
                          <p className="text-sm text-gray-600">{lang.native_name}</p>
                        )}
                      </div>
                      {isSelected && (
                        <div className="text-primary-600 text-xl">✓</div>
                      )}
                    </div>
                  </button>
                )
              })}
            </div>
          )}
        </div>

        {/* Footer */}
        <div className="p-6 border-t border-gray-200 bg-gray-50">
          <div className="flex items-center justify-between">
            <p className="text-sm text-gray-600">
              {selectedLanguages.length} language{selectedLanguages.length !== 1 ? 's' : ''} selected
            </p>
            <button
              onClick={onClose}
              className="bg-primary-500 text-white px-6 py-2 rounded-lg hover:bg-primary-600 transition font-medium"
            >
              Done
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}