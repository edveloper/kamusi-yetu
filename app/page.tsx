export default function Home() {
  return (
    <div className="min-h-screen">
      {/* Hero Section */}
      <section className="bg-gradient-to-br from-primary-500 to-primary-700 text-white py-20">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h1 className="text-4xl md:text-6xl font-bold mb-6">
            🇰🇪 Every Kenyan Language,<br />Equal and Alive
          </h1>
          <p className="text-xl md:text-2xl mb-8 text-primary-100">
            A collaborative dictionary built by Kenyans, for Kenyans
          </p>
          
          {/* Search Bar */}
          <div className="max-w-2xl mx-auto">
            <div className="bg-white rounded-xl shadow-strong p-2">
              <input
                type="text"
                placeholder="Search in any language..."
                className="w-full px-4 py-3 text-neutral-900 text-lg focus:outline-none"
              />
            </div>
          </div>

          {/* Quick Stats */}
          <div className="mt-12 grid grid-cols-2 md:grid-cols-4 gap-4 max-w-3xl mx-auto">
            <div className="bg-white/10 backdrop-blur-sm rounded-lg p-4">
              <div className="text-3xl font-bold">25,000+</div>
              <div className="text-primary-100 text-sm">Words</div>
            </div>
            <div className="bg-white/10 backdrop-blur-sm rounded-lg p-4">
              <div className="text-3xl font-bold">7</div>
              <div className="text-primary-100 text-sm">Languages</div>
            </div>
            <div className="bg-white/10 backdrop-blur-sm rounded-lg p-4">
              <div className="text-3xl font-bold">2,340</div>
              <div className="text-primary-100 text-sm">Contributors</div>
            </div>
            <div className="bg-white/10 backdrop-blur-sm rounded-lg p-4">
              <div className="text-3xl font-bold">Growing</div>
              <div className="text-primary-100 text-sm">Daily</div>
            </div>
          </div>
        </div>
      </section>

      {/* My Languages Section */}
      <section className="py-12 bg-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between mb-6">
            <h2 className="text-2xl font-bold text-neutral-900">
              My Languages
            </h2>
            <button className="text-primary-500 hover:text-primary-700 font-medium">
              Edit
            </button>
          </div>
          
          <div className="flex flex-wrap gap-3">
            <div className="bg-primary-100 text-primary-700 px-4 py-2 rounded-full font-medium flex items-center gap-2">
              <span className="w-2 h-2 bg-primary-500 rounded-full"></span>
              English
            </div>
            <div className="bg-primary-100 text-primary-700 px-4 py-2 rounded-full font-medium flex items-center gap-2">
              <span className="w-2 h-2 bg-primary-500 rounded-full"></span>
              Swahili
            </div>
            <div className="bg-primary-100 text-primary-700 px-4 py-2 rounded-full font-medium flex items-center gap-2">
              <span className="w-2 h-2 bg-primary-500 rounded-full"></span>
              Kikuyu
            </div>
            <button className="border-2 border-dashed border-neutral-300 text-neutral-500 px-4 py-2 rounded-full font-medium hover:border-primary-500 hover:text-primary-500 transition">
              + Add Language
            </button>
          </div>
        </div>
      </section>

      {/* Trending Section */}
      <section className="py-12 bg-neutral-100">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-2xl font-bold text-neutral-900 mb-6 flex items-center gap-2">
            🔥 Trending Now
          </h2>
          
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            {/* Trending Card 1 */}
            <div className="card hover:shadow-medium transition cursor-pointer">
              <div className="flex items-start justify-between mb-3">
                <div>
                  <h3 className="text-xl font-bold text-neutral-900">"ruto"</h3>
                  <p className="text-sm text-neutral-500">Sheng (verb)</p>
                </div>
                <span className="bg-accent-100 text-accent-700 px-2 py-1 rounded text-xs font-bold">
                  342 🔥
                </span>
              </div>
              <p className="text-neutral-700">
                To promise something and not deliver...
              </p>
            </div>

            {/* Trending Card 2 */}
            <div className="card hover:shadow-medium transition cursor-pointer">
              <div className="flex items-start justify-between mb-3">
                <div>
                  <h3 className="text-xl font-bold text-neutral-900">"chakula"</h3>
                  <p className="text-sm text-neutral-500">Swahili (noun)</p>
                </div>
                <span className="bg-accent-100 text-accent-700 px-2 py-1 rounded text-xs font-bold">
                  156 🔥
                </span>
              </div>
              <p className="text-neutral-700">
                Food - see translations in all 7 languages
              </p>
            </div>

            {/* Trending Card 3 */}
            <div className="card hover:shadow-medium transition cursor-pointer">
              <div className="flex items-start justify-between mb-3">
                <div>
                  <h3 className="text-xl font-bold text-neutral-900">"harambee"</h3>
                  <p className="text-sm text-neutral-500">Swahili (noun)</p>
                </div>
                <span className="bg-accent-100 text-accent-700 px-2 py-1 rounded text-xs font-bold">
                  134 🔥
                </span>
              </div>
              <p className="text-neutral-700">
                All pull together - Kenya's motto
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-16 bg-primary-500">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h2 className="text-3xl md:text-4xl font-bold text-white mb-4">
            Help Preserve Our Languages
          </h2>
          <p className="text-xl text-primary-100 mb-8">
            Add words from your mother tongue and help keep it alive for future generations
          </p>
          <button className="btn-accent text-lg px-8 py-4">
            + Contribute a Word
          </button>
        </div>
      </section>
    </div>
  )
}