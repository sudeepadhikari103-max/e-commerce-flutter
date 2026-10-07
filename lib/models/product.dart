class Product {
  final String name;
  final String category;
  final String image;
  final double price;
  final double rating;
  final String description;
  final int discount; // percent, 0 = no sale

  const Product({
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    required this.rating,
    required this.description,
    this.discount = 0,
  });
}
