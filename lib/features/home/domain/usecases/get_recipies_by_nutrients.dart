import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/core/usecase/use_case.dart';
import 'package:recipe_app/features/home/domain/entites/Nutrients_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/repositories/home_repository.dart';

class GetRecipesByNutrientsUseCase
    implements UseCase<List<NutrientRecipeEntity>, NutrientsParams> {
  final HomeRepository homeRepository;

  const GetRecipesByNutrientsUseCase({
    required this.homeRepository,
  });

  @override
  Future<Either<Failure, List<NutrientRecipeEntity>>> call(
      NutrientsParams params) async {
    return await homeRepository.getRecipesByNutrients(
        params.nutrients, params.concentration);
  }
}

class NutrientsParams extends Equatable {
  final List<String> nutrients;
  final int concentration;

  const NutrientsParams({required this.nutrients, required this.concentration});

  @override
  List<Object?> get props => [nutrients];
}
