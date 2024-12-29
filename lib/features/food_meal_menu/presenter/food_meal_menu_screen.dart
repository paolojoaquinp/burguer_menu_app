import 'dart:ui';

import 'package:burguer_menu_app/features/food_meal_menu/domain/entities/meal_entity.dart';
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

class InformationMealCard extends StatelessWidget {
  const InformationMealCard({
    super.key,
    required this.currentIndex,
    required this.factorChange,
  });

  final int currentIndex;
  final double factorChange;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Transform.translate(
                    offset: Offset(
                      lerpDouble(-(size.width * 0.5), 0.0, 1 - factorChange)!,
                      0.0,
                    ),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            MealEntity.fakeValues[currentIndex!].name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            MealEntity.fakeValues[currentIndex!].type,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Transform(
                    alignment: Alignment.centerRight,
                    transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    // ..translate()
                    ..scale(lerpDouble(0.0, 1.0, factorChange)),
                    child: Opacity(
                      opacity: factorChange,
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              MealEntity.fakeValues[currentIndex!].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              MealEntity.fakeValues[currentIndex!].type,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text:
                  "£${MealEntity.fakeValues[currentIndex!].price.toString().substring(0, 3)}",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: MealEntity.fakeValues[currentIndex!].price
                      .toString()
                      .substring(3, 5),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
