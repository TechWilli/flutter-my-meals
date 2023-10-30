import 'package:flutter/material.dart';
import 'package:flutter_my_meals/components/main_drawer.dart';
import 'package:flutter_my_meals/models/meal_model.dart';

import 'package:flutter_my_meals/screens/category_screen.dart';
import 'package:flutter_my_meals/screens/favorite_meals_screen.dart';

class TabsNavigationScreen extends StatefulWidget {
  final List<MealModel> favoriteMeals;

  const TabsNavigationScreen({required this.favoriteMeals, Key? key})
      : super(key: key);

  @override
  State<TabsNavigationScreen> createState() => _TabsNavigationScreenState();
}

class _TabsNavigationScreenState extends State<TabsNavigationScreen> {
  int _activeScreenIndex = 0;

  late final List<Map<String, Object>> _screens;

  void _handleSelectTabScreen(int value) {
    setState(() => _activeScreenIndex = value);
  }

  @override
  void initState() {
    _screens = [
      {
        'title': 'Lista de Categorias',
        'screen': const CategoryScreen(),
      },
      {
        'title': 'Favoritos',
        'screen': FavoriteMealsScreen(favoriteMeals: widget.favoriteMeals),
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_activeScreenIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: _screens[_activeScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeScreenIndex,
        onTap: _handleSelectTabScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 2,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        selectedFontSize: 12,
        unselectedItemColor: Colors.black54,
        unselectedFontSize: 12,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        iconSize: 18,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categorias'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favoritos'),
        ],
      ),
    );
  }
}
