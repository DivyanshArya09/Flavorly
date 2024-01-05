import 'package:recipe_app/config/constants/nutrients_constants/nutrient_model.dart';
import 'package:recipe_app/features/home/data/models/category_model.dart';
import 'package:recipe_app/features/home/data/models/menu_recipe_model.dart';
import 'package:recipe_app/features/home/data/models/nutrient_recipe_model.dart';
import 'package:recipe_app/features/home/data/models/random_recipe_model.dart';
import 'package:recipe_app/features/home/data/models/recipe_detail_model.dart';
import 'package:recipe_app/features/home/data/models/recommended_item_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryModel>> getCategoriesOfRecipes(String category);

  Future<List<RecommendedRecipeModel>> getRecommendedRecipes(int id);

  Future<List<RandomRecipeModel>> getRandomRecipes(int number);

  Future<List<NutrientRecipeModel>> getNutrientRecipes(
      List<NutrientModel> nutrients);

  Future<List<MenuRecipeModel>> getMenuRecipes(String menuItem, int number);
  Future<RecipeDetailModel> getRecipeDetails(int id);
}
