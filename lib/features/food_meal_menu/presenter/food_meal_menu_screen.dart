import 'dart:ui';

import 'package:burguer_menu_app/features/food_meal_menu/domain/entities/meal_entity.dart';
import 'package:burguer_menu_app/features/food_meal_menu/presenter/widgets/animated_scaled_page_view/animated_scaled_page_view.dart';
import 'package:burguer_menu_app/features/food_meal_menu/presenter/widgets/animated_scaled_page_view/widget/information_meal_card.dart';
import 'package:flutter/material.dart';

class FoodMealMenuScreen extends StatefulWidget {
  @override
  State<FoodMealMenuScreen> createState() => _FoodMealMenuScreenState();
}

class _FoodMealMenuScreenState extends State<FoodMealMenuScreen> {
  late PageController _pageController = PageController(initialPage: 4, viewportFraction: 0.6);
  late PageController _pageControllerText = PageController(initialPage: 4,);

  int? _currentIndex;
  double? _pagePercent;
  final lengthItems = 7;

  @override
  void initState() {
    _currentIndex = 4;
    _pagePercent = 0.0;
    _pageController.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController
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
        surfaceTintColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: InformationMealCard(
              currentIndex: _currentIndex!,
              factorChange: _pagePercent!,
              pageControllerText: _pageControllerText,
            ),
          ),
          Expanded(
            flex: 11,
            child: PageView(
              children: [
                AnimatedScaledPageView(
                  currentIndex: _currentIndex,
                  pagePercent: _pagePercent,
                  lengthItems: lengthItems,
                  size: size,
                  pageController: _pageController,
                ),
                Center(child: Text('Placegolder'),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
