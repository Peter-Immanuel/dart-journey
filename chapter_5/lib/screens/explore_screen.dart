import '../api/mock_api_service.dart';
import '../components/components.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();
  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Add TodayRecipeListView FutureBuilder
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        // TODO Add Nested List Views

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final recipes = snapshot.data?.todayRecipes ?? [];
            return TodayRecipeListView(recipes: recipes);
          } else if (snapshot.hasError) {
            return Center(
              child: Text('$snapshot.error'),
            );
          } else {
            return Center(
              child: Text("We just couldn't get data"),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
