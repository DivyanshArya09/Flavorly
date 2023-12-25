import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/core/usecase/use_case.dart';
import 'package:recipe_app/features/home/domain/entites/recommend_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/entites/random_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/repositories/home_repository.dart';

class GetRecommendedItemUseCase
    implements UseCase<List<RecommendRecipeEntity>, RecommendedRecipeParams> {
  final HomeRepository homeRepository;

  GetRecommendedItemUseCase({required this.homeRepository});

  @override
  Future<Either<Failure, List<RecommendRecipeEntity>>> call(
      RecommendedRecipeParams params) {
    return homeRepository.getRecommendedRecipes(params.id);
  }
}

class RecommendedRecipeParams extends Equatable {
  const RecommendedRecipeParams({required this.id});
  final int id;
  @override
  List<Object?> get props => [];
}
