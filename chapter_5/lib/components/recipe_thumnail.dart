import 'package:flutter/material.dart';

import '../models/models.dart';

class RecipeThumnail extends StatelessWidget {
  final SimpleRecipe recipe;

  RecipeThumnail({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              recipe.dishImage,
              fit: BoxFit.cover,
            ),
          )),
          const SizedBox(
            height: 10,
          ),
          Text(
            recipe.title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            recipe.duration,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
