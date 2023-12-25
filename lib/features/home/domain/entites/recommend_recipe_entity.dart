import 'package:equatable/equatable.dart';

class RecommendRecipeEntity extends Equatable {
  final int? id;
  final String? imageType;
  final String? title;
  final int? readyInMinutes;
  final int? servings;
  final String? sourceUrl;

  const RecommendRecipeEntity(
      {this.id,
      this.imageType,
      this.title,
      this.readyInMinutes,
      this.servings,
      this.sourceUrl});

  @override
  List<Object?> get props =>
      [id, imageType, title, readyInMinutes, servings, sourceUrl];
}
