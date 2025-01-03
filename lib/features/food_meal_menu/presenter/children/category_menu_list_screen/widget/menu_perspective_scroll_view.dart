import 'dart:ui';

import 'package:burguer_menu_app/features/food_meal_menu/presenter/children/category_menu_list_screen/widget/meal_card.dart';
import 'package:flutter/material.dart';

class MenuPerspectiveScrollView extends StatelessWidget {
  const MenuPerspectiveScrollView({
    super.key,
    required this.currentPage,
    required this.factorChange,
    required this.itemsLength,
  });

  final int currentPage;
  final double factorChange;
  final int itemsLength;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Transform.translate(
              offset: Offset(
                constraints.maxWidth * 0.35,
                -(constraints.maxHeight * 0.1),
              ),
              child: Transform.scale(
                scale: lerpDouble(.25, 0.0, factorChange),
                child: Container(
                  color: Colors.transparent,
                  child: MealCard(
                    index: currentPage - 2,
                    imagePath: "assets/milkshakes/shake-${(currentPage - 2) % 7}.png",
                    opacity: 1.0,
                  ),
                ),
              ),
            ),
          ),
          // Segunda tarjeta (mediana)
          Positioned.fill(
            child: Transform.translate(
              offset: Offset(
                lerpDouble(constraints.maxWidth * 0.2,
                    constraints.maxWidth * 0.35, factorChange)!,
                lerpDouble(0.0, -(constraints.maxHeight * 0.1), factorChange)!,
              ),
              child: Transform.scale(
                scale: lerpDouble(.5, .25, factorChange), // Escala completa
                child: Container(
                  color: Colors.transparent,
                  child: MealCard(
                    index: currentPage - 1,
                    imagePath: "assets/milkshakes/shake-${(currentPage - 1) % 7}.png",
                    opacity: 1.0,
                  ),
                ),
              ),
            ),
          ),
          // Tercera tarjeta (grande)
          Positioned.fill(
            child: Hero(
              tag: 'meal-card-$currentPage',
              child: Transform.translate(
                offset: Offset(
                  lerpDouble(-(constraints.maxWidth * 0.05),
                      constraints.maxWidth * 0.2, factorChange)!,
                  lerpDouble(constraints.maxHeight * 0.1, 0.0, factorChange)!,
                ),
                child: Transform.scale(
                  scale: lerpDouble(.9, .5, factorChange),
                  child: Container(
                    color: Colors.transparent,
                    child: MealCard(
                      index: currentPage,
                      imagePath: "assets/milkshakes/shake-${currentPage % 7}.png",
                      opacity: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
