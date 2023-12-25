import 'package:dio/dio.dart';
import 'package:recipe_app/config/constants/api_key.dart';
import 'package:recipe_app/features/home/data/data_sources/remote/remote_data_source.dart';
import 'package:recipe_app/features/home/data/models/category_model.dart';
import 'package:recipe_app/features/home/data/models/nutrient_recipe_model.dart';
import 'package:recipe_app/features/home/data/models/random_recipe_model.dart';
import 'package:recipe_app/features/home/data/models/recommended_item_model.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<List<CategoryModel>> getCategoriesOfRecipes(String category) async {
    var response = await dio.get(
        '$baseUrl/recipes/search?apiKey=$apiKey&number=10&cuisine=$category');
    var data = response.data;

    if (response.statusCode == 200) {
      return (data['results'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<List<NutrientRecipeModel>> getNutrientRecipes(
      List<String> nutrient, int concentration) async {
    String query = '';
    for (var element in nutrient) {
      query += '&$element=$concentration';
    }
    query = query.replaceAll(
      ',',
      '',
    );

    var response = await dio.get(
      '$baseUrl/recipes/findByNutrients?apiKey=$apiKey$query',
    );
    var data = response.data;
    if (response.statusCode == 200) {
      return (data as List)
          .map((e) => NutrientRecipeModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<List<RandomRecipeModel>> getRandomRecipes(int number) async {
    var response = await dio.get(
      '$baseUrl/recipes/random?apiKey=$apiKey&number=$number',
    );
    var data = response.data;
    if (response.statusCode == 200) {
      return (data['recipes'] as List)
          .map((e) => RandomRecipeModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<List<RecommendedRecipeModel>> getRecommendedRecipes(int id) async {
    var response = await dio.get(
      '$baseUrl/recipes/$id/similar?apiKey=$apiKey',
    );
    var data = response.data;

    if (response.statusCode == 200) {
      return data.map((e) => RecommendedRecipeModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
