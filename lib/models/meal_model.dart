enum Cost {
  cheap,
  fair,
  expensive,
}

enum Complexity {
  simple,
  medium,
  difficult,
}

extension CostTranslation on Cost {
  String get translate {
    switch (this) {
      case Cost.cheap:
        return 'Barato';
      case Cost.fair:
        return 'Justo';
      case Cost.expensive:
        return 'Caro';
      default:
        return 'Não identificado';
    }
  }
}

extension ComplexityTranslation on Complexity {
  String get translate {
    switch (this) {
      case Complexity.simple:
        return 'Simples';
      case Complexity.medium:
        return 'Média';
      case Complexity.difficult:
        return 'Difícil';
      default:
        return 'Não identificado';
    }
  }
}

class MealModel {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Cost cost;
  final Complexity complexity;

  const MealModel({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.cost,
    required this.complexity,
  });
}
