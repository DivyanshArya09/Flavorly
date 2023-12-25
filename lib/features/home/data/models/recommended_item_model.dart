import 'package:recipe_app/features/home/domain/entites/recommend_recipe_entity.dart';

class RecommendedRecipeModel extends RecommendRecipeEntity {
  RecommendedRecipeModel({
    required super.id,
    required super.title,
    required super.imageType,
    required super.readyInMinutes,
    required super.sourceUrl,
    required super.servings,
  });

  factory RecommendedRecipeModel.fromJson(Map<String, dynamic> json) {
    return RecommendedRecipeModel(
      id: json['id'],
      title: json['title'],
      imageType: json['imageType'],
      readyInMinutes: json['readyInMinutes'],
      sourceUrl: json['sourceUrl'],
      servings: json['servings'],
    );
  }
}
