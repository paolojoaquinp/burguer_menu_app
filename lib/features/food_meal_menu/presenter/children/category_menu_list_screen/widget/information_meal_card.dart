import 'dart:ui';

import 'package:burguer_menu_app/features/food_meal_menu/domain/entities/meal_entity.dart';
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
    final absPrevPage = (widget.currentIndex - 1) % 7;
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
                  child: _TransformedText(
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
                    child: _TransformedText(
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
                  "£${MealEntity.fakeValues[widget.currentIndex!].price.toString().substring(0, 3)}",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: MealEntity.fakeValues[widget.currentIndex!].price
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

class _TransformedText extends StatelessWidget {
  const _TransformedText({
    super.key,
    required this.currentIndex,
    required this.factorChange,
    required this.beginTranslateX,
    required this.endTranslateX,
    required this.scaleBegin,
    required this.scaleEnd,
  });

  final int currentIndex;
  final double factorChange;
  final double beginTranslateX;
  final double endTranslateX;
  final double scaleBegin;
  final double scaleEnd;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(
        lerpDouble(beginTranslateX, endTranslateX, factorChange)!,
        0.0,
      ),
      child: Transform.scale(
        scale: lerpDouble(scaleBegin, scaleEnd, factorChange)!,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    MealEntity.fakeValues[currentIndex].name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    MealEntity.fakeValues[currentIndex].type,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    MealEntity.fakeValues[currentIndex].name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    MealEntity.fakeValues[currentIndex].type,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
