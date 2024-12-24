import 'package:flutter/material.dart';

class FoodMealMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: _MenuPerspectiveScrollView(),
      ),
    );
  }
}

class _MenuPerspectiveScrollView extends StatelessWidget {
  const _MenuPerspectiveScrollView({super.key});

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
                scale: .25,
                child: Container(
                  color: Colors.transparent,
                  child: const _MealCard(
                    title: "Chicken Salad",
                    calories: "420 cal",
                    imagePath: "assets/milkshakes/shake-5.png",
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
                constraints.maxWidth * 0.2,
                0.0,
              ),
              child: Transform.scale(
                scale: .5, // Escala completa
                child: Container(
                  color: Colors.transparent,
                  child: const _MealCard(
                    title: "Chicken Salad",
                    calories: "420 cal",
                    imagePath: "assets/milkshakes/shake-3.png",
                    opacity: 1.0,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Transform.translate(
              offset: Offset(
                -(constraints.maxWidth * 0.05),
                constraints.maxHeight * 0.1,
              ),
              child: Transform.scale(
                scale: .9, // Escala completa
                child: Container(
                  color: Colors.transparent,
                  child: const _MealCard(
                    title: "Chicken Salad",
                    calories: "420 cal",
                    imagePath: "assets/milkshakes/shake-4.png",
                    opacity: 1.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}

class _MealCard extends StatelessWidget {
  const _MealCard({
    super.key,
    required this.title,
    required this.calories,
    required this.imagePath,
    required this.opacity,
  });

  final String title;
  final String calories;
  final String imagePath;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Image.asset(
        imagePath,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
