part of 'nutrient_bloc.dart';

sealed class NutrientEvent extends Equatable {
  const NutrientEvent();

  @override
  List<Object> get props => [];
}

class NutrientInitialEvent extends NutrientEvent {
  final List<NutrientModel> nutrients;

  const NutrientInitialEvent({required this.nutrients});

  @override
  List<Object> get props => [nutrients];

  @override
  String toString() => 'NutrientInitialEvent { nutrients: $nutrients }';
}
