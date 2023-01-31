import 'package:chapter_5/api/mock_api_service.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();
  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Add TodayRecipeListView FutureBuilder
    return const Center(
      child: Text("Explore Screen"),
    );
  }
}
