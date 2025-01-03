import 'package:burguer_menu_app/features/food_meal_menu/presenter/children/category_menu_list_screen/category_menu_page_view_screen.dart';
import 'package:burguer_menu_app/features/food_meal_menu/presenter/children/category_menu_list_screen/widget/information_meal_card.dart';
import 'package:burguer_menu_app/features/food_meal_menu/presenter/children/detail_meal_screen/detail_meal_screen.dart';
import 'package:flutter/material.dart';

class FoodMealMenuScreen extends StatefulWidget {
  const FoodMealMenuScreen({super.key});

  @override
  State<FoodMealMenuScreen> createState() => _FoodMealMenuScreenState();
}

class _FoodMealMenuScreenState extends State<FoodMealMenuScreen> {
  late PageController _pageController =
      PageController(initialPage: 4, viewportFraction: 0.6);
  late PageController _pageControllerText = PageController(
    initialPage: 4,
  );


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

  void _onPageChanged() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => DetailMealScreen(currentIndex: _currentIndex!),
    //   ),
    // );
    // Page Route Builder fade
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: DetailMealScreen(
              currentIndex: _currentIndex!,
              factorChange: _pagePercent!,
              pageControllerText: PageController(),
            ),
          );
        },
      ),
    );
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
        // how to make the Expanded Stay and just the EWxpanded flex : 11 change on _onPageChanged
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
            child: CategoryMenuListScreen(
              currentIndex: _currentIndex!,
              onPageChanged: () => _onPageChanged(),
              pagePercent: _pagePercent!,
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
