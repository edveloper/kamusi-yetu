'use client'

import Link from 'next/link'

export default function CategoriesPage() {
  const categories = [
    { id: 'family', name: 'Family & Relationships', icon: '👨‍👩‍👧‍👦', description: 'Kinship, marriage, and community bonds' },
    { id: 'food', name: 'Food & Cooking', icon: '🍲', description: 'Traditional meals, crops, and preparation' },
    { id: 'home', name: 'Home & Daily Life', icon: '🏠', description: 'Household items and daily routines' },
    { id: 'nature', name: 'Nature & Agriculture', icon: '🌾', description: 'Wildlife, farming, and the environment' },
    { id: 'culture', name: 'Culture & Traditions', icon: '🏛️', description: 'Ceremonies, music, and heritage' },
    { id: 'business', name: 'Work & Business', icon: '💼', description: 'Trade, markets, and professional life' },
    { id: 'tech', name: 'Technology', icon: '📱', description: 'Modern tools and digital life' },
    { id: 'health', name: 'Health & Body', icon: '🏥', description: 'Medicine, body parts, and wellbeing' },
    { id: 'education', name: 'Education', icon: '🎓', description: 'Schooling, wisdom, and learning' },
    { id: 'law', name: 'Law & Governance', icon: '⚖️', description: 'Leadership, justice, and community rules' },
  ]

  return (
    <div className="min-h-screen bg-stone-50 pb-24">
      {/* Hero Section */}
      <div className="bg-emerald-900 text-white py-24 border-b border-emerald-800 relative overflow-hidden">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center relative z-10">
          <h1 className="text-5xl md:text-7xl font-black mb-6 font-logo tracking-tight">
            Browse Topics
          </h1>
          <p className="text-xl text-emerald-100 max-w-2xl mx-auto font-medium opacity-90 leading-relaxed">
            Explore our languages through the lens of daily life, 
            tradition, and modern discovery.
          </p>
        </div>
        {/* Subtle Background Pattern */}
        <div className="absolute inset-0 opacity-5 pointer-events-none">
          <div className="grid grid-cols-8 gap-4 rotate-12 scale-150">
            {categories.map((c) => (
              <span key={c.id} className="text-6xl">{c.icon}</span>
            ))}
          </div>
        </div>
      </div>

      {/* Categories Grid */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-10 relative z-20">
        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          {categories.map((cat) => (
            <Link key={cat.id} href={`/search?category=${cat.id}`} className="group">
              <div className="bg-white rounded-[2.5rem] p-10 border border-stone-200 shadow-sm hover:shadow-2xl hover:border-emerald-500 hover:-translate-y-2 transition-all duration-500 h-full flex flex-col">
                <div className="w-20 h-20 bg-stone-50 rounded-3xl flex items-center justify-center text-5xl mb-8 group-hover:bg-emerald-50 group-hover:scale-110 transition-all duration-500">
                  {cat.icon}
                </div>
                
                <h3 className="text-3xl font-black text-gray-900 mb-4 font-logo group-hover:text-emerald-600 transition-colors">
                  {cat.name}
                </h3>
                
                <p className="text-lg text-stone-500 leading-relaxed font-medium mb-8 flex-grow">
                  {cat.description}
                </p>
                
                <div className="mt-auto pt-8 border-t border-stone-100 flex items-center justify-between text-emerald-600 font-black text-sm uppercase tracking-widest">
                  <span>Explore Corpus</span>
                  <span className="text-2xl group-hover:translate-x-3 transition-transform duration-300">→</span>
                </div>
              </div>
            </Link>
          ))}
        </div>
      </div>

      {/* Community Contribution Box */}
      <div className="max-w-4xl mx-auto px-4 mt-24">
        <div className="bg-stone-200/50 rounded-[2rem] p-12 border-2 border-dashed border-stone-300 text-center">
          <h3 className="text-2xl font-black text-stone-700 font-logo mb-4">Suggest a New Topic</h3>
          <p className="text-stone-500 font-medium mb-8">
            Is there a specific area of life we haven't categorized yet? <br/>
            Help us expand the taxonomy of our heritage.
          </p>
          <button className="bg-stone-800 text-white px-8 py-4 rounded-2xl font-black hover:bg-stone-900 transition-all shadow-lg">
            Suggest Category
          </button>
        </div>
      </div>
    </div>
  )
}