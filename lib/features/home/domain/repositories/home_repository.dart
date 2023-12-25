import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/features/home/domain/entites/category_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/entites/Nutrients_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/entites/recommend_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/entites/random_recipe_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategoriesOfRecipes(
      String cuisine);

  Future<Either<Failure, List<RecommendRecipeEntity>>> getRecommendedRecipes();

  Future<Either<Failure, List<NutrientRecipeEntity>>> getRecipesByNutrients(
      String nutrient);

  Future<Either<Failure, List<RandomRecipeEntity>>> getRandomRecipes();
}
