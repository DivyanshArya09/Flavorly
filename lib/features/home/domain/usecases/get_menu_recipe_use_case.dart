import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/core/usecase/use_case.dart';
import 'package:recipe_app/features/home/domain/entites/menu_recipe_entiry.dart';
import 'package:recipe_app/features/home/domain/repositories/home_repository.dart';

class GetMenuRecipeUseCase
    implements UseCase<List<MenuRecipeEntity>, MenuRecipeParams> {
  final HomeRepository repository;

  const GetMenuRecipeUseCase({required this.repository});
  @override
  Future<Either<Failure, List<MenuRecipeEntity>>> call(
      MenuRecipeParams params) {
    return repository.getMenuItems(params.menuItem, params.number);
  }
}

class MenuRecipeParams extends Equatable {
  const MenuRecipeParams({required this.menuItem, required this.number});
  final int number;
  final String menuItem;
  @override
  List<Object?> get props => [];
}
