import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/features/home/domain/entites/category_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/entites/Nutrients_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/entites/menu_recipe_entiry.dart';
import 'package:recipe_app/features/home/domain/entites/recipe_detail_entity.dart';
import 'package:recipe_app/features/home/domain/entites/recommend_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/entites/random_recipe_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategoriesOfRecipes(
      String cuisine);

  Future<Either<Failure, List<RecommendRecipeEntity>>> getRecommendedRecipes(
      int id);

  Future<Either<Failure, List<NutrientRecipeEntity>>> getRecipesByNutrients(
      List<String> nutrients, int concentration);

  Future<Either<Failure, List<RandomRecipeEntity>>> getRandomRecipes(
      int number);
  Future<Either<Failure, List<MenuRecipeEntity>>> getMenuItems(
      String menuItem, int number);

  Future<Either<Failure, RecipeDetailEntity>> getRecipeDetail(int id);
}
