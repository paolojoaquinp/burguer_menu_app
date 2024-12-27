import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  const MealCard({
    super.key,
    required this.imagePath,
    required this.opacity,
    required this.index,
  });

  final String imagePath;
  final double opacity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              imagePath,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned.fill(child: Text(index.toString(), style: Theme.of(context).textTheme.headlineLarge,)),
        ],
      ),
    );
  }
}
