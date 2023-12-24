import 'package:recipe_app/features/home/domain/entites/recommended_entity.dart';

class RecommendedModel extends RecommendedEntity {
  RecommendedModel({
    required super.id,
    required super.aisle,
    required super.image,
    required super.consistency,
    required super.name,
    required super.nameClean,
    required super.original,
    required super.originalName,
    required super.amount,
    required super.unit,
    required super.meta,
    required super.measures,
  });
}
