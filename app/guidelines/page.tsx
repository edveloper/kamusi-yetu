import Link from 'next/link'

export default function GuidelinesPage() {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Hero */}
      <div className="bg-gradient-to-br from-primary-700 to-primary-500 text-white py-16">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
          <h1 className="text-4xl md:text-5xl font-bold mb-4">Contribution Guidelines</h1>
          <p className="text-xl text-green-100">
            Help us maintain quality and respect across all languages
          </p>
        </div>
      </div>

      {/* Content */}
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        {/* Quick Start */}
        <section className="bg-white rounded-2xl shadow-lg p-8 mb-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-6">Before You Contribute</h2>
          <div className="bg-primary-50 border-l-4 border-primary-500 p-4 mb-6">
            <p className="text-gray-800 font-medium">
              ✅ You should be a native or fluent speaker of the language you're contributing to
            </p>
          </div>
          <p className="text-gray-700 leading-relaxed">
            Kamusi Yetu thrives on authentic contributions from people who truly know and use these languages. If you're not sure about a word or usage, it's better to let someone else contribute it.
          </p>
        </section>

        {/* What to Contribute */}
        <section className="bg-white rounded-2xl shadow-lg p-8 mb-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-6">✅ What to Contribute</h2>
          <div className="space-y-4">
            <div className="flex items-start gap-3">
              <span className="text-2xl">📝</span>
              <div>
                <h3 className="font-bold text-gray-900 mb-1">Common Words</h3>
                <p className="text-gray-700 text-sm">Everyday words that people actually use in conversation.</p>
              </div>
            </div>
            <div className="flex items-start gap-3">
              <span className="text-2xl">🎭</span>
              <div>
                <h3 className="font-bold text-gray-900 mb-1">Cultural Terms</h3>
                <p className="text-gray-700 text-sm">Words specific to your culture, traditions, or community.</p>
              </div>
            </div>
            <div className="flex items-start gap-3">
              <span className="text-2xl">🗣️</span>
              <div>
                <h3 className="font-bold text-gray-900 mb-1">Dialect Variations</h3>
                <p className="text-gray-700 text-sm">Regional variations of words (please specify the dialect).</p>
              </div>
            </div>
            <div className="flex items-start gap-3">
              <span className="text-2xl">💡</span>
              <div>
                <h3 className="font-bold text-gray-900 mb-1">Modern Slang</h3>
                <p className="text-gray-700 text-sm">Contemporary terms, but mark them as informal/slang.</p>
              </div>
            </div>
          </div>
        </section>

        {/* What NOT to Contribute */}
        <section className="bg-white rounded-2xl shadow-lg p-8 mb-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-6">❌ What NOT to Contribute</h2>
          <div className="space-y-4">
            <div className="bg-red-50 border-l-4 border-red-500 p-4">
              <h3 className="font-bold text-red-900 mb-1">🚫 Offensive Content</h3>
              <p className="text-red-800 text-sm">No hate speech, slurs, or derogatory terms.</p>
            </div>
            <div className="bg-red-50 border-l-4 border-red-500 p-4">
              <h3 className="font-bold text-red-900 mb-1">🚫 Made-Up Words</h3>
              <p className="text-red-800 text-sm">Don't invent words. Only contribute words that are actually used.</p>
            </div>
            <div className="bg-red-50 border-l-4 border-red-500 p-4">
              <h3 className="font-bold text-red-900 mb-1">🚫 Incorrect Information</h3>
              <p className="text-red-800 text-sm">Don't guess. If you're not sure, don't submit it.</p>
            </div>
            <div className="bg-red-50 border-l-4 border-red-500 p-4">
              <h3 className="font-bold text-red-900 mb-1">🚫 Spam or Jokes</h3>
              <p className="text-red-800 text-sm">This is a serious resource. Keep it respectful.</p>
            </div>
          </div>
        </section>

        {/* Quality Guidelines */}
        <section className="bg-white rounded-2xl shadow-lg p-8 mb-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-6">📋 Quality Guidelines</h2>
          <div className="space-y-6">
            <div>
              <h3 className="text-xl font-bold text-primary-600 mb-2">1. Clear Definitions</h3>
              <p className="text-gray-700 mb-2">Write definitions that are:</p>
              <ul className="list-disc list-inside text-gray-700 space-y-1 ml-4">
                <li>Easy to understand</li>
                <li>Accurate and specific</li>
                <li>Not circular (don't use the word in its own definition)</li>
              </ul>
            </div>
            <div>
              <h3 className="text-xl font-bold text-primary-600 mb-2">2. Good Examples</h3>
              <p className="text-gray-700 mb-2">Usage examples should:</p>
              <ul className="list-disc list-inside text-gray-700 space-y-1 ml-4">
                <li>Show the word in a natural sentence</li>
                <li>Demonstrate proper context</li>
                <li>Be appropriate for all audiences</li>
              </ul>
            </div>
            <div>
              <h3 className="text-xl font-bold text-primary-600 mb-2">3. Specify Context</h3>
              <p className="text-gray-700 mb-2">Always indicate if a word is:</p>
              <ul className="list-disc list-inside text-gray-700 space-y-1 ml-4">
                <li>Formal or informal</li>
                <li>Modern or traditional</li>
                <li>Used in a specific region or dialect</li>
                <li>Common or rare</li>
              </ul>
            </div>
          </div>
        </section>

        {/* Moderation */}
        <section className="bg-white rounded-2xl shadow-lg p-8 mb-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-6">🛡️ Moderation Process</h2>
          <p className="text-gray-700 mb-4">All contributions go through community review:</p>
          <div className="space-y-3">
            <div className="flex items-center gap-3">
              <div className="w-8 h-8 bg-yellow-100 text-yellow-700 rounded-full flex items-center justify-center font-bold text-sm">1</div>
              <p className="text-gray-700">Your submission enters the <span className="font-bold text-yellow-700">Pending</span> queue</p>
            </div>
            <div className="flex items-center gap-3">
              <div className="w-8 h-8 bg-blue-100 text-blue-700 rounded-full flex items-center justify-center font-bold text-sm">2</div>
              <p className="text-gray-700">Community moderators review it for accuracy</p>
            </div>
            <div className="flex items-center gap-3">
              <div className="w-8 h-8 bg-green-100 text-green-700 rounded-full flex items-center justify-center font-bold text-sm">3</div>
              <p className="text-gray-700">If approved, it becomes <span className="font-bold text-green-700">Verified</span></p>
            </div>
          </div>
        </section>

        {/* CTA */}
        <div className="bg-gradient-to-br from-primary-500 to-primary-700 rounded-2xl shadow-lg p-8 text-white text-center">
          <h2 className="text-3xl font-bold mb-4">Ready to Contribute?</h2>
          <p className="text-lg text-green-100 mb-6">
            Follow these guidelines and help build Kenya's linguistic future.
          </p>
          <Link href="/contribute">
            <button className="bg-white text-primary-700 px-8 py-3 rounded-lg hover:bg-green-50 transition font-bold">
              Add a Word →
            </button>
          </Link>
        </div>
      </div>
    </div>
  )
}