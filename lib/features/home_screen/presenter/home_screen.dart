
import 'package:burguer_menu_app/features/home_screen/domain/entities/food_meal_entity.dart';
import 'package:burguer_menu_app/features/home_screen/presenter/widgets/food_menu_card.dart';
import 'package:burguer_menu_app/features/shared/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: false,
        title: const Text('Menu',
            style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              scrollDirection: Axis.vertical,
              itemCount: FoodMealEntity.fakeMealFoodValues.length,
              itemBuilder: (context, index) {
                return TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 1200 + (index * 200)),
                  builder: (context, animation, child) {
                    return Opacity(
                      opacity: animation,
                      child: Transform.translate(
                        // from the bottom of the screen to the top
                        offset: Offset(0, MediaQuery.sizeOf(context).height * (1 - animation)),
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.22,
                          child: FoodMenuCard(foodMenu: FoodMealEntity.fakeMealFoodValues[index]),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            height: MediaQuery.sizeOf(context).height * 0.1,
            width: MediaQuery.sizeOf(context).width,
            child: const CustomBottomNavigationBar(),
          ),
        ],
      ),
    );
  }

}
