import 'package:burguer_menu_app/features/food_meal_menu/presenter/widgets/animated_scaled_page_view/widget/meal_card.dart';
import 'package:burguer_menu_app/features/food_meal_menu/presenter/widgets/animated_scaled_page_view/widget/menu_perspective_scroll_view.dart';
import 'package:burguer_menu_app/features/food_meal_menu/presenter/widgets/animated_scaled_page_view/widget/transformed_item.dart';
import 'package:flutter/material.dart';

class AnimatedScaledPageView extends StatelessWidget {
  const AnimatedScaledPageView({
    super.key,
    required int? currentIndex,
    required double? pagePercent,
    required this.lengthItems,
    required this.size,
    required PageController pageController,
  })  : _currentIndex = currentIndex,
        _pagePercent = pagePercent,
        _pageController = pageController;

  final int? _currentIndex;
  final double? _pagePercent;
  final int lengthItems;
  final Size size;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        if (_currentIndex! < lengthItems - 1)
          TransformedItem(
            index: _currentIndex + 1,
            factorChange: _pagePercent,
            startScale: .1,
            endScale: .9,
            startXTranslate: -(size.width * 0.5),
            endXTranslate: -(size.width * 0.05),
            startYTranslate: size.height * 0.5,
            endYTranslate: size.height * 0.08,
            child: MealCard(
              index: _currentIndex! + 1,
              imagePath:
                  "assets/milkshakes/shake-${(_currentIndex! + 1) % lengthItems}.png",
              opacity: 1.0,
            ),
          )
        else
          TransformedItem(
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
    );
  }
}