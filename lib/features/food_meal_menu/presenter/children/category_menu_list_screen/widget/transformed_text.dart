import 'dart:ui';

import 'package:burguer_menu_app/features/food_meal_menu/domain/entities/meal_entity.dart';
import 'package:flutter/material.dart';

class TransformedText extends StatelessWidget {
  const TransformedText({
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
