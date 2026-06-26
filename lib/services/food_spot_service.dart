import '../models/food_spot.dart';

// Mock data representing Karachi food spots
// In production: replace with Google Places API or a custom backend
class FoodSpotService {
  static final List<FoodSpot> _mockSpots = [
    FoodSpot(
      id: '1',
      name: 'BBQ Tonight',
      area: 'Clifton, Karachi',
      category: 'BBQ',
      rating: 4.5,
      description: 'Famous for their mixed BBQ platter and boti karahi. A Karachi institution.',
      imageUrl: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=500',
      priceRange: 'PKR 1500–3000',
    ),
    FoodSpot(
      id: '2',
      name: 'Kolachi Restaurant',
      area: 'Do Darya, Karachi',
      category: 'Pakistani',
      rating: 4.7,
      description: 'Waterfront dining with the best seafood and Pakistani cuisine in the city.',
      imageUrl: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500',
      priceRange: 'PKR 2000–5000',
    ),
    FoodSpot(
      id: '3',
      name: 'Cafe Flo',
      area: 'DHA Phase 6, Karachi',
      category: 'Cafe',
      rating: 4.3,
      description: 'Trendy cafe with great coffee, waffles, and a cosy ambiance.',
      imageUrl: 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=500',
      priceRange: 'PKR 800–2000',
    ),
    FoodSpot(
      id: '4',
      name: 'Bun Kabab Wala',
      area: 'Burns Road, Karachi',
      category: 'Street Food',
      rating: 4.8,
      description: 'Legendary street bun kabab — the real Karachi experience.',
      imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500',
      priceRange: 'PKR 50–150',
    ),
    FoodSpot(
      id: '5',
      name: 'Nando\'s Karachi',
      area: 'Gulshan-e-Iqbal, Karachi',
      category: 'Grills',
      rating: 4.2,
      description: 'PERi-PERi chicken done right. Great for groups.',
      imageUrl: 'https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?w=500',
      priceRange: 'PKR 1200–2500',
    ),
  ];

  Future<List<FoodSpot>> fetchSpots({String? category}) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));
    if (category != null && category != 'All') {
      return _mockSpots.where((s) => s.category == category).toList();
    }
    return _mockSpots;
  }

  Future<List<FoodSpot>> searchSpots(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final q = query.toLowerCase();
    return _mockSpots.where((s) =>
      s.name.toLowerCase().contains(q) ||
      s.area.toLowerCase().contains(q) ||
      s.category.toLowerCase().contains(q)
    ).toList();
  }

  static const List<String> categories = [
    'All', 'BBQ', 'Pakistani', 'Cafe', 'Street Food', 'Grills', 'Seafood',
  ];
}
