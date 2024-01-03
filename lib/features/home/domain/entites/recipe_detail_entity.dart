import 'package:equatable/equatable.dart';

class RecipeDetailEntity extends Equatable {
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
  final List<ExtendedIngredients>? extendedIngredients;
  final int? id;
  final String? title;
  final int? readyInMinutes;
  final int? servings;
  final String? sourceUrl;
  final String? image;
  final String? imageType;
  final String? summary;
  final String? instructions;
  final List<AnalyzedInstructions>? analyzedInstructions;

  const RecipeDetailEntity({
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
    this.instructions,
    this.analyzedInstructions,
  });

  @override
  List<Object?> get props => [
        vegetarian,
        vegan,
        glutenFree,
        dairyFree,
        veryHealthy,
        cheap,
        veryPopular,
        sustainable,
        lowFodmap,
        weightWatcherSmartPoints,
        gaps,
        preparationMinutes,
        cookingMinutes,
        aggregateLikes,
        healthScore,
        creditsText,
        sourceName,
        pricePerServing,
        extendedIngredients,
        id,
        title,
        readyInMinutes,
        servings,
        sourceUrl,
        image,
        imageType,
        summary,
        instructions,
        analyzedInstructions,
      ];
}

class ExtendedIngredients extends Equatable {
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

  const ExtendedIngredients(
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
        measures
      ];
}

class Measures extends Equatable {
  final Us? us;
  final Metric? metric;

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
  List<Object?> get props => [amount, unitShort, unitLong];
}

class Metric extends Equatable {
  final double? amount;
  final String? unitShort;
  final String? unitLong;

  const Metric({this.amount, this.unitShort, this.unitLong});

  @override
  List<Object?> get props => [amount, unitShort, unitLong];
}

class ProductMatches extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? price;
  final String? imageUrl;
  final double? averageRating;
  final int? ratingCount;
  final double? score;
  final String? link;

  const ProductMatches(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.imageUrl,
      this.averageRating,
      this.ratingCount,
      this.score,
      this.link});

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        price,
        imageUrl,
        averageRating,
        ratingCount,
        score,
        link
      ];
}

class AnalyzedInstructions extends Equatable {
  final String? name;
  final List<Steps>? steps;

  const AnalyzedInstructions({this.name, this.steps});

  @override
  List<Object?> get props => [name, steps];
}

class Steps extends Equatable {
  final int? number;
  final String? step;
  final List<Ingredients>? ingredients;
  final List<Equipment>? equipment;
  final Temperature? length;

  const Steps(
      {this.number, this.step, this.ingredients, this.equipment, this.length});

  @override
  List<Object?> get props => [number, step, ingredients, equipment, length];
}

class Ingredients extends Equatable {
  final int? id;
  final String? name;
  final String? localizedName;
  final String? image;

  const Ingredients({this.id, this.name, this.localizedName, this.image});

  @override
  List<Object?> get props => [id, name, localizedName, image];
}

class Equipment extends Equatable {
  final int? id;
  final String? name;
  final String? localizedName;
  final String? image;
  final Temperature? temperature;

  const Equipment(
      {this.id, this.name, this.localizedName, this.image, this.temperature});

  @override
  List<Object?> get props => [id, name, localizedName, image, temperature];
}

class Temperature extends Equatable {
  final int? number;
  final String? unit;

  const Temperature({this.number, this.unit});

  @override
  List<Object?> get props => [number, unit];
}
