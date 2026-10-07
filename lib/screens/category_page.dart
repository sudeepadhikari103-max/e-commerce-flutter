import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../widgets/product_card.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;
  const CategoryPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final items = productsByCategory(categoryName);
    return Scaffold(
      appBar: AppBar(title: Text(categoryName == 'All' ? 'All Products' : categoryName)),
      body: items.isEmpty
          ? const Center(child: Text('No products in this category yet.'))
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                mainAxisExtent: 270,
              ),
              itemBuilder: (_, i) => ProductCard(product: items[i]),
            ),
    );
  }
}
