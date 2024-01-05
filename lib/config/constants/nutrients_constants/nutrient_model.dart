import 'package:equatable/equatable.dart';

class NutrientModel extends Equatable {
  final String name;
  final int unit;

  const NutrientModel({required this.name, required this.unit});

  @override
  List<Object?> get props => [name, unit];
}
