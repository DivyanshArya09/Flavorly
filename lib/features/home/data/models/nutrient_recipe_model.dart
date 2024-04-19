import 'package:Flavorly/features/home/domain/entites/Nutrients_recipe_entity.dart';

class NutrientRecipeModel extends NutrientRecipeEntity {
  const NutrientRecipeModel({
    required super.id,
    required super.image,
    required super.fat,
    required super.title,
    required super.imageType,
    required super.protein,
    required super.calories,
    required super.carbs,
  });

  factory NutrientRecipeModel.fromJson(Map<String, dynamic> json) {
    return NutrientRecipeModel(
      id: json['id'],
      image: json['image'] ?? '',
      fat: json['fat'],
      title: json['title'],
      imageType: json['imageType'],
      protein: json['protein'],
      calories: json['calories'],
      carbs: json['carbs'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['calories'] = calories;
    data['carbs'] = carbs;
    data['fat'] = fat;
    data['id'] = id;
    data['image'] = image;
    data['imageType'] = imageType;
    data['protein'] = protein;
    data['title'] = title;
    return data;
  }

  NutrientRecipeEntity toEntity() {
    return NutrientRecipeEntity(
      id: id,
      image: image,
      fat: fat,
      title: title,
      imageType: imageType,
      protein: protein,
      calories: calories,
      carbs: carbs,
    );
  }
}
