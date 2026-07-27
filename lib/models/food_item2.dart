class FoodItem {
  final String name;
  final String description;
  final double price;
  final String image;
  final String category;
  bool fav;

  FoodItem({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    this.fav = false,
  });
}

final List<FoodItem> foodItems = [
  // 🍔 Burgers
  FoodItem(
    name: "Zinger Burger",
    category: "Burgers",
    price: 450,
    description:
        "Crispy chicken patty with lettuce, tomato, and signature sauce in a soft bun.",
    image: "assets/images/burger.jpg",
    fav: false,
  ),
  FoodItem(
    name: "Beef Deluxe Burger",
    category: "Burgers",
    price: 550,
    description:
        "Juicy beef patty with cheddar cheese, onions, pickles, and special sauce.",
    image: "assets/images/beef_burger.jpg",
    fav: false,
  ),

  FoodItem(
    name: "Veggie Burger",
    category: "Burgers",
    price: 400,
    description:
        "Grilled vegetable patty with fresh lettuce, tomato, and vegan mayo.",
    image: "assets/images/veggie_burger.jpg",
    fav: false,
  ),

  // 🍕 Pizza
  FoodItem(
    name: "Margherita Pizza",
    category: "Pizza",
    price: 800,
    description:
        "Classic pizza topped with tomato, mozzarella, and fresh basil.",
    image: "assets/images/margherita_pizza.jpg",
    fav: false,
  ),
  FoodItem(
    name: "Pepperoni Pizza",
    category: "Pizza",
    price: 950,
    description: "Loaded with pepperoni slices and extra mozzarella cheese.",
    image: "assets/images/pepperoni_pizza.jpg",
    fav: false,
  ),
  FoodItem(
    name: "BBQ Chicken Pizza",
    category: "Pizza",
    price: 1000,
    description: "Grilled chicken, BBQ sauce, onions, and a blend of cheeses.",
    image: "assets/images/bbq_pizza.jpg",
    fav: false,
  ),

  // 🌯 Shawarma
  FoodItem(
    name: "Chicken Shawarma",
    category: "Shawarma",
    price: 300,
    description:
        "Marinated grilled chicken wrapped in soft pita bread with garlic sauce.",
    image: "assets/images/shawarma.jpg",
    fav: false,
  ),
  FoodItem(
    name: "Beef Shawarma",
    category: "Shawarma",
    price: 350,
    description:
        "Tender beef strips with fresh veggies and special sauce in pita wrap.",
    image: "assets/images/beef_shawarma.jpg",
    fav: false,
  ),
  FoodItem(
    name: "Falafel Shawarma",
    category: "Shawarma",
    price: 300,
    description:
        "Crispy falafel with tahini sauce and fresh vegetables in a wrap.",
    image: "assets/images/flafel_shawarma.jpg",
    fav: false,
  ),

  // 🍟 Snacks
  FoodItem(
    name: "French Fries",
    category: "Snacks",
    price: 250,
    description: "Golden crispy fries served with ketchup.",
    image: "assets/images/french_fries.jpg",
    fav: false,
  ),
  FoodItem(
    name: "Onion Rings",
    category: "Snacks",
    price: 300,
    description: "Crispy battered onion rings served with dipping sauce.",
    image: "assets/images/onion_rings.jpg",
    fav: false,
  ),
  FoodItem(
    name: "Chicken Nuggets",
    category: "Snacks",
    price: 350,
    description: "Juicy bite-sized chicken pieces, deep-fried to perfection.",
    image: "assets/images/nuggets.jpg",
    fav: false,
  ),

  // 🥤 Drinks
  FoodItem(
    name: "Coca Cola",
    category: "Drinks",
    price: 150,
    description: "Refreshing chilled soft drink.",
    image: "assets/images/coca_cola.jpg",
    fav: false,
  ),
  FoodItem(
    name: "Orange Juice",
    category: "Drinks",
    price: 200,
    description: "Freshly squeezed orange juice with natural pulp.",
    image: "assets/images/orange_juice.jpg",
    fav: false,
  ),
  FoodItem(
    name: "Lemonade",
    category: "Drinks",
    price: 180,
    description: "Tangy and sweet lemonade with a hint of mint.",
    image: "assets/images/lemonade.jpg",
    fav: false,
  ),

  // 🍰 Desserts
  FoodItem(
    name: "Chocolate Cake",
    category: "Desserts",
    price: 400,
    description: "Rich and moist chocolate cake slice with chocolate frosting.",
    image: "assets/images/chocolate_cake.jpg",
    fav: false,
  ),
  FoodItem(
    name: "Vanilla Ice Cream",
    category: "Desserts",
    price: 250,
    description: "Creamy vanilla ice cream scoop served with wafer.",
    image: "assets/images/vanilla_icecream.jpg",
    fav: false,
  ),
  FoodItem(
    name: "Cheesecake",
    category: "Desserts",
    price: 450,
    description: "Classic cheesecake with a buttery crust and berry topping.",
    image: "assets/images/cheese_cake.jpg",
    fav: false,
  ),
];
