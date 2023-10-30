import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_my_meals/data/dummy_data.dart';
import 'package:flutter_my_meals/models/meal_model.dart';
import 'package:flutter_my_meals/models/settings_model.dart';
import 'package:flutter_my_meals/routes/app_routes.dart';
import 'package:flutter_my_meals/screens/category_meals_screen.dart';
import 'package:flutter_my_meals/screens/meal_detail_screen.dart';
import 'package:flutter_my_meals/screens/settings_screen.dart';
import 'package:flutter_my_meals/screens/tabs_navigation_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<MealModel> _favoriteMeals = [];

  List<MealModel> _availableMeals = dummyMeals;
  SettingsModel _settings = SettingsModel();

  void _filterMeals(SettingsModel settings) {
    setState(() {
      _settings = settings;
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _onToggleFavorite(MealModel meal) {
    setState(() {
      !_favoriteMeals.contains(meal)
          ? _favoriteMeals.add(meal)
          : _favoriteMeals.remove(meal);
    });
  }

  bool _isFavoriteMeal(MealModel meal) => _favoriteMeals.contains(meal);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    final theme = ThemeData(
      scaffoldBackgroundColor: Colors.yellow.shade50,
      fontFamily: 'Nunito',
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            toolbarHeight: 45,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Nunito',
                color: Colors.black)
            // backgroundColor: Colors.white,
            ),
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.orange.shade100,
          secondary: Colors.red.shade400,
        ),
        canvasColor: Colors.yellow.shade50, // cor de fundo do material app
        textTheme: theme.textTheme.copyWith(
          titleSmall: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 12,
            color: Colors.black,
          ),
          bodyMedium: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 14,
            color: Colors.black,
          ),
          bodyLarge: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      initialRoute: AppRoutes.HOME,
      routes: {
        AppRoutes.HOME: (_) =>
            TabsNavigationScreen(favoriteMeals: _favoriteMeals),
        AppRoutes.CATEGORY_MEALS: (_) =>
            CategoryMealsScreen(meals: _availableMeals),
        AppRoutes.MEAL_DETAIL: (_) => MealDetailScreen(
            isFavoriteMeal: _isFavoriteMeal,
            onToggleFavorite: _onToggleFavorite),
        AppRoutes.SETTINGS: (_) => SettingsScreen(
            settings: _settings, onSettingsChanged: _filterMeals),
      },
    );
  }
}
