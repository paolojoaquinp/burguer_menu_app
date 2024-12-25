import 'dart:ui';

import 'package:burguer_menu_app/features/food_meal_menu/presenter/widgets/meal_card.dart';
import 'package:burguer_menu_app/features/food_meal_menu/presenter/widgets/menu_perspective_scroll_view.dart';
import 'package:burguer_menu_app/features/food_meal_menu/presenter/widgets/transformed_item.dart';
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
    print(_pagePercent);
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
                itemsLength: lengthItems,
              ),
            ),
            // Static new element
            if(_currentIndex! < lengthItems -1)
            TransformedItem(
              index: _currentIndex! + 1,
              factorChange: _pagePercent!,
              startScale: .1,
              endScale: .9,
              startXTranslate: -(size.width * 0.5),
              endXTranslate: -(size.width * 0.05),
              startYTranslate: size.height * 0.5,
              endYTranslate: size.height * 0.1,
              child: MealCard(
                index: _currentIndex! + 1,
                imagePath: "assets/milkshakes/shake-${_currentIndex! + 1}.png",
                opacity: 1.0,
              ),
            )
            else TransformedItem(
              index: _currentIndex! + 1,
              factorChange: _pagePercent!.clamp(0, 0.5),
              startScale: .1,
              endScale: .9,
              startXTranslate: -(size.width * 0.5),
              endXTranslate: -(size.width * 0.05),
              startYTranslate: size.height * 0.5,
              endYTranslate: size.height * 0.1,
              child: SizedBox(),
            ),
            Positioned.fill(
              child: PageView.builder(
                controller: _pageController,
                itemCount: lengthItems,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
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
