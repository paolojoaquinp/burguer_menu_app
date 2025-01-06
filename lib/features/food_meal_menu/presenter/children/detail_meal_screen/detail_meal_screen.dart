import 'package:burguer_menu_app/features/food_meal_menu/presenter/children/category_menu_list_screen/widget/information_meal_card.dart';
import 'package:burguer_menu_app/features/food_meal_menu/presenter/children/detail_meal_screen/widgets/size_option_widget.dart';
import 'package:flutter/material.dart';

class DetailMealScreen extends StatefulWidget {
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
  State<DetailMealScreen> createState() => _DetailMealScreenState();
}

class _DetailMealScreenState extends State<DetailMealScreen>
    with SingleTickerProviderStateMixin {
  double scaleSizeOption = 1.0;

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
              currentIndex: widget.currentIndex,
              factorChange: widget.factorChange,
              pageControllerText: widget.pageControllerText,
            ),
          ),
          Expanded(
            flex: 11,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Hero(
                  tag: 'meal-card-${widget.currentIndex}',
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOutBack,
                      transformAlignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..scale(scaleSizeOption),
                      child: Image.asset(
                        'assets/milkshakes/shake-${widget.currentIndex}.png',
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizeOptionWidget(
                              text: 'Small',
                              isSelected: true,
                              onPressed: () => setState(() {
                                    scaleSizeOption = 0.7;
                                  })),
                          SizeOptionWidget(
                              text: 'Medium',
                              isSelected: false,
                              onPressed: () => setState(() {
                                    scaleSizeOption = 1.0;
                                  })),
                          SizeOptionWidget(
                              text: 'Large',
                              isSelected: false,
                              onPressed: () => setState(() {
                                    scaleSizeOption = 1.3;
                                  })),
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
                                    child:
                                        _buildTemperatureOption('Iced', false),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          FloatingActionButton(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
