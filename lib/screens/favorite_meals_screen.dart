import 'package:flutter/material.dart';
import 'package:flutter_my_meals/components/meal_item.dart';
import 'package:flutter_my_meals/models/meal_model.dart';

class FavoriteMealsScreen extends StatefulWidget {
  final List<MealModel> favoriteMeals;

  const FavoriteMealsScreen({required this.favoriteMeals, Key? key})
      : super(key: key);

  @override
  State<FavoriteMealsScreen> createState() => _FavoriteMealsScreenState();
}

class _FavoriteMealsScreenState extends State<FavoriteMealsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.favoriteMeals.isEmpty
          ? const Center(
              child: Text(
                'Não há refeições favoritas a serem exibidas.',
                textAlign: TextAlign.center,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: widget.favoriteMeals.length,
                      itemBuilder: (_, index) {
                        final meal = widget.favoriteMeals[index];

                        return MealItem(meal: meal);
                      },
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
