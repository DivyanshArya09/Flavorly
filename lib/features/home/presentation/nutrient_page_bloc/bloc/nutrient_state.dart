part of 'nutrient_bloc.dart';

enum NutrientStatus { initial, loading, success, error }

enum NutrientFailure { server, connection, firebase, unknown }

class NutrientState extends Equatable {
  final NutrientStatus status;
  final NutrientFailure? failure;
  final List<NutrientRecipeEntity>? nutrientResults;

  const NutrientState(
      {this.status = NutrientStatus.initial,
      this.failure,
      this.nutrientResults});

  NutrientState copyWith({
    NutrientStatus? status,
    NutrientFailure? failure,
    List<NutrientRecipeEntity>? nutrientResults,
  }) {
    return NutrientState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      nutrientResults: nutrientResults ?? this.nutrientResults,
    );
  }

  @override
  List<Object?> get props => [status, failure, nutrientResults];
}
