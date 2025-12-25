import Link from 'next/link'
import { mockLanguages } from '@/lib/mockData'

export default function ExplorePage() {
  const categories = [
    { id: 'family', name: 'Family & Relationships', icon: '👨‍👩‍👧‍👦', count: 1250 },
    { id: 'food', name: 'Food & Cooking', icon: '🍲', count: 2340 },
    { id: 'home', name: 'Home & Daily Life', icon: '🏠', count: 1890 },
    { id: 'nature', name: 'Agriculture & Nature', icon: '🌾', count: 1560 },
    { id: 'culture', name: 'Culture & Traditions', icon: '🏛️', count: 980 },
    { id: 'business', name: 'Work & Business', icon: '💼', count: 1120 },
    { id: 'tech', name: 'Technology & Modern Life', icon: '📱', count: 890 },
    { id: 'health', name: 'Health & Body', icon: '🏥', count: 1450 },
    { id: 'education', name: 'Education', icon: '🎓', count: 1670 },
    { id: 'law', name: 'Law & Governance', icon: '⚖️', count: 650 },
  ]

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-gradient-to-br from-primary-700 to-primary-500 text-white py-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h1 className="text-4xl md:text-5xl font-bold mb-4 font-logo">
            Explore Languages
          </h1>
          <p className="text-xl text-green-50 max-w-2xl mx-auto">
            Browse by language or discover words by category
          </p>
        </div>
      </div>

      {/* Browse by Language */}
      <section className="py-16 bg-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-8">Browse by Language</h2>
          
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            {mockLanguages.map((lang) => (
              <Link href={`/language/${lang.code}`} key={lang.id}>
                <div className="bg-gradient-to-br from-green-50 to-green-100 rounded-2xl p-8 border-2 border-green-200 hover:border-green-400 hover:shadow-lg transition cursor-pointer group">
                  <div className="flex items-start justify-between mb-4">
                    <div>
                      <h3 className="text-2xl font-bold text-gray-900 group-hover:text-primary-700 transition">
                        {lang.name}
                      </h3>
                      <p className="text-gray-600 mt-1">{lang.native_name}</p>
                    </div>
                    <span className="text-3xl">🇰🇪</span>
                  </div>
                  <div className="flex items-center justify-between mt-6">
                    <div>
                      <p className="text-3xl font-bold text-primary-700">
                        {Math.floor(Math.random() * 5000) + 500}
                      </p>
                      <p className="text-sm text-gray-600">words</p>
                    </div>
                    <div className="text-primary-600 group-hover:text-primary-700 text-2xl transition">
                      →
                    </div>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      {/* Browse by Category */}
      <section className="py-16 bg-gray-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-8">Browse by Category</h2>
          
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            {categories.map((category) => (
              <Link href={`/category/${category.id}`} key={category.id}>
                <div className="bg-white rounded-xl shadow-md hover:shadow-xl transition p-6 border border-gray-100 cursor-pointer group">
                  <div className="flex items-center gap-4 mb-4">
                    <span className="text-4xl">{category.icon}</span>
                    <div className="flex-1">
                      <h3 className="text-lg font-bold text-gray-900 group-hover:text-primary-700 transition">
                        {category.name}
                      </h3>
                      <p className="text-sm text-gray-600">{category.count} words</p>
                    </div>
                  </div>
                  <div className="flex items-center justify-between text-sm">
                    <span className="text-gray-500">Explore category</span>
                    <span className="text-primary-600 group-hover:text-primary-700 transition">→</span>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="py-16 bg-white">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h2 className="text-3xl font-bold text-gray-900 mb-4">
            Can&apos;t find what you&apos;re looking for?
          </h2>
          <p className="text-xl text-gray-600 mb-8">
            Help us grow by adding new words from your language
          </p>
          <Link href="/contribute">
            <button className="bg-primary-500 text-white px-8 py-4 rounded-xl hover:bg-primary-600 transition font-bold text-lg shadow-lg">
              + Contribute a Word
            </button>
          </Link>
        </div>
      </section>
    </div>
  )
}