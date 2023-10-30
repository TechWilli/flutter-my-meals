import 'package:flutter/material.dart';
import 'package:flutter_my_meals/components/meal_item.dart';

import 'package:flutter_my_meals/models/category_model.dart';
import 'package:flutter_my_meals/models/meal_model.dart';

class CategoryMealsScreen extends StatelessWidget {
  final List<MealModel> meals;

  const CategoryMealsScreen({required this.meals, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // forma de pegar os argumentos passados no pushNamed quando vem pra essa rota
    final category =
        ModalRoute.of(context)?.settings.arguments as CategoryModel;

    final categoryMeals =
        meals.where((meal) => meal.categories.contains(category.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Refeições'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: categoryMeals.length,
                  itemBuilder: (_, index) {
                    final MealModel meal = categoryMeals[index];
                    return MealItem(meal: meal);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
