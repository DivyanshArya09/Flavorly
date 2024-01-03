part of 'recipe_detail_bloc.dart';

enum RecipeDetailStatus { initial, loading, success, error }

enum RecipeDetailFailure { server, connection, firebase, unknown }

class RecipeDetailState extends Equatable {
  final RecipeDetailStatus status;
  final RecipeDetailFailure? failure;
  final RecipeDetailEntity? recipeDetail;

  const RecipeDetailState(
      {this.status = RecipeDetailStatus.initial,
      this.failure,
      this.recipeDetail});

  RecipeDetailState copyWith({
    RecipeDetailStatus? status,
    RecipeDetailFailure? failure,
    RecipeDetailEntity? recipeDetail,
  }) {
    return RecipeDetailState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      recipeDetail: recipeDetail ?? this.recipeDetail,
    );
  }

  @override
  List<Object?> get props => [status, failure, recipeDetail];
}
