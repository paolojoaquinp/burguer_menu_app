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
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          MealEntity.fakeValues[_currentIndex!].name,
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          MealEntity.fakeValues[_currentIndex!].type,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "£${MealEntity.fakeValues[_currentIndex!].price.toString().substring(0, 3)}",
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: MealEntity.fakeValues[_currentIndex!].price.toString().substring(3,5),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
