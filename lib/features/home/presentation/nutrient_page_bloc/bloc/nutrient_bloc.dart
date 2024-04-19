import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:Flavorly/config/constants/nutrients_constants/nutrient_model.dart';
import 'package:Flavorly/core/error/failure.dart';
import 'package:Flavorly/features/home/domain/entites/Nutrients_recipe_entity.dart';
import 'package:Flavorly/features/home/domain/usecases/get_recipies_by_nutrients.dart';

part 'nutrient_event.dart';
part 'nutrient_state.dart';

class NutrientBloc extends Bloc<NutrientEvent, NutrientState> {
  final GetRecipesByNutrientsUseCase getRecipesByNutrientsUseCase;
  NutrientBloc(this.getRecipesByNutrientsUseCase)
      : super(const NutrientState()) {
    on<NutrientInitialEvent>((event, emit) async {
      emit(state.copyWith(status: NutrientStatus.loading));
      final result = await getRecipesByNutrientsUseCase
          .call(NutrientsParams(nutrients: event.nutrients));

      result.fold((l) {
        if (l is ConnectionFailure) {
          emit(state.copyWith(
            status: NutrientStatus.error,
            failure: NutrientFailure.connection,
          ));
        }
        if (l is SeverFailure) {
          emit(state.copyWith(
            status: NutrientStatus.error,
            failure: NutrientFailure.connection,
          ));
        }
      },
          (r) => emit(state.copyWith(
              status: NutrientStatus.success, nutrientResults: r)));
    });
  }
}
