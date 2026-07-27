import 'package:flutter/material.dart';
import 'package:foodhub_app/models/food_item2.dart';
import 'screens/home_tab.dart';
import 'screens/menu_tab.dart';
import 'screens/profile_tab.dart';
import 'widgets/title_bar.dart';
import 'screens/about_page.dart';
import 'screens/contact_page.dart';

void main() {
  runApp(const FoodHubApp());
}

class FoodHubApp extends StatelessWidget {
  const FoodHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<dynamic> cartItems = [];
  List<FoodItem> favoriteItems = [];
  bool isDarkMode = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late List<Widget> _tabs;

  @override
  void initState() {
    super.initState();

    _tabs = [
      HomeTab(
        onBrowseMenu: () {
          setState(() {
            currentIndex = 1;
          });
        },
      ),
      MenuPage(
        onAddToCart: (item) {
          cartItems.add(item);
          setState(() {});
        },
        onToggleFavorite: (item) {
          setState(() {
            final index = favoriteItems.indexWhere(
              (fav) => fav.name == item.name,
            );
            if (index >= 0) {
              favoriteItems.removeAt(index);
            } else {
              favoriteItems.add(item);
            }
          });
        },
      ),

      ProfileTab(
        favoriteItems: favoriteItems,
        isDarkMode: isDarkMode,
        onDarkModeChanged: (value) {
          setState(() {
            isDarkMode = value;
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: isDarkMode ? Colors.grey.shade900 : Colors.white,

      // Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "FoodHub",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Delicious food delivered fast",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.orange),
              title: const Text("About Us"),
              subtitle: const Text("Learn more about FoodHub"),
              onTap: () {
                Navigator.pop(context); // close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.support_agent, color: Colors.orange),
              title: const Text("Contact Support"),
              subtitle: const Text("Get in touch with us"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactPage()),
                );
              },
            ),
          ],
        ),
      ),

      // End drawer showing cart contents
      endDrawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.orange),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Your Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Expanded(
              child: cartItems.isEmpty
                  ? const Center(child: Text("Cart is empty"))
                  : ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index] as Map<String, dynamic>;
                        return ListTile(
                          leading: SizedBox(
                            width: 56,
                            height: 56,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                item['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(item['name'] ?? ''),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Rs ${item['price']}"),
                              SizedBox(
                                height: 24,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.remove_circle_outline,
                                        size: 18,
                                      ),
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(
                                        minHeight: 24,
                                        minWidth: 24,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (item['quantity'] != null &&
                                              item['quantity'] > 1) {
                                            item['quantity']--;
                                          } else {
                                            cartItems.removeAt(index);
                                          }
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 30,
                                      child: Text(
                                        "${item['quantity'] ?? 1}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.add_circle_outline,
                                        size: 18,
                                      ),
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(
                                        minHeight: 24,
                                        minWidth: 24,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          item['quantity'] =
                                              (item['quantity'] ?? 1) + 1;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                cartItems.removeAt(index);
                              });
                            },
                          ),
                        );
                      },
                    ),
            ),

            // Total & checkout area
            if (cartItems.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total: Rs ${cartItems.fold<int>(0, (s, e) => s + ((e['price'] as int) * (e['quantity'] as int? ?? 1)))}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      onPressed: () {
                        _showCheckoutPopup();
                      },

                      child: const Text("Checkout"),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),

      // AppBar
      appBar: TitleBar(
        onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
        onCartTap: () => _scaffoldKey.currentState?.openEndDrawer(),
        cartItemCount: cartItems.length,
      ),

      // Body
      body: _tabs[currentIndex],

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: "Menu",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  void _showCheckoutPopup() {
    final streetController = TextEditingController();
    final cityController = TextEditingController();
    final zipController = TextEditingController();
    final cardController = TextEditingController();
    final expiryController = TextEditingController();
    final cvvController = TextEditingController();

    String deliveryTime = "Select a time";

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Dialog(
              backgroundColor: const Color(0xFFF4F1DF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// HEADER
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Checkout",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, size: 18),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),

                      const Text(
                        "Please provide your delivery and payment details.",
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),

                      const SizedBox(height: 18),

                      const Text("Street Address"),
                      const SizedBox(height: 6),
                      _inputBox(streetController, "123 Main St"),

                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("City"),
                                const SizedBox(height: 6),
                                _inputBox(cityController, "Foodville"),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("ZIP Code"),
                                const SizedBox(height: 6),
                                _inputBox(
                                  zipController,
                                  "12345",
                                  keyboard: TextInputType.number,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),

                      const Text("Delivery Time"),
                      const SizedBox(height: 6),

                      DropdownButtonFormField<String>(
                        value: deliveryTime,
                        decoration: _dropdownStyle(),
                        items: const [
                          DropdownMenuItem(
                            value: "Select a time",
                            child: Text("Select a time"),
                          ),
                          DropdownMenuItem(
                            value: "20 mins",
                            child: Text("20 mins"),
                          ),
                          DropdownMenuItem(
                            value: "30 mins",
                            child: Text("30 mins"),
                          ),
                          DropdownMenuItem(
                            value: "45 mins",
                            child: Text("45 mins"),
                          ),
                        ],
                        onChanged: (value) {
                          setModalState(() {
                            deliveryTime = value!;
                          });
                        },
                      ),

                      const SizedBox(height: 14),

                      const Text("Payment Method"),
                      const SizedBox(height: 6),

                      _inputBox(
                        cardController,
                        "Card Number",
                        keyboard: TextInputType.number,
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: [
                          Expanded(child: _inputBox(expiryController, "MM/YY")),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _inputBox(
                              cvvController,
                              "CVV",
                              keyboard: TextInputType.number,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.pop(context);

                            setState(() {
                              cartItems.clear();
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Order placed successfully 🎉"),
                              ),
                            );
                          },
                          child: const Text("Place Order"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _inputBox(
    TextEditingController controller,
    String hint, {
    TextInputType keyboard = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboard,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.black12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.black12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.orange),
        ),
      ),
    );
  }

  InputDecoration _dropdownStyle() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Colors.black12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Colors.black12),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Colors.orange),
      ),
    );
  }
}
