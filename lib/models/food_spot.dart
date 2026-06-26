import 'package:hive/hive.dart';

part 'food_spot.g.dart';

@HiveType(typeId: 0)
class FoodSpot extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String area;

  @HiveField(3)
  final String category;

  @HiveField(4)
  final double rating;

  @HiveField(5)
  final String description;

  @HiveField(6)
  final String imageUrl;

  @HiveField(7)
  final String priceRange;

  @HiveField(8)
  bool isSaved;

  FoodSpot({
    required this.id,
    required this.name,
    required this.area,
    required this.category,
    required this.rating,
    required this.description,
    required this.imageUrl,
    required this.priceRange,
    this.isSaved = false,
  });

  factory FoodSpot.fromJson(Map<String, dynamic> json) => FoodSpot(
        id: json['id'] as String,
        name: json['name'] as String,
        area: json['area'] as String,
        category: json['category'] as String,
        rating: (json['rating'] as num).toDouble(),
        description: json['description'] as String,
        imageUrl: json['imageUrl'] as String,
        priceRange: json['priceRange'] as String,
      );
}
