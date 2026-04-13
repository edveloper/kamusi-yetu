'use client'

import Link from 'next/link'
import { CATEGORIES } from '@/lib/constants'

export default function CategoriesPage() {
  return (
    <div className="min-h-screen bg-stone-50 pb-24">
      <div className="bg-emerald-900 text-white py-24 border-b border-emerald-800 relative overflow-hidden">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center relative z-10">
          <h1 className="text-5xl md:text-7xl font-black mb-6 font-logo tracking-tight">
            Browse Topics
          </h1>
          <p className="text-xl text-emerald-100 max-w-2xl mx-auto font-medium opacity-90 leading-relaxed">
            Explore the dictionary through practical domains such as greetings,
            family, health, culture, and everyday life.
          </p>
        </div>
        <div className="absolute inset-0 opacity-5 pointer-events-none">
          <div className="grid grid-cols-8 gap-4 rotate-12 scale-150">
            {CATEGORIES.map((category) => (
              <span key={category.id} className="text-3xl font-black uppercase tracking-widest">
                {category.icon}
              </span>
            ))}
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-10 relative z-20">
        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          {CATEGORIES.map((category) => (
            <Link key={category.id} href={`/search?category=${category.id}`} className="group">
              <div className="bg-white rounded-[2.5rem] p-10 border border-stone-200 shadow-sm hover:shadow-2xl hover:border-emerald-500 hover:-translate-y-2 transition-all duration-500 h-full flex flex-col">
                <div className="w-20 h-20 bg-stone-50 rounded-3xl flex items-center justify-center text-sm font-black uppercase tracking-widest mb-8 group-hover:bg-emerald-50 group-hover:scale-110 transition-all duration-500">
                  {category.icon}
                </div>

                <h3 className="text-3xl font-black text-gray-900 mb-4 font-logo group-hover:text-emerald-600 transition-colors">
                  {category.name}
                </h3>

                <p className="text-lg text-stone-500 leading-relaxed font-medium mb-8 flex-grow">
                  {category.description}
                </p>

                <div className="mt-auto pt-8 border-t border-stone-100 flex items-center justify-between text-emerald-600 font-black text-sm uppercase tracking-widest">
                  <span>Explore Corpus</span>
                  <span className="text-2xl group-hover:translate-x-3 transition-transform duration-300">{'->'}</span>
                </div>
              </div>
            </Link>
          ))}
        </div>
      </div>

      <div className="max-w-4xl mx-auto px-4 mt-24">
        <div className="bg-stone-200/50 rounded-[2rem] p-12 border-2 border-dashed border-stone-300 text-center">
          <h3 className="text-2xl font-black text-stone-700 font-logo mb-4">Suggest a New Topic</h3>
          <p className="text-stone-500 font-medium mb-8">
            If there is a domain we should track more clearly, we can extend the
            rollout taxonomy without breaking the existing dictionary.
          </p>
          <button className="bg-stone-800 text-white px-8 py-4 rounded-2xl font-black hover:bg-stone-900 transition-all shadow-lg">
            Suggest Category
          </button>
        </div>
      </div>
    </div>
  )
}
