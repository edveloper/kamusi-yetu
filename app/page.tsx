'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import Link from 'next/link'

export default function Home() {
  const router = useRouter()
  const [searchQuery, setSearchQuery] = useState('')

  const handleSearch = (e: React.FormEvent) => {
    e.preventDefault()
    if (searchQuery.trim()) {
      router.push(`/search?q=${encodeURIComponent(searchQuery)}`)
    }
  }

  return (
    <div className="min-h-screen">
      {/* Hero Section */}
      <section className="bg-gradient-to-br from-primary-700 to-primary-500 text-white py-24">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <div className="mb-6">
            <span className="text-6xl">🇰🇪</span>
          </div>
          <h1 className="text-4xl md:text-6xl font-bold mb-6 leading-tight font-logo">
            Every Kenyan Language,
            <br />
            <span className="text-primary-100">Equal and Alive</span>
          </h1>
          <p className="text-xl md:text-2xl mb-10 text-green-50 max-w-3xl mx-auto">
            A collaborative dictionary built by Kenyans, for Kenyans
          </p>

          {/* Search Bar - Now functional */}
          <form onSubmit={handleSearch} className="max-w-2xl mx-auto mb-8">
            <div className="bg-white rounded-2xl shadow-2xl p-3">
              <input
                type="text"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                placeholder="Search in any language..."
                className="w-full px-6 py-4 text-gray-900 text-lg focus:outline-none rounded-xl"
              />
            </div>
            <p className="text-green-100 text-sm mt-3">
              💡 Try searching: mtoto, child, kaana, nyathi...
            </p>
          </form>

          {/* Quick Stats - Fixed for mobile */}
          <div className="mt-16 grid grid-cols-2 md:grid-cols-4 gap-3 md:gap-4 max-w-4xl mx-auto">
            <div className="bg-white/10 backdrop-blur-sm rounded-xl p-4 md:p-6 border border-white/20">
              <div className="text-2xl md:text-4xl font-bold leading-tight">25,000+</div>
              <div className="text-green-100 text-xs md:text-sm mt-1">Words</div>
            </div>
            <div className="bg-white/10 backdrop-blur-sm rounded-xl p-4 md:p-6 border border-white/20">
              <div className="text-2xl md:text-4xl font-bold leading-tight">7</div>
              <div className="text-green-100 text-xs md:text-sm mt-1">Languages</div>
            </div>
            <div className="bg-white/10 backdrop-blur-sm rounded-xl p-4 md:p-6 border border-white/20">
              <div className="text-2xl md:text-4xl font-bold leading-tight">2,340</div>
              <div className="text-green-100 text-xs md:text-sm mt-1">Contributors</div>
            </div>
            <div className="bg-white/10 backdrop-blur-sm rounded-xl p-4 md:p-6 border border-white/20">
              <div className="text-2xl md:text-4xl font-bold leading-tight">🚀</div>
              <div className="text-green-100 text-xs md:text-sm mt-1">Growing Daily</div>
            </div>
          </div>
        </div>
      </section>

      {/* My Languages Section */}
      <section className="py-16 bg-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between mb-8">
            <h2 className="text-3xl font-bold text-gray-900">
              My Languages
            </h2>
            <button className="text-green-700 hover:text-green-800 font-medium text-sm px-4 py-2 rounded-lg hover:bg-green-50 transition">
              ✏️ Edit
            </button>
          </div>

          <div className="flex flex-wrap gap-3">
            <div className="bg-green-50 text-green-800 px-5 py-3 rounded-full font-medium flex items-center gap-2 border-2 border-green-200">
              <span className="w-3 h-3 bg-green-600 rounded-full animate-pulse"></span>
              English
            </div>
            <div className="bg-green-50 text-green-800 px-5 py-3 rounded-full font-medium flex items-center gap-2 border-2 border-green-200">
              <span className="w-3 h-3 bg-green-600 rounded-full animate-pulse"></span>
              Swahili
            </div>
            <div className="bg-green-50 text-green-800 px-5 py-3 rounded-full font-medium flex items-center gap-2 border-2 border-green-200">
              <span className="w-3 h-3 bg-green-600 rounded-full animate-pulse"></span>
              Kikuyu
            </div>
            <button className="border-2 border-dashed border-gray-300 text-gray-600 px-5 py-3 rounded-full font-medium hover:border-green-600 hover:text-green-700 hover:bg-green-50 transition">
              + Add Language
            </button>
          </div>
        </div>
      </section>

      {/* Trending Section */}
      <section className="py-16 bg-gray-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-8 flex items-center gap-3">
            <span className="text-4xl">🔥</span>
            Trending Now
          </h2>

          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            {/* Trending Card 1 */}
            <Link href="/entry/1">
              <div className="bg-white rounded-xl shadow-md hover:shadow-xl transition p-6 border border-gray-100 cursor-pointer group">
                <div className="flex items-start justify-between mb-4">
                  <div>
                    <h3 className="text-2xl font-bold text-gray-900 group-hover:text-green-700 transition">
                      &quot;ruto&quot;
                    </h3>
                    <p className="text-sm text-gray-500 mt-1">Sheng • verb</p>
                  </div>
                  <span className="bg-red-100 text-red-700 px-3 py-1 rounded-full text-sm font-bold">
                    342 🔥
                  </span>
                </div>
                <p className="text-gray-700 leading-relaxed">
                  To promise something and not deliver. Modern political slang gaining popularity...
                </p>
              </div>
            </Link>

            {/* Trending Card 2 */}
            <Link href="/entry/2">
              <div className="bg-white rounded-xl shadow-md hover:shadow-xl transition p-6 border border-gray-100 cursor-pointer group">
                <div className="flex items-start justify-between mb-4">
                  <div>
                    <h3 className="text-2xl font-bold text-gray-900 group-hover:text-green-700 transition">
                      &quot;chakula&quot;
                    </h3>
                    <p className="text-sm text-gray-500 mt-1">Swahili • noun</p>
                  </div>
                  <span className="bg-red-100 text-red-700 px-3 py-1 rounded-full text-sm font-bold">
                    156 🔥
                  </span>
                </div>
                <p className="text-gray-700 leading-relaxed">
                  Food. See how this word translates across all 7 Kenyan languages...
                </p>
              </div>
            </Link>

            {/* Trending Card 3 */}
            <Link href="/entry/3">
              <div className="bg-white rounded-xl shadow-md hover:shadow-xl transition p-6 border border-gray-100 cursor-pointer group">
                <div className="flex items-start justify-between mb-4">
                  <div>
                    <h3 className="text-2xl font-bold text-gray-900 group-hover:text-green-700 transition">
                      &quot;harambee&quot;
                    </h3>
                    <p className="text-sm text-gray-500 mt-1">Swahili • noun</p>
                  </div>
                  <span className="bg-red-100 text-red-700 px-3 py-1 rounded-full text-sm font-bold">
                    134 🔥
                  </span>
                </div>
                <p className="text-gray-700 leading-relaxed">
                  All pull together. Kenya&apos;s national motto and spirit of community...
                </p>
              </div>
            </Link>
          </div>

          <div className="mt-8 text-center">
            <Link href="/search">
              <button className="text-green-700 hover:text-green-800 font-semibold text-lg hover:underline">
                View all trending words →
              </button>
            </Link>
          </div>
        </div>
      </section>

      {/* Word of the Day */}
      <section className="py-16 bg-white">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="bg-gradient-to-r from-primary-700 to-primary-500 rounded-2xl shadow-2xl p-8 md:p-12 text-white">
            <div className="flex items-center gap-3 mb-6">
              <span className="text-4xl">💡</span>
              <h2 className="text-2xl font-bold">Word of the Day</h2>
            </div>

            <div className="space-y-4">
              <div>
                <h3 className="text-4xl font-bold mb-2">nyumbani</h3>
                <p className="text-green-100">Swahili • noun</p>
              </div>

              <p className="text-xl text-green-50 leading-relaxed">
                At home, homeward. From <span className="font-semibold">nyumba</span> (house) + <span className="font-semibold">-ni</span> (locative suffix).
              </p>

              <div className="bg-white/10 backdrop-blur-sm rounded-xl p-4 border border-white/20">
                <p className="text-green-50 italic">
                  &quot;Naenda nyumbani&quot; - I&apos;m going home
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20 bg-gradient-to-br from-accent-500 to-accent-700">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h2 className="text-4xl md:text-5xl font-bold text-white mb-6">
            Help Preserve Our Languages
          </h2>
          <p className="text-xl text-red-50 mb-10 leading-relaxed max-w-2xl mx-auto">
            Add words from your mother tongue and help keep it alive for future generations. Every contribution matters.
          </p>
          <button className="bg-white text-red-700 px-10 py-4 rounded-xl hover:bg-gray-50 transition font-bold text-lg shadow-xl">
            + Contribute a Word
          </button>
        </div>
      </section>
    </div>
  )
}