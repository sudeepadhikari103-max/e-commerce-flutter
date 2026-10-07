import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/category_item.dart';
import '../widgets/product_card.dart';
import 'category_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _openCategory(BuildContext context, String name) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CategoryPage(categoryName: name)),
    );
  }

  void _msg(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(text), duration: const Duration(seconds: 1)));
  }

  @override
  Widget build(BuildContext context) {
    final popular = products.take(8).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [Icon(Icons.shopping_bag), SizedBox(width: 8), Text('MyShop')],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () => _msg(context, 'Search coming soon')),
          IconButton(icon: const Icon(Icons.shopping_cart_outlined), onPressed: () => _msg(context, 'Cart is empty')),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerCarousel(onBannerTap: (c) => _openCategory(context, c)),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: categories
                    .map((c) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: CategoryItem(
                              name: c.name, icon: c.icon, onTap: () => _openCategory(context, c.name)),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Popular Products',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () => _openCategory(context, 'All'),
                    child: const Text('See All →'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 270,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: popular.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, i) => SizedBox(width: 160, child: ProductCard(product: popular[i])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
