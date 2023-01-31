import 'dart:convert';

import 'package:chapter_5/models/models.dart';
import 'package:flutter/services.dart';

class MockFooderlichService {
  Future<ExploreData> getExploreData() async {
    final todayRecipes = await _getTodayRecipes();
    final friendPosts = await _getFriendPosts();

    ExploreData data = ExploreData(todayRecipes, friendPosts);
    return data;
  }

  Future<List<ExploreRecipe>> _getTodayRecipes() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    final dataString =
        await _loadAssets("assets/sample_data/sample_explore_recipes.json");

    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['recipes'] != null) {
      final recipes = <ExploreRecipe>[];
      json["recipes"].forEach((recipe) {
        recipes.add(ExploreRecipe.fromJson(recipe));
      });
      return recipes;
    } else {
      return [];
    }
    ;
  }

  Future<List<Post>> _getFriendPosts() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    final dataString =
        await _loadAssets("assets/sample_data/sample_friends_feed.json");

    final Map<String, dynamic> json = jsonDecode(dataString);
    if (json["feeds"] != null) {
      final feeds = <Post>[];
      json["feeds"].forEach((feed) {
        feeds.add(Post.fromJson(feed));
      });
      return feeds;
    } else {
      return [];
    }
  }

  Future<List<SimpleRecipe>> getRecipies() async {
    await Future.delayed(const Duration(milliseconds: 2000));

    final dataString =
        await _loadAssets("assets/sample_data/sample_recipies.json");

    // After getting response from server in json you need to change
    // it into the required object format for consumption within your application

    final Map<String, dynamic> json = jsonDecode(dataString);
    if (json["recipes"] != null) {
      final recipeList = <SimpleRecipe>[];
      json["recipes"].forEach((recipe) {
        recipeList.add(SimpleRecipe.fromJson(recipe));
      });
      return recipeList;
    } else {
      return [];
    }
  }

  Future<String> _loadAssets(String path) async => rootBundle.loadString(path);
}
