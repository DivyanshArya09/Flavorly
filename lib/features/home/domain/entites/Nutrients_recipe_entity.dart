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

  //
}
