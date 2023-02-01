import 'package:chapter_5/api/mock_api_service.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../components/components.dart';

class RecipesScreen extends StatelessWidget {
  final exploreService = MockFooderlichService();
  RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: exploreService.getRecipies(),
        builder:
            (BuildContext context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (!snapshot.hasError) {
              return RecipeGridView(recipes: snapshot.data ?? []);
            } else {
              return Text(snapshot.error.toString());
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
