import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/food_spot.dart';

class SpotCard extends StatelessWidget {
  final FoodSpot spot;
  const SpotCard({super.key, required this.spot});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: spot.imageUrl,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (_, __) => Container(
                  height: 160,
                  color: Colors.grey.shade200,
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (_, __, ___) => Container(
                  height: 160, color: Colors.grey.shade200,
                  child: const Icon(Icons.restaurant, size: 48, color: Colors.grey),
                ),
              ),
              Positioned(
                top: 10, right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6B6B),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(spot.category,
                      style: const TextStyle(color: Colors.white,
                          fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(spot.name,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis),
                    ),
                    Row(children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 3),
                      Text(spot.rating.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                    ]),
                  ],
                ),
                const SizedBox(height: 4),
                Row(children: [
                  const Icon(Icons.location_on, size: 14, color: Colors.grey),
                  const SizedBox(width: 3),
                  Text(spot.area,
                      style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ]),
                const SizedBox(height: 6),
                Text(spot.description,
                    style: const TextStyle(color: Colors.black54, fontSize: 13),
                    maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(spot.priceRange,
                        style: const TextStyle(
                            color: Color(0xFFFF6B6B), fontWeight: FontWeight.w600)),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_border, size: 16),
                      label: const Text('Save'),
                      style: TextButton.styleFrom(foregroundColor: const Color(0xFFFF6B6B)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
