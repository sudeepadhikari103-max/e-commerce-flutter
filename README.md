# MyShop

MyShop is a mini e-commerce mobile app built with Flutter to practice creating a complete multi-screen shopping experience. The app includes a home page with a promotional banner carousel, scrollable category filters, and a reusable product list. Users can tap a category to view matching products in a grid, then open a product detail screen that shows the product image, rating, category, price, description, and add-to-cart action.

## Project Goal
The goal of this project is to build a simple e-commerce application using Flutter, with static local product data and clear navigation between screens. It demonstrates reusable components, UI layout design, category filtering, external package usage, and screen-to-screen data passing.

## Features
- Home page with app bar, search, cart badge, and banner carousel
- Dark mode with theme toggle
- Horizontal category section
- Reusable product cards
- Category-based product grid view
- Product details screen with quantity selector and live total
- Hero animation for product image transitions
- Search filtering for products
- Local static product data only

## Packages Used
- carousel_slider

## Project Structure
- lib/main.dart
- lib/data/product_data.dart
- lib/models/product.dart
- lib/screens/home_page.dart
- lib/screens/category_page.dart
- lib/screens/product_details_page.dart
- lib/widgets/banner_carousel.dart
- lib/widgets/category_item.dart
- lib/widgets/product_card.dart

## Run the App
```bash
flutter create .
flutter pub get
flutter run -d chrome
```

## Notes
This project follows the assignment requirements for a Flutter mini e-commerce app and includes several bonus features such as search, dark mode, cart badge, hero animation, and quantity selection.
