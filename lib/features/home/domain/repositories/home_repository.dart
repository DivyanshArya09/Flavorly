import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/features/home/domain/entites/category_entity.dart';
import 'package:recipe_app/features/home/domain/entites/popular_entity.dart';
import 'package:recipe_app/features/home/domain/entites/recommended_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories(String cuisine);

  Future<Either<Failure, List<RecommendedEntity>>> getRecommendation();

  Future<Either<Failure, List<PopularEntity>>> getPopular(String cuisine);

  Future<Either<Failure, List<RecommendedEntity>>> getRandom();
}
