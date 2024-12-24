import 'package:burguer_menu_app/features/food_meal_menu/presenter/food_meal_menu_screen.dart';
import 'package:burguer_menu_app/features/home_screen/presenter/home_screen.dart';
import 'package:burguer_menu_app/features/onboarding_screen/presenter/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      title: 'Burguer menu app',
      home: FoodMealMenuScreen(),
    );
  }
}