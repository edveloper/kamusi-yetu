import Link from 'next/link'

export default function ModeratorsPage() {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Hero */}
      <div className="bg-gradient-to-br from-primary-700 to-primary-500 text-white py-16">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h1 className="text-4xl md:text-5xl font-bold mb-4">Our Moderators</h1>
          <p className="text-xl text-green-100">
            Guardians of quality and cultural authenticity
          </p>
        </div>
      </div>

      {/* Content */}
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        {/* What Moderators Do */}
        <section className="bg-white rounded-2xl shadow-lg p-8 mb-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-6">What Do Moderators Do?</h2>
          <div className="space-y-4">
            <div className="flex items-start gap-4">
              <div className="w-10 h-10 bg-green-100 text-green-600 rounded-full flex items-center justify-center font-bold flex-shrink-0">
                ✓
              </div>
              <div>
                <h3 className="font-bold text-gray-900 mb-1">Review Submissions</h3>
                <p className="text-gray-700">Verify that new words and definitions are accurate and culturally appropriate.</p>
              </div>
            </div>
            <div className="flex items-start gap-4">
              <div className="w-10 h-10 bg-blue-100 text-blue-600 rounded-full flex items-center justify-center font-bold flex-shrink-0">
                🛡️
              </div>
              <div>
                <h3 className="font-bold text-gray-900 mb-1">Ensure Quality</h3>
                <p className="text-gray-700">Maintain high standards for definitions, examples, and translations.</p>
              </div>
            </div>
            <div className="flex items-start gap-4">
              <div className="w-10 h-10 bg-yellow-100 text-yellow-600 rounded-full flex items-center justify-center font-bold flex-shrink-0">
                🚩
              </div>
              <div>
                <h3 className="font-bold text-gray-900 mb-1">Handle Flags</h3>
                <p className="text-gray-700">Investigate flagged content and resolve disputes between contributors.</p>
              </div>
            </div>
            <div className="flex items-start gap-4">
              <div className="w-10 h-10 bg-red-100 text-red-600 rounded-full flex items-center justify-center font-bold flex-shrink-0">
                ❌
              </div>
              <div>
                <h3 className="font-bold text-gray-900 mb-1">Remove Spam</h3>
                <p className="text-gray-700">Keep the platform clean by removing spam, inappropriate content, and vandalism.</p>
              </div>
            </div>
          </div>
        </section>

        {/* Our Moderators */}
        <section className="bg-white rounded-2xl shadow-lg p-8 mb-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-6">Meet Our Moderators</h2>
          <p className="text-gray-600 mb-6">
            Our moderators are native speakers and language experts from across Kenya's diverse communities.
          </p>
          <div className="grid md:grid-cols-2 gap-6">
            <div className="border border-gray-200 rounded-xl p-6">
              <div className="flex items-center gap-4 mb-4">
                <div className="w-16 h-16 bg-primary-100 rounded-full flex items-center justify-center text-2xl">
                  🛡️
                </div>
                <div>
                  <h3 className="font-bold text-gray-900">Swahili Team</h3>
                  <p className="text-sm text-gray-600">3 moderators</p>
                </div>
              </div>
              <p className="text-sm text-gray-700">
                Experts in both coastal and inland Swahili dialects
              </p>
            </div>
            <div className="border border-gray-200 rounded-xl p-6">
              <div className="flex items-center gap-4 mb-4">
                <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center text-2xl">
                  🛡️
                </div>
                <div>
                  <h3 className="font-bold text-gray-900">Kikuyu Team</h3>
                  <p className="text-sm text-gray-600">2 moderators</p>
                </div>
              </div>
              <p className="text-sm text-gray-700">
                Native speakers familiar with multiple Kikuyu variants
              </p>
            </div>
            <div className="border border-gray-200 rounded-xl p-6">
              <div className="flex items-center gap-4 mb-4">
                <div className="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center text-2xl">
                  🛡️
                </div>
                <div>
                  <h3 className="font-bold text-gray-900">Luo Team</h3>
                  <p className="text-sm text-gray-600">2 moderators</p>
                </div>
              </div>
              <p className="text-sm text-gray-700">
                Experienced in Dholuo documentation and teaching
              </p>
            </div>
            <div className="border border-gray-200 rounded-xl p-6">
              <div className="flex items-center gap-4 mb-4">
                <div className="w-16 h-16 bg-yellow-100 rounded-full flex items-center justify-center text-2xl">
                  🛡️
                </div>
                <div>
                  <h3 className="font-bold text-gray-900">More Languages</h3>
                  <p className="text-sm text-gray-600">Growing team</p>
                </div>
              </div>
              <p className="text-sm text-gray-700">
                Expanding to cover all Kenyan languages
              </p>
            </div>
          </div>
        </section>

        {/* Become a Moderator */}
        <section className="bg-gradient-to-br from-primary-500 to-primary-700 rounded-2xl shadow-lg p-8 text-white">
          <h2 className="text-3xl font-bold mb-4">Become a Moderator</h2>
          <p className="text-lg text-green-100 mb-6">
            Are you a native speaker with deep knowledge of your language? 
            Do you care about accuracy and cultural preservation? We'd love to have you on the team.
          </p>
          
          <div className="bg-white/10 rounded-xl p-6 mb-6">
            <h3 className="text-xl font-bold mb-4">Requirements:</h3>
            <ul className="space-y-2">
              <li className="flex items-start gap-2">
                <span>✓</span>
                <span>Native or fluent speaker of a Kenyan language</span>
              </li>
              <li className="flex items-start gap-2">
                <span>✓</span>
                <span>Strong understanding of grammar and usage</span>
              </li>
              <li className="flex items-start gap-2">
                <span>✓</span>
                <span>Commitment to 2-3 hours per week</span>
              </li>
              <li className="flex items-start gap-2">
                <span>✓</span>
                <span>Fair, respectful, and patient with contributors</span>
              </li>
            </ul>
          </div>

          <div className="flex flex-col sm:flex-row gap-4">
            <Link href="/contact" className="flex-1">
              <button className="w-full bg-white text-primary-700 px-6 py-3 rounded-lg hover:bg-green-50 transition font-bold">
                Apply to Moderate
              </button>
            </Link>
            <Link href="/guidelines" className="flex-1">
              <button className="w-full border-2 border-white text-white px-6 py-3 rounded-lg hover:bg-white/10 transition font-bold">
                Read Guidelines
              </button>
            </Link>
          </div>
        </section>
      </div>
    </div>
  )
}