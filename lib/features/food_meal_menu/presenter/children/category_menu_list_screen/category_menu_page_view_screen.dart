import 'package:burguer_menu_app/features/food_meal_menu/presenter/children/category_menu_list_screen/widget/meal_card.dart';
import 'package:burguer_menu_app/features/food_meal_menu/presenter/children/category_menu_list_screen/widget/menu_perspective_scroll_view.dart';
import 'package:burguer_menu_app/features/food_meal_menu/presenter/children/category_menu_list_screen/widget/transformed_item.dart';
import 'package:flutter/material.dart';

class CategoryMenuListScreen extends StatelessWidget {
  const CategoryMenuListScreen({
    super.key,
    required this.currentIndex,
    required this.pagePercent,
    required this.lengthItems,
    required this.size,
    required this.pageController,
    required this.onPageChanged,
  });

  final int currentIndex;
  final double pagePercent;
  final int lengthItems;
  final Size size;
  final PageController pageController;
  final VoidCallback onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: MenuPerspectiveScrollView(
            currentPage: currentIndex,
            factorChange: pagePercent,
            itemsLength: lengthItems,
          ),
        ),
        // Static new element
        if (currentIndex < lengthItems - 1)
          TransformedItem(
            index: currentIndex + 1,
            factorChange: pagePercent,
            startScale: .1,
            endScale: .9,
            startXTranslate: -(size.width * 0.5),
            endXTranslate: -(size.width * 0.05),
            startYTranslate: size.height * 0.5,
            endYTranslate: size.height * 0.08,
            child: MealCard(
              index: currentIndex + 1,
              imagePath:
                  "assets/milkshakes/shake-${(currentIndex + 1) % lengthItems}.png",
              opacity: 1.0,
            ),
          )
        else
          TransformedItem(
            index: currentIndex + 1,
            factorChange: pagePercent.clamp(0, 0.5),
            startScale: .1,
            endScale: .9,
            startXTranslate: -(size.width * 0.5),
            endXTranslate: -(size.width * 0.05),
            startYTranslate: size.height * 0.5,
            endYTranslate: size.height * 0.1,
            child: const SizedBox(),
          ),
        // Void Page View
        Positioned.fill(
          child: PageView.builder(
            controller: pageController,
            itemCount: lengthItems,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => onPageChanged(),
                child: Container(
                  color: Colors.transparent,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}