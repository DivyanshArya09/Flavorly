import 'package:Flavorly/config/constants/nutrients_constants/nutrient_model.dart';
import 'package:Flavorly/core/error/failure.dart';
import 'package:Flavorly/core/usecase/use_case.dart';
import 'package:Flavorly/features/home/domain/entites/Nutrients_recipe_entity.dart';
import 'package:Flavorly/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRecipesByNutrientsUseCase
    implements UseCase<List<NutrientRecipeEntity>, NutrientsParams> {
  final HomeRepository homeRepository;

  const GetRecipesByNutrientsUseCase({
    required this.homeRepository,
  });

  @override
  Future<Either<Failure, List<NutrientRecipeEntity>>> call(
      NutrientsParams params) async {
    return await homeRepository.getRecipesByNutrients(params.nutrients);
  }
}

class NutrientsParams extends Equatable {
  final List<NutrientModel> nutrients;

  const NutrientsParams({required this.nutrients});

  @override
  List<Object?> get props => [nutrients];
}
