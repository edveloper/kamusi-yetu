'use client'

import Link from 'next/link'

export default function TrendingPage() {
  return (
    <div className="min-h-screen bg-stone-50 pb-24 font-sans">
      {/* Hero Header: Straight Typography Mirroring About/Team DNA */}
      <div className="bg-emerald-900 text-white py-32 border-b border-emerald-800 relative overflow-hidden">
        <div className="max-w-4xl mx-auto px-4 text-center relative z-10">
          <h1 className="text-6xl md:text-8xl font-black mb-8 font-logo tracking-tight">
            Trending
          </h1>
          <p className="text-xl md:text-2xl text-emerald-100 opacity-90 leading-relaxed font-medium">
            Monitoring the pulse of our living languages. <br className="hidden md:block"/> 
            What Kenya is speaking, searching, and preserving today.
          </p>
        </div>
        
        {/* Signature Decorative Circles */}
        <div className="absolute top-0 right-0 opacity-10 translate-x-1/4 -translate-y-1/4 pointer-events-none">
          <div className="w-[600px] h-[600px] border-[60px] border-white rounded-full"></div>
        </div>
      </div>

      <div className="max-w-4xl mx-auto px-4 -mt-16 relative z-20">
        {/* The Card: Mirrored from About/Team Mission Section */}
        <section className="bg-white rounded-[3rem] shadow-xl border border-stone-200 p-10 md:p-16 mb-12">
          <div className="flex flex-col items-center text-center">
            <div className="w-20 h-20 bg-emerald-50 text-emerald-600 rounded-[1.5rem] flex items-center justify-center text-4xl font-black mb-8 font-logo">
              📊
            </div>
            
            <h2 className="text-4xl font-black text-gray-900 font-logo mb-6">Coming Soon</h2>
            
            <div className="space-y-8 max-w-xl">
              <p className="text-xl text-stone-700 leading-relaxed font-medium">
                We are currently building <span className="text-emerald-600 font-black">Archive Analytics</span>—a sophisticated engine to track which dialects and phrases are gaining momentum across the digital landscape.
              </p>
              
              <p className="text-xl text-stone-600 leading-relaxed italic border-l-4 border-emerald-100 pl-8 py-2">
                &ldquo;Our goal is to visualize the revitalization of our mother tongues in real-time, highlighting the words that are returning to daily conversation.&rdquo;
              </p>
            </div>

            <div className="mt-12 pt-10 border-t border-stone-100 w-full">
              <Link href="/explore">
                <button className="bg-emerald-900 text-white px-12 py-5 rounded-2xl font-black text-xl hover:bg-emerald-800 transition-all shadow-xl hover:scale-105 active:scale-95">
                  Explore Current Records
                </button>
              </Link>
            </div>
          </div>
        </section>

        {/* Sneak Peek Pillars: Using the Pillar style from About/Team */}
        <div className="grid md:grid-cols-2 gap-8 opacity-50 grayscale">
          <div className="bg-white p-10 rounded-[2.5rem] border border-stone-200 shadow-sm">
            <div className="w-12 h-12 bg-stone-50 rounded-xl flex items-center justify-center text-2xl mb-6">📈</div>
            <h3 className="text-2xl font-black text-emerald-900 mb-4 font-logo">Dialect Velocity</h3>
            <p className="text-stone-600 leading-relaxed font-medium">
              A breakdown of which language families are seeing the most community growth each week.
            </p>
          </div>
          <div className="bg-white p-10 rounded-[2.5rem] border border-stone-200 shadow-sm">
            <div className="w-12 h-12 bg-stone-50 rounded-xl flex items-center justify-center text-2xl mb-6">🔥</div>
            <h3 className="text-2xl font-black text-emerald-900 mb-4 font-logo">Top Phrases</h3>
            <p className="text-stone-600 leading-relaxed font-medium">
              Identifying proverbs and idioms that are being revitalized by the community.
            </p>
          </div>
        </div>
      </div>
    </div>
  )
}