import 'package:Flavorly/core/error/failure.dart';
import 'package:Flavorly/core/usecase/use_case.dart';
import 'package:Flavorly/features/home/domain/entites/recommend_recipe_entity.dart';
import 'package:Flavorly/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

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
