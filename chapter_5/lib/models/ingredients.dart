part of 'explore_recipe.dart';

class Ingredients {
  String image;
  String title;
  String source;

  Ingredients({required this.image, required this.title, required this.source});

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return Ingredients(
        image: json["image"] ?? '',
        title: json["title"] ?? '',
        source: json["source"] ?? '');
  }
}
