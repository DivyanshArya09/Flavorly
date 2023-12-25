import 'package:equatable/equatable.dart';

class RandomRecipeEntity extends Equatable {
  final int? id;
  final String? aisle;
  final String? image;
  final String? consistency;
  final String? name;
  final String? nameClean;
  final String? original;
  final String? originalName;
  final double? amount;
  final String? unit;
  final List<String>? meta;
  final Measures? measures;

  const RandomRecipeEntity(
      {this.id,
      this.aisle,
      this.image,
      this.consistency,
      this.name,
      this.nameClean,
      this.original,
      this.originalName,
      this.amount,
      this.unit,
      this.meta,
      this.measures});

  @override
  List<Object?> get props => [
        id,
        aisle,
        image,
        consistency,
        name,
        nameClean,
        original,
        originalName,
        amount,
        unit,
        meta,
        measures,
      ];
}

class Measures extends Equatable {
  final Us? us;
  final Us? metric;
  const Measures({this.us, this.metric});

  @override
  List<Object?> get props => [us, metric];
}

class Us extends Equatable {
  final double? amount;
  final String? unitShort;
  final String? unitLong;

  const Us({this.amount, this.unitShort, this.unitLong});

  @override
  List<Object?> get props => [
        amount,
        unitShort,
      ];
}
