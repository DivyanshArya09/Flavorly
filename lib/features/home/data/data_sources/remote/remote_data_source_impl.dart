import 'package:dio/dio.dart';
import 'package:recipe_app/config/constants/api_constants/constants.dart';
import 'package:recipe_app/config/constants/nutrients_constants/nutrient_model.dart';
import 'package:recipe_app/core/error/exception.dart';
import 'package:recipe_app/features/home/data/data_sources/remote/remote_data_source.dart';
import 'package:recipe_app/features/home/data/models/category_model.dart';
import 'package:recipe_app/features/home/data/models/menu_recipe_model.dart';
import 'package:recipe_app/features/home/data/models/nutrient_recipe_model.dart';
import 'package:recipe_app/features/home/data/models/random_recipe_model.dart';
import 'package:recipe_app/features/home/data/models/recipe_detail_model.dart';
import 'package:recipe_app/features/home/data/models/recommended_item_model.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;

  HomeRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CategoryModel>> getCategoriesOfRecipes(String category) async {
    var response = await dio.get(ApiUrls.getCategoriesRecipeUrl(category, 10));
    if (response.statusCode == 200) {
      var data = response.data;
      return (data['results'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
    } else {
      // print('--------------------------------Failed to load data');
      throw ServerException(message: 'Failed to load data');
    }
  }

  @override
  Future<List<NutrientRecipeModel>> getNutrientRecipes(
      List<NutrientModel> nutrient) async {
    var response = await dio.get(
      ApiUrls.getRecipeByNutrientsUrl(nutrient),
    );
    if (response.statusCode == 200) {
      var data = response.data;
      return (data as List)
          .map((e) => NutrientRecipeModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(message: 'Failed to load data');
    }
  }

  @override
  Future<List<RandomRecipeModel>> getRandomRecipes(int number) async {
    var response = await dio.get(
      ApiUrls.getRandomRecipesUrl(number),
    );
    if (response.statusCode == 200) {
      var data = response.data;
      return (data['recipes'] as List)
          .map((e) => RandomRecipeModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(message: 'Failed to load data');
    }
  }

  @override
  Future<List<RecommendedRecipeModel>> getRecommendedRecipes(int id) async {
    var response = await dio.get(
      ApiUrls.getRecommendedRecipesUrl(id),
    );
    if (response.statusCode == 200) {
      var data = response.data;
      return (data as List)
          .map((e) => RecommendedRecipeModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(message: 'Failed to load data');
    }
  }

  @override
  Future<List<MenuRecipeModel>> getMenuRecipes(
      String menuItem, int number) async {
    var response = await Dio().get(
      ApiUrls.getMenuRecipesUrl(menuItem, number),
    );

    if (response.statusCode == 200) {
      var data = response.data;
      return (data['menuItems'] as List)
          .map((e) => MenuRecipeModel.fromJson(e))
          .toList();
    } else {
      print('--------------------------------Failed to load data');
      throw ServerException(message: 'Failed to load data');
    }
  }

  @override
  Future<RecipeDetailModel> getRecipeDetails(int id) async {
    var response = await Dio().get(ApiUrls.getRecipesDetailUrl(id));

    if (response.statusCode == 200) {
      var data = response.data;
      return RecipeDetailModel.fromJson(data);
    } else {
      print('--------------------------------Failed to load data');
      throw ServerException(message: 'Failed to load data');
    }
  }
}
