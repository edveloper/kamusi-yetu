'use client'

import { useAuth } from '@/lib/contexts/AuthContext'
import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'
import { getEntries, updateEntryStatus } from '@/lib/api/entries'
import { getLanguages } from '@/lib/api/languages'
import { isModerator, getModeratorStats } from '@/lib/api/users'
import Link from 'next/link'

export default function ModeratePage() {
  const { user, loading } = useAuth()
  const router = useRouter()
  const [mounted, setMounted] = useState(false)
  const [selectedTab, setSelectedTab] = useState<'pending' | 'flagged'>('pending')
  const [languages, setLanguages] = useState<any[]>([])
  const [selectedLanguage, setSelectedLanguage] = useState('all')
  
  const [pendingSubmissions, setPendingSubmissions] = useState<any[]>([])
  const [flaggedEntries, setFlaggedEntries] = useState<any[]>([])
  const [modStats, setModStats] = useState({ thisWeek: 0, score: 0 })
  const [loadingData, setLoadingData] = useState(true)
  const [reviewingId, setReviewingId] = useState<string | null>(null)
  const [actionNote, setActionNote] = useState('')
  const [processing, setProcessing] = useState(false)
  const [isUserModerator, setIsUserModerator] = useState(false)

  useEffect(() => {
    setMounted(true)
  }, [])

  useEffect(() => {
    async function checkAccess() {
      if (loading || !user) return
      
      const modStatus = await isModerator(user.id)
      setIsUserModerator(modStatus)
      
      if (!modStatus) {
        router.push('/profile')
      }
    }
    
    if (!loading) {
      checkAccess()
    }
  }, [user, loading, router])

  useEffect(() => {
    async function loadData() {
      if (!user) return
      
      try {
        const langs = await getLanguages()
        setLanguages(langs)

        const pending = await getEntries({ validation_status: 'pending' })
        setPendingSubmissions(pending || [])

        const flagged = await getEntries({ validation_status: 'flagged' })
        setFlaggedEntries(flagged || [])
        
        const stats = await getModeratorStats(user.id)
        setModStats(stats)
      } catch (err) {
        console.error('Failed to load moderation data:', err)
      } finally {
        setLoadingData(false)
      }
    }

    if (user && isUserModerator) {
      loadData()
    }
  }, [user, isUserModerator])

  const handleAction = async (entryId: string, action: 'approve' | 'reject' | 'flag') => {
    if (!user) return

    setProcessing(true)
    try {
      let newStatus: 'verified' | 'flagged' | 'disputed' = 'disputed'
      
      if (action === 'approve') {
        newStatus = 'verified'
      } else if (action === 'flag') {
        newStatus = 'flagged'
      } else {
        newStatus = 'disputed'
      }

      await updateEntryStatus(entryId, newStatus, user.id)

      // Refresh the lists
      const pending = await getEntries({ validation_status: 'pending' })
      setPendingSubmissions(pending || [])

      const flagged = await getEntries({ validation_status: 'flagged' })
      setFlaggedEntries(flagged || [])
      
      // Refresh moderator stats
      const stats = await getModeratorStats(user.id)
      setModStats(stats)

      setReviewingId(null)
      setActionNote('')
      
      // Simple success feedback
      const actionText = action === 'approve' ? 'approved' : action === 'flag' ? 'flagged' : 'rejected'
      alert(`Entry ${actionText} successfully!`)
    } catch (err) {
      console.error('Action failed:', err)
      alert('Failed to process action. Please try again.')
    } finally {
      setProcessing(false)
    }
  }

  if (!mounted || loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-500 mx-auto mb-4"></div>
          <p className="text-gray-600">Loading...</p>
        </div>
      </div>
    )
  }

  if (!isUserModerator) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <div className="text-6xl mb-4">🚫</div>
          <h2 className="text-2xl font-bold text-gray-900 mb-2">Access Denied</h2>
          <p className="text-gray-600 mb-4">You need moderator privileges to access this page.</p>
          <Link href="/profile">
            <button className="bg-primary-500 text-white px-6 py-3 rounded-lg hover:bg-primary-600 transition">
              Back to Profile
            </button>
          </Link>
        </div>
      </div>
    )
  }

  const displayedSubmissions = selectedLanguage === 'all' 
    ? pendingSubmissions 
    : pendingSubmissions.filter(s => s.language_id === selectedLanguage)

  const displayedFlagged = selectedLanguage === 'all'
    ? flaggedEntries
    : flaggedEntries.filter(e => e.language_id === selectedLanguage)

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
              <select 
                value={selectedLanguage}
                onChange={(e) => setSelectedLanguage(e.target.value)}
                className="px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-primary-500"
              >
                <option value="all">All Languages</option>
                {languages.map(lang => (
                  <option key={lang.id} value={lang.id}>{lang.name}</option>
                ))}
              </select>
            </div>
          </div>

          {/* Stats */}
          <div className="grid grid-cols-2 md:grid-cols-4 gap-3 md:gap-4 mt-6">
            <div className="bg-yellow-50 border-2 border-yellow-200 rounded-xl p-3 md:p-4">
              <div className="text-2xl md:text-3xl font-bold text-yellow-700">
                {loadingData ? '...' : pendingSubmissions.length}
              </div>
              <div className="text-xs md:text-sm text-yellow-600 mt-1">Pending Review</div>
            </div>
            <div className="bg-red-50 border-2 border-red-200 rounded-xl p-3 md:p-4">
              <div className="text-2xl md:text-3xl font-bold text-red-700">
                {loadingData ? '...' : flaggedEntries.length}
              </div>
              <div className="text-xs md:text-sm text-red-600 mt-1">Flagged</div>
            </div>
            <div className="bg-green-50 border-2 border-green-200 rounded-xl p-3 md:p-4">
              <div className="text-2xl md:text-3xl font-bold text-green-700">
                {loadingData ? '...' : modStats.thisWeek}
              </div>
              <div className="text-xs md:text-sm text-green-600 mt-1">This Week</div>
            </div>
            <div className="bg-blue-50 border-2 border-blue-200 rounded-xl p-3 md:p-4">
              <div className="text-2xl md:text-3xl font-bold text-blue-700">
                {loadingData ? '...' : modStats.score}
              </div>
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
              🔔 Pending ({displayedSubmissions.length})
            </button>
            <button
              onClick={() => setSelectedTab('flagged')}
              className={`px-4 md:px-6 py-3 md:py-4 font-medium text-sm md:text-base whitespace-nowrap transition ${
                selectedTab === 'flagged'
                  ? 'text-primary-600 border-b-2 border-primary-600'
                  : 'text-gray-600 hover:text-gray-900'
              }`}
            >
              🚨 Flagged ({displayedFlagged.length})
            </button>
          </div>
        </div>
      </div>

      {/* Content */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6 md:py-8">
        {loadingData ? (
          <div className="text-center py-12">
            <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-500 mx-auto mb-4"></div>
            <p className="text-gray-600">Loading submissions...</p>
          </div>
        ) : selectedTab === 'pending' ? (
          <div className="space-y-4 md:space-y-6">
            {displayedSubmissions.map((submission) => (
              <div key={submission.id} className="bg-white rounded-xl shadow-md border border-gray-200 overflow-hidden">
                {/* Header */}
                <div className="bg-gray-50 px-4 md:px-6 py-3 md:py-4 border-b border-gray-200">
                  <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-2">
                    <div className="flex items-center gap-3">
                      <span className="bg-yellow-100 text-yellow-700 px-2 py-1 rounded text-xs font-bold">
                        NEW
                      </span>
                      <span className="text-xs md:text-sm text-gray-600">{submission.language?.name || 'Unknown'}</span>
                    </div>
                    <div className="flex items-center gap-2 text-xs md:text-sm text-gray-600">
                      <span>{new Date(submission.created_at).toLocaleDateString()}</span>
                    </div>
                  </div>
                </div>

                {/* Content */}
                <div className="p-4 md:p-6">
                  <h3 className="text-2xl md:text-3xl font-bold text-gray-900 mb-3">{submission.headword}</h3>
                  
                  <div className="space-y-3 md:space-y-4">
                    <div>
                      <p className="text-xs font-bold text-gray-500 uppercase mb-1">Definition</p>
                      <p className="text-sm md:text-base text-gray-800">{submission.primary_definition}</p>
                    </div>

                    {submission.part_of_speech && (
                      <div>
                        <p className="text-xs font-bold text-gray-500 uppercase mb-1">Part of Speech</p>
                        <p className="text-sm md:text-base text-gray-800">{submission.part_of_speech}</p>
                      </div>
                    )}

                    {submission.dialect_variant && (
                      <div>
                        <p className="text-xs font-bold text-gray-500 uppercase mb-1">Dialect</p>
                        <p className="text-sm md:text-base text-gray-800">{submission.dialect_variant}</p>
                      </div>
                    )}
                  </div>
                </div>

                {/* Actions */}
                <div className="bg-gray-50 px-4 md:px-6 py-3 md:py-4 border-t border-gray-200">
                  {reviewingId === submission.id ? (
                    <div className="space-y-3">
                      <textarea
                        value={actionNote}
                        onChange={(e) => setActionNote(e.target.value)}
                        placeholder="Add notes or corrections (optional)..."
                        className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-primary-500"
                        rows={2}
                      />
                      <div className="grid grid-cols-2 md:flex md:flex-wrap gap-2">
                        <button
                          onClick={() => handleAction(submission.id, 'approve')}
                          disabled={processing}
                          className="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 transition font-medium text-sm disabled:opacity-50"
                        >
                          {processing ? '...' : '✓ Approve'}
                        </button>
                        <button
                          onClick={() => handleAction(submission.id, 'reject')}
                          disabled={processing}
                          className="bg-red-600 text-white px-4 py-2 rounded-lg hover:bg-red-700 transition font-medium text-sm disabled:opacity-50"
                        >
                          {processing ? '...' : '✗ Reject'}
                        </button>
                        <button
                          onClick={() => handleAction(submission.id, 'flag')}
                          disabled={processing}
                          className="border-2 border-gray-300 text-gray-700 px-4 py-2 rounded-lg hover:border-yellow-500 hover:text-yellow-600 transition font-medium text-sm"
                        >
                          🚩 Flag
                        </button>
                        <button
                          onClick={() => {
                            setReviewingId(null)
                            setActionNote('')
                          }}
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

            {displayedSubmissions.length === 0 && (
              <div className="text-center py-12">
                <div className="text-6xl mb-4">🎉</div>
                <h3 className="text-xl font-bold text-gray-900 mb-2">All caught up!</h3>
                <p className="text-gray-600">No pending submissions to review</p>
              </div>
            )}
          </div>
        ) : (
          <div className="space-y-4">
            {displayedFlagged.map((entry) => (
              <div key={entry.id} className="bg-white rounded-xl shadow-md border-2 border-red-200 p-4 md:p-6">
                <div className="flex items-start justify-between mb-4">
                  <div>
                    <h3 className="text-xl md:text-2xl font-bold text-gray-900">{entry.headword}</h3>
                    <p className="text-sm text-gray-600">{entry.language?.name || 'Unknown'}</p>
                  </div>
                  <span className="bg-red-100 text-red-700 px-3 py-1 rounded-full text-xs font-bold">
                    🚩 FLAGGED
                  </span>
                </div>
                <div className="flex flex-wrap gap-2">
                  <Link href={`/entry/${entry.id}`}>
                    <button className="bg-primary-500 text-white px-4 py-2 rounded-lg hover:bg-primary-600 transition font-medium text-sm">
                      Review Entry
                    </button>
                  </Link>
                  <button 
                    onClick={() => handleAction(entry.id, 'approve')}
                    disabled={processing}
                    className="border-2 border-gray-300 text-gray-700 px-4 py-2 rounded-lg hover:border-primary-500 transition font-medium text-sm disabled:opacity-50"
                  >
                    Approve Anyway
                  </button>
                </div>
              </div>
            ))}
            
            {displayedFlagged.length === 0 && (
              <div className="text-center py-12">
                <div className="text-6xl mb-4">✨</div>
                <h3 className="text-xl font-bold text-gray-900 mb-2">No flagged entries</h3>
                <p className="text-gray-600">Everything looks good!</p>
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  )
}