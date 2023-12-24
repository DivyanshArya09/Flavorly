import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int? readyInMinutes;
  final String? sourceUrl;
  final String? image;
  final int? servings;
  final int? id;
  final String? title;

  const CategoryEntity(
      {this.readyInMinutes,
      this.sourceUrl,
      this.image,
      this.servings,
      this.id,
      this.title});

  @override
  List<Object?> get props =>
      [readyInMinutes, sourceUrl, image, servings, id, title];
}
