import 'dart:ui';

import 'package:burguer_menu_app/features/food_meal_menu/domain/entities/meal_entity.dart';
import 'package:burguer_menu_app/features/food_meal_menu/presenter/children/category_menu_list_screen/category_menu_list_screen.dart';
import 'package:burguer_menu_app/features/food_meal_menu/presenter/children/category_menu_list_screen/widget/information_meal_card.dart';
import 'package:burguer_menu_app/features/food_meal_menu/presenter/children/detail_meal_screen/detail_meal_screen.dart';
import 'package:flutter/material.dart';

class FoodMealMenuScreen extends StatefulWidget {
  @override
  State<FoodMealMenuScreen> createState() => _FoodMealMenuScreenState();
}

class _FoodMealMenuScreenState extends State<FoodMealMenuScreen> {
  late PageController _pageController = PageController(initialPage: 4, viewportFraction: 0.6);
  late PageController _pageControllerText = PageController(initialPage: 4,);

  // index to control IndexedStack - name the variable correctly
  int _pageIndexActive = 0;
  
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
            child: IndexedStack(
              index: _pageIndexActive,
              children: [
                CategoryMenuListScreen(
                  currentIndex: _currentIndex,
                  pagePercent: _pagePercent,
                  lengthItems: lengthItems,
                  size: size,
                  pageController: _pageController,
                ),
                DetailMealScreen(
                  currentIndex: _currentIndex!,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
