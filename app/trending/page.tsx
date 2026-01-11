// app/trending/page.tsx
export default function TrendingPage() {  // Changed from "export function" to "export default function"
  return (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-gradient-to-br from-primary-700 to-primary-500 text-white py-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h1 className="text-4xl md:text-5xl font-bold mb-4">🔥 Trending Words</h1>
          <p className="text-xl text-green-100">
            The most popular words this week
          </p>
        </div>
      </div>

      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="bg-yellow-50 border-2 border-yellow-200 rounded-xl p-8 text-center">
          <div className="text-6xl mb-4">📊</div>
          <h2 className="text-2xl font-bold text-gray-900 mb-2">Coming Soon!</h2>
          <p className="text-gray-700">
            We're building analytics to track trending words. Check back soon!
          </p>
        </div>
      </div>
    </div>
  )
}