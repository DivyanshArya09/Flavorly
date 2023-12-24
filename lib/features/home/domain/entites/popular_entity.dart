import 'package:equatable/equatable.dart';

class PopularEntity extends Equatable {
  final String? readyInMinutes;
  final String? sourceUrl;
  final String? image;
  final int? servings;
  final int? id;
  final String? title;

  const PopularEntity(
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
