import 'package:Flavorly/core/error/failure.dart';
import 'package:Flavorly/core/usecase/use_case.dart';
import 'package:Flavorly/features/home/domain/entites/menu_recipe_entiry.dart';
import 'package:Flavorly/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

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
