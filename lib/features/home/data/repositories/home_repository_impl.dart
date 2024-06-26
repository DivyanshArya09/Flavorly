import 'dart:io';

import 'package:Flavorly/config/constants/nutrients_constants/nutrient_model.dart';
import 'package:Flavorly/core/error/exception.dart';
import 'package:Flavorly/core/error/failure.dart';
import 'package:Flavorly/core/network/network_info.dart';
import 'package:Flavorly/features/home/data/data_sources/remote/remote_data_source.dart';
import 'package:Flavorly/features/home/domain/entites/Nutrients_recipe_entity.dart';
import 'package:Flavorly/features/home/domain/entites/category_recipe_entity.dart';
import 'package:Flavorly/features/home/domain/entites/menu_recipe_entiry.dart';
import 'package:Flavorly/features/home/domain/entites/random_recipe_entity.dart';
import 'package:Flavorly/features/home/domain/entites/recipe_detail_entity.dart';
import 'package:Flavorly/features/home/domain/entites/recommend_recipe_entity.dart';
import 'package:Flavorly/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

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
    } on SocketException catch (e) {
      return Left(ConnectionFailure(e.toString()));
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
      List<NutrientModel> nutrients) async {
    if (!await networkInfo.isConnected) {
      return Left(ConnectionFailure('No internet connection'));
    }
    try {
      var result = await homeRemoteDataSource.getNutrientRecipes(nutrients);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(SeverFailure(e.toString()));
    } catch (e) {
      return Left(SeverFailure(e.toString()));
    }
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

  @override
  Future<Either<Failure, List<MenuRecipeEntity>>> getMenuItems(
      String menuItem, int number) async {
    if (!await networkInfo.isConnected) {
      return Left(ConnectionFailure('No internet connection'));
    }
    try {
      var result = await homeRemoteDataSource.getMenuRecipes(menuItem, number);
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(SeverFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RecipeDetailEntity>> getRecipeDetail(int id) async {
    if (!await networkInfo.isConnected) {
      return Left(ConnectionFailure('No internet connection'));
    }
    try {
      var result = await homeRemoteDataSource.getRecipeDetails(id);
      return Right(result.toEntity());
    } catch (e) {
      return Left(SeverFailure(e.toString()));
    }
  }
}
