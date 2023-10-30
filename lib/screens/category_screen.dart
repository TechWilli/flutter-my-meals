import 'package:flutter/material.dart';

import 'package:flutter_my_meals/components/category_item.dart';
import 'package:flutter_my_meals/data/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const Padding(
          //   padding: EdgeInsets.all(14),
          //   child: Text(
          //     'Cada categoria listada abaixo agrupa suas refeições específicas. Navegue por elas e descubra novas receitas para os mais variados gostos :)',
          //   ),
          // ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: GridView(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                physics: const BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.fast),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  // se vc tiver 300 px de largura de tela, terá um só, se tiver 400, dois, e assim por diante
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 12,
                  // outra forma de definir o tamanho dos elementos filhos
                  // childAspectRatio: 3 / 2,
                  crossAxisSpacing: 12,
                  // o máximo de altura que cada elemento irá ocupar, contando com a margin se tiver
                  mainAxisExtent: 110,
                ),
                children: dummyCategories
                    .map((category) => CategoryItem(category: category))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
