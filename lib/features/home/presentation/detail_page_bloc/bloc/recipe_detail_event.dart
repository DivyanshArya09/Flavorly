part of 'recipe_detail_bloc.dart';

sealed class RecipeDetailEvent extends Equatable {
  const RecipeDetailEvent();

  @override
  List<Object> get props => [];
}

class GetRecipeDetailEvent extends RecipeDetailEvent {
  final int id;
  const GetRecipeDetailEvent({required this.id});
}
