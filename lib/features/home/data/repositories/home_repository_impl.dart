import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/core/network/network_info.dart';
import 'package:recipe_app/features/home/data/data_sources/remote/remote_data_source.dart';
import 'package:recipe_app/features/home/domain/entites/Nutrients_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/entites/category_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/entites/random_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/entites/recommend_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;
  NetworkInfo networkInfo;
  HomeRepositoryImpl(
      {required this.homeRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategoriesOfRecipes(
      String cuisine) async {
    if (!await networkInfo.isConnected) {
      return Left(ConnectionFailure('No internet connection'));
    }
    try {
      final result = await homeRemoteDataSource.getCategoriesOfRecipes(cuisine);
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(SeverFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RandomRecipeEntity>>> getRandomRecipes(
      int number) async {
    if (!await networkInfo.isConnected) {
      return Left(ConnectionFailure('No internet connection'));
    }
    try {
      final result = await homeRemoteDataSource.getRandomRecipes(number);
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(SeverFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NutrientRecipeEntity>>> getRecipesByNutrients(
      String nutrient) {
    // TODO: implement getRecipesByNutrients
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<RecommendRecipeEntity>>> getRecommendedRecipes(
      int id) async {
    if (!await networkInfo.isConnected) {
      return Left(ConnectionFailure('No internet connection'));
    }
    try {
      var result = await homeRemoteDataSource.getRecommendedRecipes(id);
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(SeverFailure(e.toString()));
    }
  }
}