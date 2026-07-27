import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text("About FoodHub"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),

            /// INTRO
            const Text(
              "Welcome to FoodHub ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              "Your premier destination for delicious, high-quality meals delivered right to your doorstep. Since 2020, we’ve been passionate about bringing people together through exceptional food experiences. Our mission is simple: to provide fresh, flavorful dishes made with love and delivered with care. We partner with the best local restaurants and chefs to bring you a diverse menu that caters to all tastes and preferences.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),

            const SizedBox(height: 28),

            /// VALUES TITLE
            const Text(
              "Our Values",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            /// VALUES GRID
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _ValueCard(
                  icon: Icons.favorite_border,
                  title: "Made with Love",
                  desc:
                      "Every dish is prepared with passion and attention to detail",
                ),
                _ValueCard(
                  icon: Icons.verified,
                  title: "Quality First",
                  desc: "We never compromise on quality of ingredients",
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _ValueCard(
                  icon: Icons.people_outline,
                  title: "Community Focus",
                  desc: "Supporting local restaurants and communities",
                ),
                _ValueCard(
                  icon: Icons.eco_outlined,
                  title: "Sustainability",
                  desc: "Committed to eco-friendly practices",
                ),
              ],
            ),

            const SizedBox(height: 28),

            /// STORY CARD
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Our Story",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "FoodHub was founded in 2020 by a group of food enthusiasts who believed everyone deserves access to great food. What started as a small operation has grown into a thriving platform serving thousands of customers daily.We work directly with talented chefs and restaurants to ensure every order meets our high standards of quality, freshness, and taste.Today, we are proud to be a trusted name in food delivery, known for reliability, quality, and customer satisfaction.",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _ValueCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const _ValueCard({
    required this.icon,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(blurRadius: 6, color: Colors.black.withOpacity(0.05)),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.orange, size: 26),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            const SizedBox(height: 6),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
