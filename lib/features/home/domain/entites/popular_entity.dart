import 'package:equatable/equatable.dart';

class NutrientRecipeEntity extends Equatable {
  final int? calories;
  final String? carbs;
  final String? fat;
  final int? id;
  final String? image;
  final String? imageType;
  final String? protein;
  final String? title;

  const NutrientRecipeEntity(
      {this.calories,
      this.carbs,
      this.fat,
      this.id,
      this.image,
      this.imageType,
      this.protein,
      this.title});

  @override
  List<Object?> get props =>
      [calories, carbs, fat, id, image, imageType, protein, title];

  // NutrientRecipe.fromJson(Map<String, dynamic> json) {
  //   calories = json['calories'];
  //   carbs = json['carbs'];
  //   fat = json['fat'];
  //   id = json['id'];
  //   image = json['image'];
  //   imageType = json['imageType'];
  //   protein = json['protein'];
  //   title = json['title'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['calories'] = calories;
  //   data['carbs'] = carbs;
  //   data['fat'] = fat;
  //   data['id'] = id;
  //   data['image'] = image;
  //   data['imageType'] = imageType;
  //   data['protein'] = protein;
  //   data['title'] = title;
  //   return data;
  // }
}
