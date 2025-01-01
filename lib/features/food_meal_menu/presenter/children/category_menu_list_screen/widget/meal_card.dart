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
      child: Image.asset(
        imagePath,
        fit: BoxFit.fitWidth,
        alignment: Alignment.topCenter,
      ),
    );
  }
}
