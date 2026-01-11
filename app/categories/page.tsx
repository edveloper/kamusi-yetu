// app/categories/page.tsx
import Link from 'next/link'

export default function CategoriesPage() {
  const categories = [
    { id: 'animals', name: 'Animals', emoji: '🦁', description: 'Wildlife and domestic animals' },
    { id: 'food', name: 'Food & Drink', emoji: '🍲', description: 'Meals, ingredients, and beverages' },
    { id: 'family', name: 'Family', emoji: '👨‍👩‍👧‍👦', description: 'Family members and relationships' },
    { id: 'nature', name: 'Nature', emoji: '🌳', description: 'Plants, weather, and environment' },
    { id: 'body', name: 'Body Parts', emoji: '🫀', description: 'Human anatomy' },
    { id: 'colors', name: 'Colors', emoji: '🎨', description: 'Colors and shades' },
    { id: 'numbers', name: 'Numbers', emoji: '🔢', description: 'Counting and quantities' },
    { id: 'time', name: 'Time', emoji: '⏰', description: 'Days, months, and seasons' },
    { id: 'greetings', name: 'Greetings', emoji: '👋', description: 'Hello, goodbye, and pleasantries' },
    { id: 'emotions', name: 'Emotions', emoji: '😊', description: 'Feelings and states of mind' },
    { id: 'actions', name: 'Actions', emoji: '🏃', description: 'Verbs and activities' },
    { id: 'places', name: 'Places', emoji: '🏠', description: 'Locations and buildings' },
  ]

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-gradient-to-br from-primary-700 to-primary-500 text-white py-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h1 className="text-4xl md:text-5xl font-bold mb-4">Browse by Category</h1>
          <p className="text-xl text-green-100">
            Explore words organized by topic
          </p>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="grid md:grid-cols-3 lg:grid-cols-4 gap-6">
          {categories.map((cat) => (
            <Link key={cat.id} href={`/search?category=${cat.id}`}>
              <div className="bg-white rounded-xl shadow-md hover:shadow-xl transition p-6 cursor-pointer border-2 border-transparent hover:border-primary-300 text-center">
                <div className="text-5xl mb-4">{cat.emoji}</div>
                <h3 className="text-xl font-bold text-gray-900 mb-2">{cat.name}</h3>
                <p className="text-sm text-gray-600">{cat.description}</p>
              </div>
            </Link>
          ))}
        </div>
      </div>
    </div>
  )
}