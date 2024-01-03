import 'package:recipe_app/features/home/domain/entites/recipe_detail_entity.dart';

class RecipeDetailModel extends RecipeDetailEntity {
  const RecipeDetailModel({
    super.vegetarian,
    super.vegan,
    super.glutenFree,
    super.dairyFree,
    super.veryHealthy,
    super.cheap,
    super.veryPopular,
    super.sustainable,
    super.lowFodmap,
    super.weightWatcherSmartPoints,
    super.gaps,
    super.preparationMinutes,
    super.cookingMinutes,
    super.aggregateLikes,
    super.healthScore,
    super.creditsText,
    super.sourceName,
    super.pricePerServing,
    super.extendedIngredients,
    super.id,
    super.title,
    super.readyInMinutes,
    super.servings,
    super.sourceUrl,
    super.image,
    super.imageType,
    super.summary,
    super.instructions,
    super.analyzedInstructions,
  });

  factory RecipeDetailModel.fromJson(Map<String, dynamic> json) {
    print("--------------------> $json['extendedIngredients']");
    return RecipeDetailModel(
      vegetarian: json['vegetarian'],
      vegan: json['vegan'],
      glutenFree: json['glutenFree'],
      dairyFree: json['dairyFree'],
      veryHealthy: json['veryHealthy'],
      cheap: json['cheap'],
      veryPopular: json['veryPopular'],
      sustainable: json['sustainable'],
      lowFodmap: json['lowFodmap'],
      weightWatcherSmartPoints: json['weightWatcherSmartPoints'],
      gaps: json['gaps'],
      preparationMinutes: json['preparationMinutes'],
      cookingMinutes: json['cookingMinutes'],
      aggregateLikes: json['aggregateLikes'],
      healthScore: json['healthScore'],
      creditsText: json['creditsText'],
      sourceName: json['sourceName'],
      pricePerServing: json['pricePerServing'],
      extendedIngredients: (json['extendedIngredients'] as List<dynamic>?)
          ?.map(
            (e) => ExtendedIngredientModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      id: json['id'],
      title: json['title'],
      readyInMinutes: json['readyInMinutes'],
      servings: json['servings'],
      sourceUrl: json['sourceUrl'],
      image: json['image'],
      imageType: json['imageType'],
      summary: json['summary'],
      instructions: json['instructions'],
      analyzedInstructions: (json['analyzedInstructions'] as List<dynamic>?)
          ?.map(
            (e) =>
                AnalyzedInstructionsModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  RecipeDetailEntity toEntity() {
    return RecipeDetailEntity(
      vegetarian: vegetarian,
      vegan: vegan,
      glutenFree: glutenFree,
      dairyFree: dairyFree,
      veryHealthy: veryHealthy,
      cheap: cheap,
      veryPopular: veryPopular,
      sustainable: sustainable,
      lowFodmap: lowFodmap,
      weightWatcherSmartPoints: weightWatcherSmartPoints,
      gaps: gaps,
      preparationMinutes: preparationMinutes,
      cookingMinutes: cookingMinutes,
      aggregateLikes: aggregateLikes,
      healthScore: healthScore,
      creditsText: creditsText,
      sourceName: sourceName,
      pricePerServing: pricePerServing,
      extendedIngredients: extendedIngredients,
      id: id,
      title: title,
      readyInMinutes: readyInMinutes,
      servings: servings,
      sourceUrl: sourceUrl,
      image: image,
      imageType: imageType,
      summary: summary,
      instructions: instructions,
      analyzedInstructions: analyzedInstructions,
    );
  }
}

class ExtendedIngredientModel extends ExtendedIngredients {
  const ExtendedIngredientModel(
      {super.id,
      super.aisle,
      super.image,
      super.consistency,
      super.name,
      super.nameClean,
      super.original,
      super.originalName,
      super.amount,
      super.unit,
      super.meta,
      super.measures});

  factory ExtendedIngredientModel.fromJson(Map<String, dynamic> json) {
    // print('ExtendedIngredientModel.fromJson json: $json');
    return ExtendedIngredientModel(
      id: json['id'],
      aisle: json['aisle'],
      image: json['image'],
      consistency: json['consistency'],
      name: json['name'],
      nameClean: json['nameClean'],
      original: json['original'],
      originalName: json['originalName'],
      amount: json['amount'],
      unit: json['unit'],
      meta: json['meta'] == null ? [] : List<String>.from(json['meta']),
      measures: MeasuresModel.fromJson(json['measures'] ?? {}),
    );
  }
}

class MeasuresModel extends Measures {
  const MeasuresModel({
    super.us,
    super.metric,
  });

  factory MeasuresModel.fromJson(Map<String, dynamic> json) {
    return MeasuresModel(
      us: UsModel.fromJson(json['us']),
      metric: MetricModel.fromJson(json['metric']),
    );
  }
}

class MetricModel extends Metric {
  const MetricModel({
    super.amount,
    super.unitShort,
    super.unitLong,
  });

  factory MetricModel.fromJson(Map<String, dynamic> json) {
    return MetricModel(
      amount: json['amount'],
      unitShort: json['unitShort'],
      unitLong: json['unitLong'],
    );
  }
}

class UsModel extends Us {
  const UsModel({
    super.amount,
    super.unitShort,
    super.unitLong,
  });

  factory UsModel.fromJson(Map<String, dynamic> json) {
    return UsModel(
      amount: json['amount'],
      unitShort: json['unitShort'],
      unitLong: json['unitLong'],
    );
  }
}

class AnalyzedInstructionsModel extends AnalyzedInstructions {
  const AnalyzedInstructionsModel({
    super.name,
    super.steps,
  });

  factory AnalyzedInstructionsModel.fromJson(Map<String, dynamic> json) {
    return AnalyzedInstructionsModel(
        name: json['name'],
        steps: (json['steps'] as List<dynamic>?)
            ?.map((e) => StepsModel.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

class StepsModel extends Steps {
  const StepsModel({
    super.number,
    super.step,
    super.ingredients,
    super.equipment,
    super.length,
  });

  factory StepsModel.fromJson(Map<String, dynamic> json) {
    return StepsModel(
      number: json['number'],
      step: json['step'],
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => IngredientsModel.fromJson(e))
          .toList(),
      equipment: (json['equipment'] as List<dynamic>?)
          ?.map(
            (e) => EquipmentModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      length: json['length'] != null
          ? TemperatureModel.fromJson(json['length'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  List<Object?> get props => [number, step, ingredients, equipment, length];
}

class IngredientsModel extends Ingredients {
  const IngredientsModel({
    super.id,
    super.name,
    super.image,
  });

  factory IngredientsModel.fromJson(Map<String, dynamic> json) {
    return IngredientsModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

class EquipmentModel extends Equipment {
  const EquipmentModel({
    super.id,
    super.name,
    super.image,
  });

  factory EquipmentModel.fromJson(Map<String, dynamic> json) {
    return EquipmentModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

class TemperatureModel extends Temperature {
  const TemperatureModel({
    super.number,
    super.unit,
  });

  factory TemperatureModel.fromJson(Map<String, dynamic> json) {
    return TemperatureModel(
      number: json['number'],
      unit: json['unit'],
    );
  }
}
