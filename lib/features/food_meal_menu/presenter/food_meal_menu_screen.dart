import 'package:burguer_menu_app/features/food_meal_menu/presenter/widgets/animated_scaled_page_view/animated_scaled_page_view.dart';
import 'package:flutter/material.dart';

class FoodMealMenuScreen extends StatefulWidget {
  @override
  State<FoodMealMenuScreen> createState() => _FoodMealMenuScreenState();
}

class _FoodMealMenuScreenState extends State<FoodMealMenuScreen> {
  late PageController _pageController =
      PageController(initialPage: 4, viewportFraction: 0.6);
  int? _currentIndex;
  double? _pagePercent;
  final lengthItems = 7;

  @override
  void initState() {
    _currentIndex = 4;
    _pagePercent = 0.0;
    _pageController!.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController!
      ..removeListener(_pageListener)
      ..dispose();
    super.dispose();
  }

  void _pageListener() {
    _currentIndex = _pageController.page!.floor();
    // infinite loop
    _pagePercent = (_pageController.page! - _currentIndex!).abs();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Meal Menu'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              child: Text('Food Meal Menu Screen'),
            ),
          ),
          Expanded(
            flex: 11,
            child: AnimatedScaledPageView(
              currentIndex: _currentIndex,
              pagePercent: _pagePercent,
              lengthItems: lengthItems,
              size: size,
              pageController: _pageController,
            ),
          ),
        ],
      ),
    );
  }
}
