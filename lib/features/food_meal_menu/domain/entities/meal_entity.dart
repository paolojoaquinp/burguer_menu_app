class MealEntity {
  final String name;
  final String type;
  final String category;
  final String imageUrl;
  final double price;

  const MealEntity({
    required this.name,
    required this.type,
    required this.category,
    required this.imageUrl,
    required this.price,
  });

  static List<MealEntity> fakeValues = List.generate(7, (index) {
    return MealEntity(
      name: 'Caramel',
      type: 'Machiato',
      category: 'Milkshake',
      imageUrl: 'assets/milkshakes/shake-${index % 7}.png',
      price: 12.49 + index,
    );
  });
}
