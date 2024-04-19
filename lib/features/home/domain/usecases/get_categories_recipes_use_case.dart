import 'package:Flavorly/core/error/failure.dart';
import 'package:Flavorly/core/usecase/use_case.dart';
import 'package:Flavorly/features/home/domain/entites/category_recipe_entity.dart';
import 'package:Flavorly/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetCategoriesRecipesUseCase
    implements UseCase<List<CategoryEntity>, CategoriesParams> {
  final HomeRepository homeRepository;

  const GetCategoriesRecipesUseCase({required this.homeRepository});

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(CategoriesParams params) {
    return homeRepository.getCategoriesOfRecipes(params.category);
  }
}

class CategoriesParams extends Equatable {
  final String category;

  const CategoriesParams({required this.category});

  @override
  List<Object?> get props => [category];
}
