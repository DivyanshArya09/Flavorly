import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:Flavorly/features/home/domain/entites/category_recipe_entity.dart';
import 'package:Flavorly/features/home/domain/usecases/get_categories_recipes_use_case.dart';
import '../../../../../core/error/failure.dart' as failure;

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoriesRecipesUseCase getCategoriesRecipesUseCase;
  CategoryBloc(this.getCategoriesRecipesUseCase)
      : super(const CategoryState()) {
    on<GetCategoryEvent>(
      (event, emit) async {
        emit(const CategoryState().copyWith(status: CategoryStatus.loading));
        final result = await getCategoriesRecipesUseCase
            .call(CategoriesParams(category: event.category));
        result.fold(
          (l) {
            if (l is failure.SeverFailure) {
              emit(
                  const CategoryState().copyWith(status: CategoryStatus.error));
            }
            if (l is failure.ConnectionFailure) {
              emit(const CategoryState().copyWith(
                  status: CategoryStatus.error,
                  failure: CategoryFailure.connection));
            }
          },
          (r) {
            emit(
              CategoryState(
                  categoryResults: r,
                  status: CategoryStatus.success,
                  category: event.category),
            );
          },
        );
      },
    );

    on<SearchCategoriesEvent>(
      (event, emit) async {
        emit(const CategoryState().copyWith(status: CategoryStatus.loading));
        final result = await getCategoriesRecipesUseCase
            .call(CategoriesParams(category: event.query));
        result.fold(
          (l) {
            if (l is failure.SeverFailure) {
              emit(
                  const CategoryState().copyWith(status: CategoryStatus.error));
            }
            if (l is failure.ConnectionFailure) {
              emit(const CategoryState().copyWith(
                  status: CategoryStatus.error,
                  failure: CategoryFailure.connection));
            }
          },
          (r) {
            emit(
              CategoryState(
                  categoryResults: r,
                  status: CategoryStatus.success,
                  category: event.query),
            );
          },
        );
      },
    );
  }
}
