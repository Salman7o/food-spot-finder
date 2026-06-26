# 🍜 Food Spot Finder — Flutter

A Flutter app to discover, browse, and save the best food spots in Karachi. Built with Flutter and Dart, featuring category filtering, search, and a clean card-based UI.

> Inspired by exploring Karachi's food scene — from legendary Burns Road bun kababs to waterfront dining at Do Darya.

## Features

- Browse food spots with images, ratings, and descriptions
- Filter by category: BBQ, Pakistani, Cafe, Street Food, Grills, Seafood
- Real-time search by name or area
- Save favourite spots locally with Hive
- Cached network images for smooth performance
- Clean, modern UI with a warm coral colour palette

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Flutter 3.x |
| Language | Dart |
| Local Storage | Hive + hive_flutter |
| Image Caching | cached_network_image |
| HTTP | http |
| Location | geolocator |

## Getting Started

```bash
# Clone the repo
git clone https://github.com/Salman7o/food-spot-finder.git
cd food-spot-finder

# Install dependencies
flutter pub get

# Generate Hive adapters
flutter pub run build_runner build

# Run the app
flutter run
```

## Project Structure

```
lib/
├── main.dart                    # App entry point
├── models/
│   └── food_spot.dart           # FoodSpot model
├── screens/
│   └── home_screen.dart         # Main browse screen
├── services/
│   └── food_spot_service.dart   # Data fetching + search logic
└── widgets/
    └── spot_card.dart           # Food spot card UI
```

## Roadmap

- [ ] Google Places API integration for live data
- [ ] Map view with spot pins
- [ ] User reviews and ratings
- [ ] Share spots to Instagram/WhatsApp

## Author

**Salman Hamzo** — [GitHub](https://github.com/Salman7o) | [Portfolio](https://salman-portfolio-8bc67.web.app/) | [@pak_pov](https://instagram.com/pak_pov)
