class RecipeDetails {
  final bool? vegetarian;
  final bool? vegan;
  final bool? glutenFree;
  final bool? dairyFree;
  final bool? veryHealthy;
  final bool? cheap;
  final bool? veryPopular;
  final bool? sustainable;
  final bool? lowFodmap;
  final int? weightWatcherSmartPoints;
  final String? gaps;
  final int? preparationMinutes;
  final int? cookingMinutes;
  final int? aggregateLikes;
  final int? healthScore;
  final String? creditsText;
  final String? sourceName;
  final double? pricePerServing;
  final List<ExtendedIngredient>? extendedIngredients;
  final int? id;
  final String? title;
  final int? readyInMinutes;
  final int? servings;
  final String? sourceUrl;
  final String? image;
  final String? imageType;
  final String? summary;
  final List<dynamic>? cuisines;
  final List<String>? dishTypes;
  final List<String>? diets;
  final List<dynamic>? occasions;
  final WinePairing? winePairing;
  final String? instructions;
  final List<AnalyzedInstruction>? analyzedInstructions;
  final dynamic originalId;
  final double? spoonacularScore;

  RecipeDetails({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.lowFodmap,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.preparationMinutes,
    this.cookingMinutes,
    this.aggregateLikes,
    this.healthScore,
    this.creditsText,
    this.sourceName,
    this.pricePerServing,
    this.extendedIngredients,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.image,
    this.imageType,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.winePairing,
    this.instructions,
    this.analyzedInstructions,
    this.originalId,
    this.spoonacularScore,
  });
}

class AnalyzedInstruction {
  final String? name;
  final List<Step>? steps;

  AnalyzedInstruction({
    this.name,
    this.steps,
  });
}

class Step {
  final int? number;
  final String? step;
  final List<Ent>? ingredients;
  final List<Ent>? equipment;
  final Length? length;

  Step({
    this.number,
    this.step,
    this.ingredients,
    this.equipment,
    this.length,
  });
}

class Ent {
  final int? id;
  final String? name;
  final String? localizedName;
  final String? image;
  final Length? temperature;

  Ent({
    this.id,
    this.name,
    this.localizedName,
    this.image,
    this.temperature,
  });
}

class Length {
  final int? number;
  final String? unit;

  Length({
    this.number,
    this.unit,
  });
}

class ExtendedIngredient {
  final int? id;
  final String? aisle;
  final String? image;
  final Consistency? consistency;
  final String? name;
  final String? nameClean;
  final String? original;
  final String? originalName;
  final double? amount;
  final String? unit;
  final List<String>? meta;
  final Measures? measures;

  ExtendedIngredient({
    this.id,
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
    this.measures,
  });
}

enum Consistency { LIQUID, SOLID }

class Measures {
  final Metric? us;
  final Metric? metric;

  Measures({
    this.us,
    this.metric,
  });
}

class Metric {
  final double? amount;
  final String? unitShort;
  final String? unitLong;

  Metric({
    this.amount,
    this.unitShort,
    this.unitLong,
  });
}

class WinePairing {
  final List<String>? pairedWines;
  final String? pairingText;
  final List<ProductMatch>? productMatches;

  WinePairing({
    this.pairedWines,
    this.pairingText,
    this.productMatches,
  });
}

class ProductMatch {
  final int? id;
  final String? title;
  final String? description;
  final String? price;
  final String? imageUrl;
  final int? averageRating;
  final int? ratingCount;
  final double? score;
  final String? link;

  ProductMatch({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.averageRating,
    this.ratingCount,
    this.score,
    this.link,
  });
}
