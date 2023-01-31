part of 'explore_recipe.dart';

class Instructions {
  String imageUrl;
  String description;
  int durationInMins;

  Instructions(
      {required this.imageUrl,
      required this.description,
      required this.durationInMins});

  factory Instructions.fromJson(Map<String, dynamic> json) {
    return Instructions(
        imageUrl: json["imageUrl"] ?? '',
        description: json["description"] ?? '',
        durationInMins: json["durationInMins"] ?? '');
  }
}
