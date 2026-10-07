import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class _BannerData {
  final String title, subtitle, image, category;
  final Color color;
  const _BannerData(this.title, this.subtitle, this.image, this.category, this.color);
}

const _banners = [
  _BannerData('Summer Sale', 'Up to 50% off fashion', 'https://picsum.photos/seed/summer/800/400', 'Fashion', Colors.orange),
  _BannerData('New Arrivals', 'Fresh shoes just landed', 'https://picsum.photos/seed/arrivals/800/400', 'Shoes', Colors.teal),
  _BannerData('Electronics Discount', 'Best deals on gadgets', 'https://picsum.photos/seed/gadgets/800/400', 'Electronics', Colors.indigo),
];

class BannerCarousel extends StatelessWidget {
  /// Called with the banner's linked category when tapped.
  final void Function(String category) onBannerTap;
  const BannerCarousel({super.key, required this.onBannerTap});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 170,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        autoPlayInterval: const Duration(seconds: 4),
      ),
      items: _banners.map((b) {
        return GestureDetector(
          onTap: () => onBannerTap(b.category),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: b.color,
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(b.image, fit: BoxFit.cover, errorBuilder: (_, __, ___) => const SizedBox()),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [b.color.withValues(alpha: 0.85), Colors.transparent],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(b.title,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(b.subtitle, style: const TextStyle(color: Colors.white70)),
                      const SizedBox(height: 10),
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white, foregroundColor: b.color,
                            padding: const EdgeInsets.symmetric(horizontal: 14), minimumSize: const Size(0, 30)),
                        onPressed: () => onBannerTap(b.category),
                        child: const Text('Shop Now'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
