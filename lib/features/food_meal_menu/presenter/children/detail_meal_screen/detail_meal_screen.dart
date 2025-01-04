import 'package:burguer_menu_app/features/food_meal_menu/presenter/children/category_menu_list_screen/widget/information_meal_card.dart';
import 'package:flutter/material.dart';

class DetailMealScreen extends StatelessWidget {
  const DetailMealScreen({
    super.key,
    required this.currentIndex,
    required this.factorChange,
    required this.pageControllerText,
  });

  final int currentIndex;
  final double factorChange;
  final PageController pageControllerText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Expanded(
            flex: 1,
            child: InformationMealCard(
              currentIndex: currentIndex,
              factorChange: factorChange,
              pageControllerText: pageControllerText,
            ),
          ),
          Expanded(
            flex: 11,
            child: Column(
              children: [
                Hero(
                  tag: 'meal-card-$currentIndex',
                  child: Center(
                    child: Image.asset(
                      'assets/milkshakes/shake-$currentIndex.png',
                      height: 400,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildSizeOption('Small', true),
                          _buildSizeOption('Medium', false),
                          _buildSizeOption('Large', false),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: _buildTemperatureOption('Hot', true),
                                  ),
                                  Expanded(
                                    child: _buildTemperatureOption('Iced', false),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          FloatingActionButton(
                            mini: true,
                            child: const Icon(Icons.add),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeOption(String text, bool isSelected) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? Colors.black : Colors.grey,
              width: 1,
            ),
          ),
          child: Icon(
            Icons.coffee,
            color: isSelected ? Colors.black : Colors.grey,
            size: 20,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildTemperatureOption(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : null,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.grey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
