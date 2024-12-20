import 'package:burguer_menu_app/features/onboarding_screen/presenter/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      title: 'Material App',
      home: OnboardingScreen(),
    );
  }
}