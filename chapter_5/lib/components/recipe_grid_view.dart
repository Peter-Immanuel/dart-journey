import 'package:flutter/material.dart';

import '../models/models.dart';
import '../components/components.dart';

class RecipeGridView extends StatelessWidget {
  final List<SimpleRecipe> recipes;
  RecipeGridView({Key? key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0, right: 16, left: 16),
      child: GridView.builder(
          itemCount: recipes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: ((context, index) {
            final recipe = recipes[index];
            return RecipeThumnail(recipe: recipe);
          })),
    );
  }
}
