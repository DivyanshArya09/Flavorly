import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/core/usecase/use_case.dart';
import 'package:recipe_app/features/home/domain/entites/recipe_detail_entity.dart';
import 'package:recipe_app/features/home/domain/repositories/home_repository.dart';

class GetRecipeDetailUseCase
    implements UseCase<RecipeDetailEntity, RecipeDetailParams> {
  final HomeRepository repository;

  const GetRecipeDetailUseCase({required this.repository});

  @override
  Future<Either<Failure, RecipeDetailEntity>> call(RecipeDetailParams params) {
    return repository.getRecipeDetail(params.id);
  }
}

class RecipeDetailParams extends Equatable {
  final int id;
  const RecipeDetailParams({required this.id});
  @override
  List<Object?> get props => [];
}
