import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  final VoidCallback onBrowseMenu;

  const HomeTab({super.key, required this.onBrowseMenu});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),

          // Main Title
          const Text(
            "Delicious Food,\nDelivered to Your Door",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          const Text(
            "Order from our diverse menu of fresh, high-quality dishes prepared by expert chefs",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
          const SizedBox(height: 60),
          // Browse Menu Button
          ElevatedButton(
            onPressed: onBrowseMenu,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Browse Menu",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 100),
          // Features Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _featureItem(Icons.access_time, "Fast Delivery", "30-45 min"),
              _featureItem(
                Icons.star_border_outlined,
                "Quality Food",
                "Fresh & tasty",
              ),
              _featureItem(
                Icons.local_shipping,
                "Free Shipping",
                "Orders \$30+",
              ),
              _featureItem(
                Icons.security,
                "Safe & Secure",
                "Contactless & secure",
              ),
            ],
          ),
          const SizedBox(height: 120),
          // Popular Categories
          const Text(
            "Popular Categories",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.spaceAround,
            spacing: 50,
            runSpacing: 50,
            children: [
              _category("🍔", "Burgers"),
              _category("🍕", "Pizza"),
              _category("🍣", "Sushi"),
              _category("🍝", "Pasta"),
            ],
          ),
          const SizedBox(height: 100),

          // Stats Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _stat("500+", "Happy Customers"),
                const SizedBox(width: 10),
                _stat("50+", "Menu Items"),
                const SizedBox(width: 10),
                _stat("4.8★", "Average Rating"),
                const SizedBox(width: 10),
                _stat("24/7", "Service Available"),
              ],
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  // Feature Item
  Widget _featureItem(IconData icon, String title, String subtitle) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.orange),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }

  // Popular Category
  Widget _category(String emoji, String name) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 50)),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  // Stats Item
  Widget _stat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white70)),
      ],
    );
  }
}
