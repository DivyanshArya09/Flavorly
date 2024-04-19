import 'package:Flavorly/features/home/domain/entites/random_recipe_entity.dart';

class RandomRecipeModel extends RandomRecipeEntity {
  const RandomRecipeModel(
      {required super.id,
      required super.aisle,
      required super.image,
      required super.consistency,
      required super.name,
      required super.nameClean,
      required super.original,
      required super.originalName,
      required super.amount,
      required super.unit,
      required super.meta,
      required super.measures});

  factory RandomRecipeModel.fromJson(Map<String, dynamic> json) {
    return RandomRecipeModel(
      id: json['id'],
      aisle: json['aisle'],
      image: json['image'] ?? '',
      consistency: json['consistency'],
      name: json['name'],
      nameClean: json['nameClean'],
      original: json['original'],
      originalName: json['originalName'],
      amount: json['amount'],
      unit: json['unit'],
      meta: List<String>.from(json['meta']),
      measures: MeasuresModel.fromJson(json['measures']),
    );
  }

  RandomRecipeEntity toEntity() {
    return RandomRecipeEntity(
      id: id,
      aisle: aisle,
      image: image,
      consistency: consistency,
      name: name,
      nameClean: nameClean,
      original: original,
      originalName: originalName,
      amount: amount,
      unit: unit,
      meta: meta,
      measures: measures,
    );
  }
}

class MeasuresModel extends Measures {
  const MeasuresModel({required super.us, required super.metric});

  factory MeasuresModel.fromJson(Map<String, dynamic> json) {
    return MeasuresModel(
      us: UsModel.fromJson(json['us']),
      metric: UsModel.fromJson(json['metric']),
    );
  }
}

class UsModel extends Us {
  const UsModel(
      {required super.amount,
      required super.unitShort,
      required super.unitLong});
  factory UsModel.fromJson(Map<String, dynamic> json) {
    return UsModel(
      amount: json['amount'],
      unitShort: json['unitShort'],
      unitLong: json['unitLong'],
    );
  }
}
