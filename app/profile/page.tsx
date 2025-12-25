'use client'

import { useAuth } from '@/lib/contexts/AuthContext'
import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'
import Link from 'next/link'

export default function ProfilePage() {
  const { user, loading } = useAuth()
  const router = useRouter()
  const [mounted, setMounted] = useState(false)

  useEffect(() => {
    setMounted(true)
    if (!loading && !user) {
      router.push('/login')
    }
  }, [user, loading, router])

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

  // Mock data - will connect to real DB later
  const stats = {
    wordsAdded: 23,
    validated: 45,
    usageExamples: 12,
    reputation: 387,
    joinedDate: 'December 2024',
    streak: 5
  }

  const recentContributions = [
    { id: 1, word: 'gĩthaka', language: 'Kikuyu', status: 'verified', date: '2 days ago' },
    { id: 2, word: 'harambee', language: 'Swahili', status: 'pending', date: '3 days ago' },
    { id: 3, word: 'nyathi', language: 'Dholuo', status: 'verified', date: '5 days ago' },
  ]

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-gradient-to-br from-primary-700 to-primary-500 text-white py-12 md:py-16">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex flex-col md:flex-row items-center md:items-start gap-6">
            {/* Avatar */}
            <div className="w-24 h-24 md:w-32 md:h-32 rounded-full bg-white/20 flex items-center justify-center text-4xl md:text-5xl font-bold border-4 border-white shadow-lg">
              {user.email?.[0].toUpperCase() || 'U'}
            </div>
            
            {/* Info */}
            <div className="flex-1 text-center md:text-left">
              <h1 className="text-2xl md:text-4xl font-bold mb-2">
                {user.email?.split('@')[0] || 'User'}
              </h1>
              <p className="text-green-100 mb-4 text-sm md:text-base">{user.email}</p>
              <div className="flex flex-wrap gap-2 justify-center md:justify-start">
                <span className="bg-white/20 backdrop-blur-sm px-3 py-1 rounded-full text-xs md:text-sm font-medium">
                  ⭐ Contributor
                </span>
                <span className="bg-white/20 backdrop-blur-sm px-3 py-1 rounded-full text-xs md:text-sm font-medium">
                  🔥 {stats.streak} day streak
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Stats Grid */}
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 -mt-8">
        <div className="grid grid-cols-2 md:grid-cols-4 gap-3 md:gap-4">
          <div className="bg-white rounded-xl shadow-lg p-4 md:p-6 text-center">
            <div className="text-2xl md:text-4xl font-bold text-primary-600">{stats.wordsAdded}</div>
            <div className="text-xs md:text-sm text-gray-600 mt-1">Words Added</div>
          </div>
          <div className="bg-white rounded-xl shadow-lg p-4 md:p-6 text-center">
            <div className="text-2xl md:text-4xl font-bold text-primary-600">{stats.validated}</div>
            <div className="text-xs md:text-sm text-gray-600 mt-1">Validated</div>
          </div>
          <div className="bg-white rounded-xl shadow-lg p-4 md:p-6 text-center">
            <div className="text-2xl md:text-4xl font-bold text-primary-600">{stats.usageExamples}</div>
            <div className="text-xs md:text-sm text-gray-600 mt-1">Examples</div>
          </div>
          <div className="bg-white rounded-xl shadow-lg p-4 md:p-6 text-center">
            <div className="text-2xl md:text-4xl font-bold text-primary-600">{stats.reputation}</div>
            <div className="text-xs md:text-sm text-gray-600 mt-1">Reputation</div>
          </div>
        </div>
      </div>

      {/* Main Content */}
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-8 md:py-12">
        {/* Recent Contributions */}
        <div className="bg-white rounded-2xl shadow-lg p-4 md:p-8 mb-6">
          <div className="flex items-center justify-between mb-6">
            <h2 className="text-xl md:text-2xl font-bold text-gray-900">Recent Contributions</h2>
            <Link href="/contribute">
              <button className="text-primary-600 hover:text-primary-700 font-medium text-sm">
                + Add More
              </button>
            </Link>
          </div>
          
          <div className="space-y-3 md:space-y-4">
            {recentContributions.map((contrib) => (
              <div key={contrib.id} className="border border-gray-200 rounded-lg p-4 hover:border-primary-300 transition">
                <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">
                  <div className="flex-1">
                    <h3 className="text-base md:text-lg font-bold text-gray-900">{contrib.word}</h3>
                    <p className="text-xs md:text-sm text-gray-600">{contrib.language}</p>
                  </div>
                  <div className="flex items-center gap-3">
                    <span className={`px-3 py-1 rounded-full text-xs font-bold ${
                      contrib.status === 'verified' 
                        ? 'bg-green-100 text-green-700' 
                        : 'bg-yellow-100 text-yellow-700'
                    }`}>
                      {contrib.status === 'verified' ? '✓ Verified' : '⏳ Pending'}
                    </span>
                    <span className="text-xs md:text-sm text-gray-500">{contrib.date}</span>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* My Languages */}
        <div className="bg-white rounded-2xl shadow-lg p-4 md:p-8 mb-6">
          <h2 className="text-xl md:text-2xl font-bold text-gray-900 mb-4">My Languages</h2>
          <div className="flex flex-wrap gap-3">
            <div className="bg-green-50 text-green-800 px-4 py-2 rounded-full font-medium flex items-center gap-2 border-2 border-green-200 text-sm">
              <span className="w-2 h-2 bg-green-600 rounded-full"></span>
              English
            </div>
            <div className="bg-green-50 text-green-800 px-4 py-2 rounded-full font-medium flex items-center gap-2 border-2 border-green-200 text-sm">
              <span className="w-2 h-2 bg-green-600 rounded-full"></span>
              Swahili
            </div>
            <div className="bg-green-50 text-green-800 px-4 py-2 rounded-full font-medium flex items-center gap-2 border-2 border-green-200 text-sm">
              <span className="w-2 h-2 bg-green-600 rounded-full"></span>
              Kikuyu
            </div>
            <button className="border-2 border-dashed border-gray-300 text-gray-600 px-4 py-2 rounded-full font-medium hover:border-green-600 hover:text-green-700 hover:bg-green-50 transition text-sm">
              + Add Language
            </button>
          </div>
        </div>

        {/* Account Settings */}
        <div className="bg-white rounded-2xl shadow-lg p-4 md:p-8">
          <h2 className="text-xl md:text-2xl font-bold text-gray-900 mb-4">Account Settings</h2>
          <div className="space-y-3">
            <button className="w-full text-left px-4 py-3 border border-gray-200 rounded-lg hover:border-primary-500 hover:bg-primary-50 transition text-sm md:text-base">
              <div className="font-medium text-gray-900">Edit Profile</div>
              <div className="text-xs md:text-sm text-gray-600">Update your display name and preferences</div>
            </button>
            <button className="w-full text-left px-4 py-3 border border-gray-200 rounded-lg hover:border-primary-500 hover:bg-primary-50 transition text-sm md:text-base">
              <div className="font-medium text-gray-900">Language Preferences</div>
              <div className="text-xs md:text-sm text-gray-600">Choose which languages you speak</div>
            </button>
            <button className="w-full text-left px-4 py-3 border border-gray-200 rounded-lg hover:border-red-500 hover:bg-red-50 transition text-sm md:text-base">
              <div className="font-medium text-red-600">Export My Data</div>
              <div className="text-xs md:text-sm text-gray-600">Download all your contributions</div>
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}