import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:Flavorly/features/home/domain/entites/recipe_detail_entity.dart';
import 'package:Flavorly/features/home/domain/usecases/get_recipe_detail_use_case.dart';

import '../../../../../core/error/failure.dart' as failure;

part 'recipe_detail_event.dart';
part 'recipe_detail_state.dart';

class RecipeDetailBloc extends Bloc<RecipeDetailEvent, RecipeDetailState> {
  final GetRecipeDetailUseCase getRecipeDetailUseCase;
  RecipeDetailBloc(this.getRecipeDetailUseCase)
      : super(const RecipeDetailState()) {
    on<GetRecipeDetailEvent>(
      (event, emit) async {
        emit(const RecipeDetailState()
            .copyWith(status: RecipeDetailStatus.loading));
        final result =
            await getRecipeDetailUseCase.call(RecipeDetailParams(id: event.id));

        result.fold((l) {
          if (l is failure.SeverFailure) {
            emit(const RecipeDetailState()
                .copyWith(status: RecipeDetailStatus.error));
          }
          if (l is failure.ConnectionFailure) {
            emit(const RecipeDetailState()
                .copyWith(status: RecipeDetailStatus.error));
          }
        }, (r) {
          emit(RecipeDetailState(
              recipeDetail: r, status: RecipeDetailStatus.success));
        });
      },
    );
  }
}
