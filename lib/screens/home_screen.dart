import 'package:flutter/material.dart';
import '../models/food_spot.dart';
import '../services/food_spot_service.dart';
import '../widgets/spot_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FoodSpotService _service = FoodSpotService();
  final TextEditingController _searchController = TextEditingController();

  List<FoodSpot> _spots = [];
  bool _isLoading = true;
  String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    _loadSpots();
  }

  Future<void> _loadSpots() async {
    setState(() => _isLoading = true);
    final spots = await _service.fetchSpots(category: _selectedCategory);
    setState(() { _spots = spots; _isLoading = false; });
  }

  Future<void> _search(String query) async {
    if (query.isEmpty) { _loadSpots(); return; }
    setState(() => _isLoading = true);
    final results = await _service.searchSpots(query);
    setState(() { _spots = results; _isLoading = false; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 130,
              floating: true,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Food Spots 🍜',
                    style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFFF6B6B), Color(0xFFFF8E53)],
                      begin: Alignment.topLeft, end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: _searchController,
                      onChanged: _search,
                      decoration: InputDecoration(
                        hintText: 'Search spots, areas...',
                        prefixIcon: const Icon(Icons.search, color: Color(0xFFFF6B6B)),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 38,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: FoodSpotService.categories.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemBuilder: (_, i) {
                          final cat = FoodSpotService.categories[i];
                          final selected = _selectedCategory == cat;
                          return GestureDetector(
                            onTap: () {
                              setState(() => _selectedCategory = cat);
                              _loadSpots();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: selected ? const Color(0xFFFF6B6B) : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                              ),
                              child: Text(cat,
                                style: TextStyle(
                                  color: selected ? Colors.white : Colors.black87,
                                  fontWeight: FontWeight.w600, fontSize: 13,
                                )),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _isLoading
                ? const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator(color: Color(0xFFFF6B6B))))
                : _spots.isEmpty
                    ? const SliverFillRemaining(
                        child: Center(child: Text('No spots found.')))
                    : SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (_, i) => SpotCard(spot: _spots[i]),
                            childCount: _spots.length,
                          ),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
