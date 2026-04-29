'use client'

import Link from 'next/link'
import { CATEGORIES } from '@/lib/constants'

export default function CategoriesPage() {
  return (
    <div className="min-h-screen bg-neutral-100 pb-24">
      <div className="bg-heritage-dark text-white py-24 border-b border-heritage-darker relative overflow-hidden">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center relative z-10">
          <h1 className="text-5xl md:text-7xl font-black mb-6 font-display tracking-tight">
            Browse Topics
          </h1>
          <p className="text-xl text-white/90 max-w-2xl mx-auto font-medium opacity-90 leading-relaxed">
            Explore the dictionary through practical domains such as greetings,
            family, health, culture, and everyday life.
          </p>
        </div>
        <div className="absolute inset-0 opacity-5 pointer-events-none">
          <div className="grid grid-cols-8 gap-4 rotate-12 scale-150">
            {CATEGORIES.map((category) => (
              <span key={category.id} className="text-3xl font-black uppercase tracking-widest text-white/20">
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
              <div className="bg-neutral-100 rounded-[2.5rem] p-10 border border-accent-200 shadow-soft hover:shadow-xl hover:border-accent-300 hover:-translate-y-2 transition-all duration-500 h-full flex flex-col">
                <div className="w-20 h-20 bg-accent-50 rounded-3xl flex items-center justify-center text-sm font-black uppercase tracking-widest mb-8 group-hover:bg-accent-100 group-hover:scale-110 transition-all duration-500">
                  {category.icon}
                </div>

                <h3 className="text-3xl font-black text-heritage-dark mb-4 font-display group-hover:text-accent-700 transition-colors">
                  {category.name}
                </h3>

                <p className="text-lg text-neutral-500 leading-relaxed font-medium mb-8 flex-grow">
                  {category.description}
                </p>

                <div className="mt-auto pt-8 border-t border-accent-100 flex items-center justify-between text-accent-700 font-black text-sm uppercase tracking-widest">
                  <span>Explore Corpus</span>
                  <span className="text-2xl group-hover:translate-x-3 transition-transform duration-300">{'->'}</span>
                </div>
              </div>
            </Link>
          ))}
        </div>
      </div>

      <div className="max-w-4xl mx-auto px-4 mt-24">
        <div className="bg-accent-50 rounded-[2rem] p-12 border-2 border-accent-200 text-center">
          <h3 className="text-2xl font-black text-heritage-dark font-display mb-4">Suggest a New Topic</h3>
          <p className="text-neutral-500 font-medium mb-8">
            If there is a domain we should track more clearly, we can extend the
            rollout taxonomy without breaking the existing dictionary.
          </p>
          <button className="bg-heritage-dark text-white px-8 py-4 rounded-2xl font-black hover:bg-heritage-darker transition-all shadow-soft">
            Suggest Category
          </button>
        </div>
      </div>
    </div>
  )
}
