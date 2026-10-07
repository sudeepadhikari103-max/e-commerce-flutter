import 'package:flutter/material.dart';
import '../models/product.dart';

class CategoryData {
  final String name;
  final IconData icon;
  const CategoryData(this.name, this.icon);
}

const categories = [
  CategoryData('Electronics', Icons.devices),
  CategoryData('Fashion', Icons.checkroom),
  CategoryData('Shoes', Icons.directions_run),
  CategoryData('Beauty', Icons.face_retouching_natural),
  CategoryData('Accessories', Icons.watch),
  CategoryData('Home', Icons.chair),
];

String _img(String seed) => 'https://picsum.photos/seed/$seed/500/500';

final List<Product> products = [
  Product(name: 'iPhone', category: 'Electronics', image: _img('iphone'), price: 999, rating: 4.8, discount: 10,
      description: 'Latest smartphone with a stunning display, fast chip and all-day battery life.'),
  Product(name: 'Laptop', category: 'Electronics', image: _img('laptop'), price: 1200, rating: 4.6,
      description: 'Lightweight laptop with a fast SSD, 16GB RAM and a sharp 14-inch screen.'),
  Product(name: 'Wireless Headphones', category: 'Electronics', image: _img('headphones'), price: 120, rating: 4.5, discount: 20,
      description: 'Wireless headphones with high-quality sound and noise cancellation.'),
  Product(name: 'T-Shirt', category: 'Fashion', image: _img('tshirt'), price: 25, rating: 4.2,
      description: 'Soft 100% cotton t-shirt with a comfortable regular fit.'),
  Product(name: 'Denim Jacket', category: 'Fashion', image: _img('jacket'), price: 70, rating: 4.4, discount: 15,
      description: 'Classic denim jacket that pairs well with any outfit.'),
  Product(name: 'Sneakers', category: 'Shoes', image: _img('sneakers'), price: 85, rating: 4.7,
      description: 'Comfortable everyday sneakers with a cushioned sole.'),
  Product(name: 'Running Shoes', category: 'Shoes', image: _img('running'), price: 95, rating: 4.5, discount: 25,
      description: 'Breathable, lightweight running shoes built for long distance.'),
  Product(name: 'Face Cream', category: 'Beauty', image: _img('cream'), price: 30, rating: 4.3,
      description: 'Hydrating face cream suitable for all skin types.'),
  Product(name: 'Perfume', category: 'Beauty', image: _img('perfume'), price: 60, rating: 4.6,
      description: 'Long-lasting fragrance with fresh floral notes.'),
  Product(name: 'Smart Watch', category: 'Accessories', image: _img('watch'), price: 150, rating: 4.4, discount: 10,
      description: 'Track fitness, notifications and sleep from your wrist.'),
  Product(name: 'Sunglasses', category: 'Accessories', image: _img('sunglasses'), price: 40, rating: 4.1,
      description: 'UV-protected sunglasses with a modern frame.'),
  Product(name: 'Backpack', category: 'Accessories', image: _img('backpack'), price: 55, rating: 4.5,
      description: 'Spacious water-resistant backpack with a laptop compartment.'),
  Product(name: 'Table Lamp', category: 'Home', image: _img('lamp'), price: 35, rating: 4.3,
      description: 'Minimal table lamp with warm, adjustable lighting.'),
];

List<Product> productsByCategory(String category) =>
    category == 'All' ? products : products.where((p) => p.category == category).toList();
