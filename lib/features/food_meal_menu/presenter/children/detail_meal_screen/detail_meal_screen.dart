import 'package:flutter/material.dart';

class DetailMealScreen extends StatelessWidget {
  const DetailMealScreen({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}
