import 'package:burguer_menu_app/features/home_screen/domain/entities/food_meal_entity.dart';
import 'package:flutter/material.dart';

class FoodMenuCard extends StatelessWidget {
  const FoodMenuCard({
    super.key,
    required this.foodMenu,
  });

  final FoodMealEntity foodMenu;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              // Background
              Positioned(
                bottom: 0,
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.7,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 9,
                      )
                    ],
                  ),
                ),
              ),
              // INformation
              Positioned.fill(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Image.asset(
                        foodMenu.imageUrl,
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.center,
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: constraints.maxHeight * 0.3,
                            ),
                            Text(
                              foodMenu.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(foodMenu.description),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Positioned.fill(
                child: Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
