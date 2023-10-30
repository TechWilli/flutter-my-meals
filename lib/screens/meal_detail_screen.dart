import 'package:flutter/material.dart';
import 'package:flutter_my_meals/models/meal_model.dart';

class MealDetailScreen extends StatelessWidget {
  final void Function(MealModel) onToggleFavorite;
  final bool Function(MealModel) isFavoriteMeal;

  const MealDetailScreen(
      {required this.onToggleFavorite, required this.isFavoriteMeal, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    // forma de pegar os argumentos passados no pushNamed quando vem pra essa rota
    final meal = ModalRoute.of(context)?.settings.arguments as MealModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Receita'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              // margin: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: Image.network(
                          meal.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                // Colors.black,
                                Colors.transparent,
                                Colors.transparent,
                                Theme.of(context).scaffoldBackgroundColor,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          height: 250,
                          // width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 14),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.restaurant,
                          size: 25,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          meal.title,
                          style: textTheme.titleSmall,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${meal.duration}min - ',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Text('${meal.complexity.translate} - ',
                                style: const TextStyle(color: Colors.grey)),
                            Text(meal.cost.translate,
                                style: const TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(14),
                          decoration: const BoxDecoration(),
                          child: Column(
                            children: [
                              Text(
                                'INGREDIENTES',
                                style: textTheme.titleSmall,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              /* para adicionar elevation o Container, usar o material, caso o
                              container tenha bordas, precisa definir a borda no material tbm,
                              só funciona bem quando o container filho tem cor fixa, enão degrade ou algo do tipo */
                              Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.amber.shade200,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: meal.ingredients
                                        .map(
                                          (ingredient) => Container(
                                            margin: const EdgeInsets.all(8),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 12),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 2,
                                              ),
                                            ),
                                            child: Text(
                                              ingredient,
                                              style: textTheme.bodyMedium,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(14),
                          decoration: const BoxDecoration(),
                          child: Column(
                            children: [
                              Text(
                                'PASSO A PASSO',
                                style: textTheme.titleSmall,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                  ),
                                  child: Column(
                                    children: meal.steps
                                        .map((step) => ListTile(
                                              leading: SizedBox(
                                                width: 30,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.amber,
                                                  foregroundColor: Colors.white,
                                                  child: Text(
                                                      '${meal.steps.indexOf(step) + 1}'),
                                                ),
                                              ),
                                              title: Text(
                                                step,
                                                style: textTheme.bodyMedium,
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).pop(meal);
          onToggleFavorite(meal);
        },
        child: Icon(isFavoriteMeal(meal) ? Icons.star : Icons.star_border),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}
