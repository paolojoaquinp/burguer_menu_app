import 'dart:ui';

import 'package:burguer_menu_app/features/food_meal_menu/presenter/widgets/meal_card.dart';
import 'package:burguer_menu_app/features/food_meal_menu/presenter/widgets/menu_perspective_scroll_view.dart';
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
    _pagePercent = (_pageController.page! - _currentIndex!).abs();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Expanded(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: MenuPerspectiveScrollView(
                currentPage: _currentIndex!,
                factorChange: _pagePercent!,
              ),
            ),
            // Static new element
            Positioned.fill(
              child: Transform.translate(
                offset: Offset(
                  lerpDouble(-(size.width * 0.5), -(size.width * 0.05), _pagePercent!)!,
                  lerpDouble(size.height * 0.5, size.height * 0.1, _pagePercent!)!,
                ),
                child: Transform.scale(
                  scale: lerpDouble(.1, .9, _pagePercent!), // Escala completa
                  child: Container(
                    color: Colors.transparent,
                    child: MealCard(
                      imagePath:
                          "assets/milkshakes/shake-${_currentIndex! + 1}.png",
                      opacity: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            // PageView Controllment
            Positioned.fill(
              child: PageView.builder(
                controller: _pageController,
                itemCount: 7,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
