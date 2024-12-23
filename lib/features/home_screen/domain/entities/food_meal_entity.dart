class FoodMealEntity {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  const FoodMealEntity({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  static List<FoodMealEntity> fakeMealFoodValues = const [
    FoodMealEntity(
      name: "Milkshake",
      description: "20 Cups of different flavours",
      price: 0.0,
      imageUrl: "assets/menu_food/milkshake.png",
    ),
    FoodMealEntity(
      name: "Chicken Burger",
      description: "20 sets of different flavours",
      price: 0.0, 
      imageUrl: "assets/menu_food/chicken-burger.png",
    ),
    FoodMealEntity(
      name: "Chocolate Drinks",
      description: "20 Cups of different flavours",
      price: 0.0,
      imageUrl: "assets/menu_food/chocolate-drink.png",
    ),
    FoodMealEntity(
      name: "Coffee Drinks",
      description: "20 Cups of different flavours",
      price: 0.0, 
      imageUrl: "assets/menu_food/coffee-drink.png",
    ),
  ];
}
