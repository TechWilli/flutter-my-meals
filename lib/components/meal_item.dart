import 'package:flutter/material.dart';
import 'package:flutter_my_meals/models/meal_model.dart';
import 'package:flutter_my_meals/routes/app_routes.dart';

class MealItem extends StatelessWidget {
  final MealModel meal;

  const MealItem({required this.meal, Key? key}) : super(key: key);

  Future<void> handleMealDetails(BuildContext context) async {
    /* Esse push vai para a rota de detalhes, logo quando estou na tela de detalhes e dou um pop para
    voltar aqui, posso pegar parâmetros passados da tela, isso é muito legal!! */
    final resultAfterPush = await Navigator.of(context)
        .pushNamed(AppRoutes.MEAL_DETAIL, arguments: meal);

    if (resultAfterPush != null) {
      debugPrint('>>>>> ${(resultAfterPush as MealModel).title}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.only(top: 14, bottom: 14),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: InkWell(
        splashColor: Colors.amber,
        borderRadius: BorderRadius.circular(15),
        onTap: () => handleMealDetails(context),
        child: Column(
          children: [
            Stack(
              children: [
                // para fazer um recorte nas bordas da imagem
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.network(
                    meal.imageUrl,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
                // Usado para posicionar uma child da Stack
                Positioned(
                  bottom: 10,
                  right: 0,
                  child: Container(
                    width: 200,
                    color: Colors.black54,
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      meal.title,
                      style: textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 4),
                      Text('${meal.duration}min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 5),
                      Text(meal.complexity.translate),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      Text(meal.cost.translate),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
