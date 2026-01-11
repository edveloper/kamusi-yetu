export default function TeamPage() {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Hero */}
      <div className="bg-gradient-to-br from-primary-700 to-primary-500 text-white py-16">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h1 className="text-4xl md:text-5xl font-bold mb-4">Our Team</h1>
          <p className="text-xl text-green-100">
            The people building Kenya's linguistic future
          </p>
        </div>
      </div>

      {/* Content */}
      <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        {/* Founder */}
        <section className="mb-12">
          <h2 className="text-3xl font-bold text-gray-900 mb-8 text-center">Founder</h2>
          <div className="max-w-2xl mx-auto bg-white rounded-2xl shadow-lg p-8">
            <div className="text-center mb-6">
              <div className="w-32 h-32 bg-primary-100 rounded-full mx-auto mb-4 flex items-center justify-center text-5xl">
                👤
              </div>
              <h3 className="text-2xl font-bold text-gray-900 mb-1">Your Name</h3>
              <p className="text-primary-600 font-medium">Founder & Lead Developer</p>
            </div>
            <p className="text-gray-700 text-center leading-relaxed">
              A Kenyan software developer passionate about preserving our linguistic heritage. 
              Started Kamusi Yetu to ensure that no Kenyan language is forgotten in the digital age.
            </p>
          </div>
        </section>

        {/* Advisory Team */}
        <section className="mb-12">
          <h2 className="text-3xl font-bold text-gray-900 mb-8 text-center">Advisory Team</h2>
          <p className="text-center text-gray-600 mb-8 max-w-2xl mx-auto">
            Our advisors bring expertise in linguistics, technology, and community building
          </p>
          <div className="grid md:grid-cols-3 gap-6">
            <div className="bg-white rounded-xl shadow-md p-6 text-center">
              <div className="w-20 h-20 bg-green-100 rounded-full mx-auto mb-4 flex items-center justify-center text-3xl">
                📚
              </div>
              <h3 className="text-xl font-bold text-gray-900 mb-1">Dr. Linguist</h3>
              <p className="text-sm text-primary-600 font-medium mb-3">Linguistics Advisor</p>
              <p className="text-sm text-gray-600">
                Expertise in Bantu languages and phonetic documentation
              </p>
            </div>
            <div className="bg-white rounded-xl shadow-md p-6 text-center">
              <div className="w-20 h-20 bg-blue-100 rounded-full mx-auto mb-4 flex items-center justify-center text-3xl">
                💻
              </div>
              <h3 className="text-xl font-bold text-gray-900 mb-1">Tech Advisor</h3>
              <p className="text-sm text-primary-600 font-medium mb-3">Technology Advisor</p>
              <p className="text-sm text-gray-600">
                Specializes in NLP and machine translation systems
              </p>
            </div>
            <div className="bg-white rounded-xl shadow-md p-6 text-center">
              <div className="w-20 h-20 bg-yellow-100 rounded-full mx-auto mb-4 flex items-center justify-center text-3xl">
                🤝
              </div>
              <h3 className="text-xl font-bold text-gray-900 mb-1">Community Lead</h3>
              <p className="text-sm text-primary-600 font-medium mb-3">Community Advisor</p>
              <p className="text-sm text-gray-600">
                Builds bridges between language communities
              </p>
            </div>
          </div>
        </section>

        {/* Community Contributors */}
        <section className="bg-gradient-to-br from-primary-500 to-primary-700 rounded-2xl shadow-lg p-8 text-white text-center">
          <h2 className="text-3xl font-bold mb-4">Our Real Heroes</h2>
          <p className="text-xl text-green-100 mb-6 max-w-2xl mx-auto">
            This platform wouldn't exist without the 100+ community contributors who add words, 
            validate entries, and keep our languages alive every single day.
          </p>
          <div className="grid grid-cols-3 gap-6 max-w-2xl mx-auto mb-8">
            <div>
              <div className="text-4xl font-bold">100+</div>
              <div className="text-green-100">Contributors</div>
            </div>
            <div>
              <div className="text-4xl font-bold">25K+</div>
              <div className="text-green-100">Words Added</div>
            </div>
            <div>
              <div className="text-4xl font-bold">7</div>
              <div className="text-green-100">Languages</div>
            </div>
          </div>
          <a href="/contribute">
            <button className="bg-white text-primary-700 px-8 py-3 rounded-lg hover:bg-green-50 transition font-bold">
              Join the Team →
            </button>
          </a>
        </section>

        {/* Join Us */}
        <section className="mt-12 bg-white rounded-2xl shadow-lg p-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-4 text-center">Want to Join Us?</h2>
          <p className="text-center text-gray-700 mb-6 max-w-2xl mx-auto">
            We're always looking for linguists, developers, designers, and community organizers 
            who are passionate about preserving Kenyan languages.
          </p>
          <div className="text-center">
            <a href="/contact">
              <button className="bg-primary-500 text-white px-8 py-3 rounded-lg hover:bg-primary-600 transition font-bold">
                Get in Touch
              </button>
            </a>
          </div>
        </section>
      </div>
    </div>
  )
}