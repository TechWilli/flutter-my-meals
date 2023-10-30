import 'package:flutter/material.dart';

import 'package:flutter_my_meals/models/category_model.dart';
import 'package:flutter_my_meals/routes/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);

  void _selectCategory(BuildContext context) {
    // forma de navegar sem definir rotas, chamando direto a pagina desejada
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (_) => const CategoryMealsScreen()),
    // );

    // navegando através de rotas nomeadas, definidas no MaterialApp, assim é mais organizado
    Navigator.of(context)
        .pushNamed(AppRoutes.CATEGORY_MEALS, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashFactory: InkSparkle.splashFactory,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.3),
              category.color.withOpacity(0.6)
            ],
          ),
          border: Border.all(
            // color: category.color,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          category.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
