'use client'

import { useAuth } from '@/lib/contexts/AuthContext'
import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'
import { mockLanguages } from '@/lib/mockData'
import Link from 'next/link'

export default function ModeratePage() {
  const { user, loading } = useAuth()
  const router = useRouter()
  const [mounted, setMounted] = useState(false)
  const [selectedTab, setSelectedTab] = useState<'pending' | 'flagged' | 'recent'>('pending')

  useEffect(() => {
    setMounted(true)
    if (!loading && !user) {
      router.push('/login')
    }
  }, [user, loading, router])

  // Mock pending submissions
  const pendingSubmissions = [
    {
      id: 1,
      word: 'duol',
      language: 'Dholuo',
      definition: 'Traditional meal made from millet',
      translations: { english: 'millet meal', swahili: 'ugali wa mtama' },
      example: 'Waduol gi alot ber (Duol with fish is good)',
      submittedBy: 'User_Akinyi',
      reputation: 12,
      submittedDate: '2 days ago'
    },
    {
      id: 2,
      word: 'gĩthaka',
      language: 'Kikuyu',
      definition: 'Traditional land holding, communal land',
      translations: { english: 'ancestral land', swahili: 'ardhi ya kabila' },
      example: 'Gĩthaka kĩa mũhĩrĩga witũ kĩrĩ Mũrang\'a',
      submittedBy: 'User_Kamau',
      reputation: 23,
      submittedDate: '5 hours ago'
    },
    {
      id: 3,
      word: 'mshenzi',
      language: 'Swahili',
      definition: 'Uncivilized person, barbarian',
      translations: { english: 'barbarian', swahili: 'mshenzi' },
      example: 'Usiniite mshenzi!',
      submittedBy: 'User_Juma',
      reputation: 5,
      submittedDate: '1 day ago'
    }
  ]

  const flaggedEntries = [
    {
      id: 4,
      word: 'kihii',
      language: 'Kikuyu',
      reason: 'Potentially offensive',
      flaggedBy: 2,
      date: '3 days ago'
    }
  ]

  const recentActions = [
    { id: 1, action: 'approved', word: 'harambee', language: 'Swahili', when: '1 hour ago' },
    { id: 2, action: 'rejected', word: 'spam123', language: 'English', when: '3 hours ago' },
    { id: 3, action: 'edited', word: 'chakula', language: 'Swahili', when: '5 hours ago' },
  ]

  const [reviewingId, setReviewingId] = useState<number | null>(null)

  const handleAction = (id: number, action: 'approve' | 'reject' | 'edit' | 'flag') => {
    // TODO: Connect to Supabase
    alert(`${action} submission ID: ${id}`)
    setReviewingId(null)
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
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-white border-b border-gray-200">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6 md:py-8">
          <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
            <div>
              <h1 className="text-2xl md:text-3xl font-bold text-gray-900">Moderation Dashboard</h1>
              <p className="text-sm md:text-base text-gray-600 mt-1">
                Review and validate community contributions
              </p>
            </div>
            <div className="flex items-center gap-3">
              <select className="px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-primary-500">
                <option value="all">All Languages</option>
                {mockLanguages.map(lang => (
                  <option key={lang.id} value={lang.code}>{lang.name}</option>
                ))}
              </select>
            </div>
          </div>

          {/* Stats */}
          <div className="grid grid-cols-2 md:grid-cols-4 gap-3 md:gap-4 mt-6">
            <div className="bg-yellow-50 border-2 border-yellow-200 rounded-xl p-3 md:p-4">
              <div className="text-2xl md:text-3xl font-bold text-yellow-700">{pendingSubmissions.length}</div>
              <div className="text-xs md:text-sm text-yellow-600 mt-1">Pending Review</div>
            </div>
            <div className="bg-red-50 border-2 border-red-200 rounded-xl p-3 md:p-4">
              <div className="text-2xl md:text-3xl font-bold text-red-700">{flaggedEntries.length}</div>
              <div className="text-xs md:text-sm text-red-600 mt-1">Flagged</div>
            </div>
            <div className="bg-green-50 border-2 border-green-200 rounded-xl p-3 md:p-4">
              <div className="text-2xl md:text-3xl font-bold text-green-700">23</div>
              <div className="text-xs md:text-sm text-green-600 mt-1">This Week</div>
            </div>
            <div className="bg-blue-50 border-2 border-blue-200 rounded-xl p-3 md:p-4">
              <div className="text-2xl md:text-3xl font-bold text-blue-700">847</div>
              <div className="text-xs md:text-sm text-blue-600 mt-1">Your Score</div>
            </div>
          </div>
        </div>
      </div>

      {/* Tabs */}
      <div className="bg-white border-b border-gray-200 sticky top-16 z-40">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex gap-1 overflow-x-auto">
            <button
              onClick={() => setSelectedTab('pending')}
              className={`px-4 md:px-6 py-3 md:py-4 font-medium text-sm md:text-base whitespace-nowrap transition ${
                selectedTab === 'pending'
                  ? 'text-primary-600 border-b-2 border-primary-600'
                  : 'text-gray-600 hover:text-gray-900'
              }`}
            >
              🔔 Pending ({pendingSubmissions.length})
            </button>
            <button
              onClick={() => setSelectedTab('flagged')}
              className={`px-4 md:px-6 py-3 md:py-4 font-medium text-sm md:text-base whitespace-nowrap transition ${
                selectedTab === 'flagged'
                  ? 'text-primary-600 border-b-2 border-primary-600'
                  : 'text-gray-600 hover:text-gray-900'
              }`}
            >
              🚨 Flagged ({flaggedEntries.length})
            </button>
            <button
              onClick={() => setSelectedTab('recent')}
              className={`px-4 md:px-6 py-3 md:py-4 font-medium text-sm md:text-base whitespace-nowrap transition ${
                selectedTab === 'recent'
                  ? 'text-primary-600 border-b-2 border-primary-600'
                  : 'text-gray-600 hover:text-gray-900'
              }`}
            >
              📜 Recent Activity
            </button>
          </div>
        </div>
      </div>

      {/* Content */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6 md:py-8">
        {/* Pending Tab */}
        {selectedTab === 'pending' && (
          <div className="space-y-4 md:space-y-6">
            {pendingSubmissions.map((submission) => (
              <div key={submission.id} className="bg-white rounded-xl shadow-md border border-gray-200 overflow-hidden">
                {/* Header */}
                <div className="bg-gray-50 px-4 md:px-6 py-3 md:py-4 border-b border-gray-200">
                  <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-2">
                    <div className="flex items-center gap-3">
                      <span className="bg-yellow-100 text-yellow-700 px-2 py-1 rounded text-xs font-bold">
                        NEW
                      </span>
                      <span className="text-xs md:text-sm text-gray-600">{submission.language}</span>
                    </div>
                    <div className="flex items-center gap-2 text-xs md:text-sm text-gray-600">
                      <span>By: {submission.submittedBy}</span>
                      <span className="hidden sm:inline">•</span>
                      <span className="flex items-center gap-1">
                        <span className="text-yellow-500">⭐</span>
                        {submission.reputation}
                      </span>
                      <span className="hidden sm:inline">•</span>
                      <span>{submission.submittedDate}</span>
                    </div>
                  </div>
                </div>

                {/* Content */}
                <div className="p-4 md:p-6">
                  <h3 className="text-2xl md:text-3xl font-bold text-gray-900 mb-3">{submission.word}</h3>
                  
                  <div className="space-y-3 md:space-y-4">
                    <div>
                      <p className="text-xs font-bold text-gray-500 uppercase mb-1">Definition</p>
                      <p className="text-sm md:text-base text-gray-800">{submission.definition}</p>
                    </div>

                    <div className="grid md:grid-cols-2 gap-3">
                      <div>
                        <p className="text-xs font-bold text-gray-500 uppercase mb-1">English</p>
                        <p className="text-sm md:text-base text-gray-800">{submission.translations.english}</p>
                      </div>
                      <div>
                        <p className="text-xs font-bold text-gray-500 uppercase mb-1">Swahili</p>
                        <p className="text-sm md:text-base text-gray-800">{submission.translations.swahili}</p>
                      </div>
                    </div>

                    {submission.example && (
                      <div className="bg-gray-50 rounded-lg p-3 md:p-4 border-l-4 border-primary-500">
                        <p className="text-xs font-bold text-gray-500 uppercase mb-1">Example</p>
                        <p className="text-sm md:text-base text-gray-800 italic">&quot;{submission.example}&quot;</p>
                      </div>
                    )}
                  </div>
                </div>

                {/* Actions */}
                <div className="bg-gray-50 px-4 md:px-6 py-3 md:py-4 border-t border-gray-200">
                  {reviewingId === submission.id ? (
                    <div className="space-y-3">
                      <textarea
                        placeholder="Add notes or corrections (optional)..."
                        className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-primary-500"
                        rows={2}
                      />
                      <div className="grid grid-cols-2 md:flex md:flex-wrap gap-2">
                        <button
                          onClick={() => handleAction(submission.id, 'approve')}
                          className="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 transition font-medium text-sm"
                        >
                          ✓ Approve
                        </button>
                        <button
                          onClick={() => handleAction(submission.id, 'reject')}
                          className="bg-red-600 text-white px-4 py-2 rounded-lg hover:bg-red-700 transition font-medium text-sm"
                        >
                          ✗ Reject
                        </button>
                        <button
                          onClick={() => handleAction(submission.id, 'edit')}
                          className="border-2 border-gray-300 text-gray-700 px-4 py-2 rounded-lg hover:border-primary-500 hover:text-primary-600 transition font-medium text-sm"
                        >
                          ✎ Edit & Approve
                        </button>
                        <button
                          onClick={() => handleAction(submission.id, 'flag')}
                          className="border-2 border-gray-300 text-gray-700 px-4 py-2 rounded-lg hover:border-yellow-500 hover:text-yellow-600 transition font-medium text-sm"
                        >
                          🚩 Flag for Expert
                        </button>
                        <button
                          onClick={() => setReviewingId(null)}
                          className="col-span-2 md:col-span-1 text-gray-600 hover:text-gray-800 transition font-medium text-sm"
                        >
                          Cancel
                        </button>
                      </div>
                    </div>
                  ) : (
                    <button
                      onClick={() => setReviewingId(submission.id)}
                      className="w-full md:w-auto bg-primary-500 text-white px-6 py-2 rounded-lg hover:bg-primary-600 transition font-medium text-sm md:text-base"
                    >
                      Review
                    </button>
                  )}
                </div>
              </div>
            ))}

            {pendingSubmissions.length === 0 && (
              <div className="text-center py-12">
                <div className="text-6xl mb-4">🎉</div>
                <h3 className="text-xl font-bold text-gray-900 mb-2">All caught up!</h3>
                <p className="text-gray-600">No pending submissions to review</p>
              </div>
            )}
          </div>
        )}

        {/* Flagged Tab */}
        {selectedTab === 'flagged' && (
          <div className="space-y-4">
            {flaggedEntries.map((entry) => (
              <div key={entry.id} className="bg-white rounded-xl shadow-md border-2 border-red-200 p-4 md:p-6">
                <div className="flex items-start justify-between mb-4">
                  <div>
                    <h3 className="text-xl md:text-2xl font-bold text-gray-900">{entry.word}</h3>
                    <p className="text-sm text-gray-600">{entry.language}</p>
                  </div>
                  <span className="bg-red-100 text-red-700 px-3 py-1 rounded-full text-xs font-bold">
                    🚩 FLAGGED
                  </span>
                </div>
                <div className="bg-red-50 rounded-lg p-3 md:p-4 mb-4">
                  <p className="text-xs font-bold text-red-600 uppercase mb-1">Reason</p>
                  <p className="text-sm text-gray-800">{entry.reason}</p>
                  <p className="text-xs text-gray-600 mt-2">Flagged by {entry.flaggedBy} users • {entry.date}</p>
                </div>
                <div className="flex flex-wrap gap-2">
                  <Link href={`/entry/${entry.id}`}>
                    <button className="bg-primary-500 text-white px-4 py-2 rounded-lg hover:bg-primary-600 transition font-medium text-sm">
                      Review Entry
                    </button>
                  </Link>
                  <button className="border-2 border-gray-300 text-gray-700 px-4 py-2 rounded-lg hover:border-primary-500 transition font-medium text-sm">
                    Dismiss Flag
                  </button>
                </div>
              </div>
            ))}
          </div>
        )}

        {/* Recent Activity Tab */}
        {selectedTab === 'recent' && (
          <div className="bg-white rounded-xl shadow-md">
            <div className="divide-y divide-gray-200">
              {recentActions.map((action) => (
                <div key={action.id} className="px-4 md:px-6 py-4 hover:bg-gray-50 transition">
                  <div className="flex items-center justify-between">
                    <div className="flex items-center gap-3 flex-1 min-w-0">
                      <span className={`text-2xl flex-shrink-0 ${
                        action.action === 'approved' ? '' : 
                        action.action === 'rejected' ? '' : ''
                      }`}>
                        {action.action === 'approved' ? '✓' : action.action === 'rejected' ? '✗' : '✎'}
                      </span>
                      <div className="min-w-0 flex-1">
                        <p className="text-sm md:text-base text-gray-900 truncate">
                          <span className="font-medium capitalize">{action.action}</span>{' '}
                          <span className="font-bold">{action.word}</span>
                        </p>
                        <p className="text-xs md:text-sm text-gray-600">{action.language}</p>
                      </div>
                    </div>
                    <span className="text-xs md:text-sm text-gray-500 ml-2 flex-shrink-0">{action.when}</span>
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}
      </div>
    </div>
  )
}