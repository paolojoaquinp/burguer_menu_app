import 'package:burguer_menu_app/features/food_meal_menu/domain/entities/meal_entity.dart';
import 'package:burguer_menu_app/features/food_meal_menu/presenter/children/category_menu_list_screen/widget/transformed_text.dart';
import 'package:flutter/material.dart';

class InformationMealCard extends StatefulWidget {
  const InformationMealCard({
    super.key,
    required this.currentIndex,
    required this.factorChange,
    required this.pageControllerText,
  });

  final int currentIndex;
  final double factorChange;
  final PageController pageControllerText;

  @override
  State<InformationMealCard> createState() => _InformationMealCardState();
}

class _InformationMealCardState extends State<InformationMealCard> {

  @override
  Widget build(BuildContext context) {
    // final absPrevPage = (widget.currentIndex - 1) % 7;
    // abs nxt page (curerntIndex + 1)
    final absNxtPage = (widget.currentIndex + 1) % 7;
    // print('absPrevPage: $absPrevPage');
    // print('currentIndex: ${widget.currentIndex}');
    // print('absNxtPage: $absNxtPage');
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
                // Active
                Positioned.fill(
                  child: TransformedText(
                    currentIndex: widget.currentIndex,
                    factorChange: 1 - widget.factorChange,
                    beginTranslateX: -size.width * 0.5,
                    endTranslateX: 0.0,
                    scaleBegin: 1.0,
                    scaleEnd: 1.0,
                  ),
                ),
                // Next
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TransformedText(
                      currentIndex: absNxtPage,
                      factorChange: widget.factorChange,
                      beginTranslateX: 0.0,
                      endTranslateX: 0.0,
                      scaleBegin: 0.0,
                      scaleEnd: 1.0,
                    ),
                  ),
                ),
              ],
            )
          ),
          RichText(
            text: TextSpan(
              text:
                  "£${MealEntity.fakeValues[widget.currentIndex].price.toString().substring(0, 3)}",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: MealEntity.fakeValues[widget.currentIndex].price
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