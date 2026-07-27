import 'package:flutter/material.dart';
import 'dart:async';
import 'package:foodhub_app/models/food_item2.dart'; // import your dummy data file

class MenuPage extends StatefulWidget {
  final Function(FoodItem)? onAddToCart;
  final Function(FoodItem)? onToggleFavorite;

  const MenuPage({super.key, this.onAddToCart, this.onToggleFavorite});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late List<FoodItem> displayedItems; // now type is FoodItem
  final TextEditingController _searchController = TextEditingController();
  int currentCarousel = 0;
  final PageController _pageController = PageController();
  String selectedCategory = 'All';

  @override
  void initState() {
    super.initState();

    displayedItems = List<FoodItem>.from(foodItems);

    // Auto scroll carousel safely
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer.periodic(const Duration(seconds: 3), (timer) {
        if (_pageController.hasClients) {
          // check if PageController is attached
          if (currentCarousel < 2) {
            currentCarousel++;
          } else {
            currentCarousel = 0;
          }
          _pageController.animateToPage(
            currentCarousel,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _addToCart(FoodItem item) {
    widget.onAddToCart?.call(item);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("${item.name} added to cart")));
  }

  void _toggleFavorite(FoodItem item) {
    setState(() {
      item.fav = !item.fav;
      widget.onToggleFavorite?.call(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // 🔎 SEARCH BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _searchController,
                onChanged: _filterSearch,
                decoration: InputDecoration(
                  hintText: "Search food...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 🎯 FEATURED CAROUSEL
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                height: 300,
                child: PageView(
                  controller: _pageController,
                  children: [
                    carouselItem("assets/images/banner1.jpg"),
                    carouselItem("assets/images/banner2.jpg"),
                    carouselItem("assets/images/banner3.jpg"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 🍔 CATEGORIES
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  categoryChip("All"),
                  categoryChip("Burgers"),
                  categoryChip("Pizza"),
                  categoryChip("Shawarma"),
                  categoryChip("Snacks"),
                  categoryChip("Drinks"),
                  categoryChip("Desserts"),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // 🍔 ALL DISHES
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "All Dishes",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: displayedItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final item = displayedItems[index];

                return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 2.1 / 1,
                            child: Image.asset(
                              item.image,
                              width: double.infinity,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              width: 40,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.9),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  item.fav
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                  size: 18,
                                ),
                                padding: EdgeInsets.zero,
                                onPressed: () => _toggleFavorite(item),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item.description,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Rs ${item.price}",
                              style: const TextStyle(
                                color: Colors.orange,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  minimumSize: const Size(double.infinity, 22),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () => _addToCart(item),
                                child: const Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // 🔹 Carousel Widget
  Widget carouselItem(String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(image, width: double.infinity, fit: BoxFit.cover),
      ),
    );
  }

  // 🔹 Category Chip
  Widget categoryChip(String text) {
    final isSelected = selectedCategory == text;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(text),
        selected: isSelected,
        selectedColor: Colors.orange,
        backgroundColor: Colors.orange.shade100,
        onSelected: (_) => _applyFilters(text),
      ),
    );
  }

  void _filterSearch(String query) {
    _applyFilters(selectedCategory);
  }

  void _applyFilters(String category) {
    final q = _searchController.text.trim().toLowerCase();
    setState(() {
      selectedCategory = category;
      displayedItems = foodItems.where((item) {
        final matchesSearch =
            q.isEmpty ||
            item.name.toLowerCase().contains(q) ||
            item.description.toLowerCase().contains(q);

        final matchesCategory = category == 'All' || item.category == category;

        return matchesSearch && matchesCategory;
      }).toList();
    });
  }
}
