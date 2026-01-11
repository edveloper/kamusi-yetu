export default function ContactPage() {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Hero */}
      <div className="bg-gradient-to-br from-primary-700 to-primary-500 text-white py-16">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
          <h1 className="text-4xl md:text-5xl font-bold mb-4">Get in Touch</h1>
          <p className="text-xl text-green-100">
            We'd love to hear from you
          </p>
        </div>
      </div>

      {/* Content */}
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="grid md:grid-cols-2 gap-8">
          {/* Contact Info */}
          <div>
            <div className="bg-white rounded-2xl shadow-lg p-8 mb-6">
              <h2 className="text-2xl font-bold text-gray-900 mb-6">Contact Information</h2>
              <div className="space-y-4">
                <div className="flex items-start gap-4">
                  <div className="w-10 h-10 bg-primary-100 text-primary-600 rounded-full flex items-center justify-center flex-shrink-0">
                    📧
                  </div>
                  <div>
                    <h3 className="font-bold text-gray-900 mb-1">Email</h3>
                    <a href="mailto:info@kamusi-yetu.ke" className="text-primary-600 hover:text-primary-700">
                      info@kamusi-yetu.ke
                    </a>
                  </div>
                </div>
                <div className="flex items-start gap-4">
                  <div className="w-10 h-10 bg-primary-100 text-primary-600 rounded-full flex items-center justify-center flex-shrink-0">
                    🐦
                  </div>
                  <div>
                    <h3 className="font-bold text-gray-900 mb-1">Twitter</h3>
                    <a href="https://twitter.com/kamusi_yetu" className="text-primary-600 hover:text-primary-700">
                      @kamusi_yetu
                    </a>
                  </div>
                </div>
                <div className="flex items-start gap-4">
                  <div className="w-10 h-10 bg-primary-100 text-primary-600 rounded-full flex items-center justify-center flex-shrink-0">
                    📍
                  </div>
                  <div>
                    <h3 className="font-bold text-gray-900 mb-1">Location</h3>
                    <p className="text-gray-700">Nairobi, Kenya</p>
                  </div>
                </div>
              </div>
            </div>

            {/* FAQ Quick Links */}
            <div className="bg-white rounded-2xl shadow-lg p-8">
              <h2 className="text-2xl font-bold text-gray-900 mb-4">Quick Help</h2>
              <div className="space-y-3">
                <a href="/about" className="block text-primary-600 hover:text-primary-700 font-medium">
                  → About Kamusi Yetu
                </a>
                <a href="/guidelines" className="block text-primary-600 hover:text-primary-700 font-medium">
                  → Contribution Guidelines
                </a>
                <a href="/contribute" className="block text-primary-600 hover:text-primary-700 font-medium">
                  → Start Contributing
                </a>
              </div>
            </div>
          </div>

          {/* Contact Form */}
          <div className="bg-white rounded-2xl shadow-lg p-8">
            <h2 className="text-2xl font-bold text-gray-900 mb-6">Send Us a Message</h2>
            <form className="space-y-4">
              <div>
                <label className="block text-sm font-bold text-gray-700 mb-2">
                  Name
                </label>
                <input
                  type="text"
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500"
                  placeholder="Your name"
                />
              </div>
              <div>
                <label className="block text-sm font-bold text-gray-700 mb-2">
                  Email
                </label>
                <input
                  type="email"
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500"
                  placeholder="your@email.com"
                />
              </div>
              <div>
                <label className="block text-sm font-bold text-gray-700 mb-2">
                  Subject
                </label>
                <select className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500">
                  <option>General Inquiry</option>
                  <option>Partnership Opportunity</option>
                  <option>Technical Support</option>
                  <option>Report an Issue</option>
                  <option>Media Request</option>
                  <option>Other</option>
                </select>
              </div>
              <div>
                <label className="block text-sm font-bold text-gray-700 mb-2">
                  Message
                </label>
                <textarea
                  rows={5}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500"
                  placeholder="Tell us how we can help..."
                />
              </div>
              <button
                type="submit"
                className="w-full bg-primary-500 text-white px-6 py-3 rounded-lg hover:bg-primary-600 transition font-bold"
              >
                Send Message
              </button>
            </form>
            <p className="text-xs text-gray-500 mt-4">
              We typically respond within 48 hours
            </p>
          </div>
        </div>

        {/* Partnership CTA */}
        <div className="bg-gradient-to-br from-primary-500 to-primary-700 rounded-2xl shadow-lg p-8 text-white text-center mt-8">
          <h2 className="text-3xl font-bold mb-4">Interested in Partnering?</h2>
          <p className="text-lg text-green-100 mb-6">
            We're always looking for organizations, universities, and cultural institutions to collaborate with.
          </p>
          <button className="bg-white text-primary-700 px-8 py-3 rounded-lg hover:bg-green-50 transition font-bold">
            Partnership Inquiries →
          </button>
        </div>
      </div>
    </div>
  )
}