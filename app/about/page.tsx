import Link from 'next/link'

export default function AboutPage() {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Hero */}
      <div className="bg-gradient-to-br from-primary-700 to-primary-500 text-white py-16 md:py-20">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h1 className="text-4xl md:text-5xl font-bold mb-4">About Kamusi Yetu</h1>
          <p className="text-xl text-green-100">
            Every Kenyan Language, Equal and Alive
          </p>
        </div>
      </div>

      {/* Main Content */}
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-12 md:py-16">
        {/* Mission */}
        <section className="bg-white rounded-2xl shadow-lg p-8 mb-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-6">Our Mission</h2>
          <p className="text-lg text-gray-700 leading-relaxed mb-4">
            Kamusi Yetu is a community-driven platform dedicated to preserving, celebrating, and promoting Kenya's linguistic diversity. We believe that every language—from Swahili and English to Kikuyu, Luo, Kalenjin, and the 40+ other languages spoken across Kenya—deserves equal recognition and preservation.
          </p>
          <p className="text-lg text-gray-700 leading-relaxed">
            Our mission is to build the most comprehensive, accurate, and accessible multilingual dictionary for all Kenyan languages, created by Kenyans, for Kenyans, and for the world.
          </p>
        </section>

        {/* Why We Exist */}
        <section className="bg-white rounded-2xl shadow-lg p-8 mb-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-6">Why We Exist</h2>
          <div className="space-y-6">
            <div>
              <h3 className="text-xl font-bold text-primary-600 mb-2">📚 Language Preservation</h3>
              <p className="text-gray-700 leading-relaxed">
                Many Kenyan languages are at risk of being lost as younger generations increasingly speak only English and Swahili. We're creating a lasting record of these languages before it's too late.
              </p>
            </div>
            <div>
              <h3 className="text-xl font-bold text-primary-600 mb-2">🤝 Cultural Identity</h3>
              <p className="text-gray-700 leading-relaxed">
                Language is the soul of culture. By preserving our languages, we preserve our stories, our wisdom, and our identity as Kenyans.
              </p>
            </div>
            <div>
              <h3 className="text-xl font-bold text-primary-600 mb-2">🌍 Accessibility</h3>
              <p className="text-gray-700 leading-relaxed">
                Everyone deserves access to knowledge in their mother tongue. We're breaking down language barriers and making information accessible to all Kenyans.
              </p>
            </div>
            <div>
              <h3 className="text-xl font-bold text-primary-600 mb-2">🚀 Innovation</h3>
              <p className="text-gray-700 leading-relaxed">
                We're building towards AI-powered translation tools that will eventually enable seamless communication across all Kenyan languages.
              </p>
            </div>
          </div>
        </section>

        {/* How It Works */}
        <section className="bg-white rounded-2xl shadow-lg p-8 mb-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-6">How It Works</h2>
          <div className="space-y-4">
            <div className="flex items-start gap-4">
              <div className="w-10 h-10 bg-primary-100 text-primary-600 rounded-full flex items-center justify-center font-bold flex-shrink-0">
                1
              </div>
              <div>
                <h3 className="font-bold text-gray-900 mb-1">Community Contributions</h3>
                <p className="text-gray-700">Native speakers add words, definitions, and usage examples from their languages.</p>
              </div>
            </div>
            <div className="flex items-start gap-4">
              <div className="w-10 h-10 bg-primary-100 text-primary-600 rounded-full flex items-center justify-center font-bold flex-shrink-0">
                2
              </div>
              <div>
                <h3 className="font-bold text-gray-900 mb-1">Expert Validation</h3>
                <p className="text-gray-700">Linguists and community moderators verify submissions for accuracy and cultural sensitivity.</p>
              </div>
            </div>
            <div className="flex items-start gap-4">
              <div className="w-10 h-10 bg-primary-100 text-primary-600 rounded-full flex items-center justify-center font-bold flex-shrink-0">
                3
              </div>
              <div>
                <h3 className="font-bold text-gray-900 mb-1">Collaborative Improvement</h3>
                <p className="text-gray-700">The community votes on examples, adds context, and continuously improves entries.</p>
              </div>
            </div>
            <div className="flex items-start gap-4">
              <div className="w-10 h-10 bg-primary-100 text-primary-600 rounded-full flex-shrink-0 flex items-center justify-center font-bold">
                4
              </div>
              <div>
                <h3 className="font-bold text-gray-900 mb-1">Free Access for All</h3>
                <p className="text-gray-700">Everyone can search, learn, and contribute—no paywalls, no restrictions.</p>
              </div>
            </div>
          </div>
        </section>

        {/* Values */}
        <section className="bg-white rounded-2xl shadow-lg p-8 mb-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-6">Our Values</h2>
          <div className="grid md:grid-cols-2 gap-6">
            <div className="border-l-4 border-primary-500 pl-4">
              <h3 className="font-bold text-gray-900 mb-2">🎯 Accuracy</h3>
              <p className="text-gray-700 text-sm">We prioritize correctness and cultural authenticity in every entry.</p>
            </div>
            <div className="border-l-4 border-primary-500 pl-4">
              <h3 className="font-bold text-gray-900 mb-2">🤲 Inclusivity</h3>
              <p className="text-gray-700 text-sm">Every language matters. No language is more important than another.</p>
            </div>
            <div className="border-l-4 border-primary-500 pl-4">
              <h3 className="font-bold text-gray-900 mb-2">🔒 Respect</h3>
              <p className="text-gray-700 text-sm">We treat all languages, dialects, and contributors with dignity.</p>
            </div>
            <div className="border-l-4 border-primary-500 pl-4">
              <h3 className="font-bold text-gray-900 mb-2">🌱 Sustainability</h3>
              <p className="text-gray-700 text-sm">Built to last for generations, not just for profit.</p>
            </div>
          </div>
        </section>

        {/* CTA */}
        <div className="bg-gradient-to-br from-primary-500 to-primary-700 rounded-2xl shadow-lg p-8 text-white text-center">
          <h2 className="text-3xl font-bold mb-4">Join Our Mission</h2>
          <p className="text-lg text-green-100 mb-6">
            Help us preserve Kenya's linguistic heritage for future generations.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link href="/contribute">
              <button className="bg-white text-primary-700 px-8 py-3 rounded-lg hover:bg-green-50 transition font-bold">
                Contribute Words
              </button>
            </Link>
            <Link href="/contact">
              <button className="border-2 border-white text-white px-8 py-3 rounded-lg hover:bg-white/10 transition font-bold">
                Get in Touch
              </button>
            </Link>
          </div>
        </div>
      </div>
    </div>
  )
}