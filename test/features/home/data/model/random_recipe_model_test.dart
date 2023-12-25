import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/features/home/data/models/random_recipe_model.dart';
import 'package:recipe_app/features/home/domain/entites/random_recipe_entity.dart';

import '../../helper/json_reader.dart';

void main() {
  RandomRecipeModel expectedModel = const RandomRecipeModel(
    id: 1014582,
    aisle: "Oil, Vinegar, Salad Dressing",
    image: "vegetable-oil.jpg",
    consistency: "LIQUID",
    name: "canola oil",
    nameClean: "canola oil",
    original: "2 T. canola oil",
    originalName: "canola oil",
    amount: 2.0,
    unit: "T",
    meta: [],
    measures: MeasuresModel(
      us: UsModel(amount: 2.0, unitShort: "Tbsps", unitLong: "Tbsps"),
      metric: UsModel(amount: 2.0, unitShort: "Tbsps", unitLong: "Tbsps"),
    ),
  );

  group('RandomRecipeModel test', () {
    test('RandomRecipe model should be subclass of RecommendedEntity',
        () async {
      //assert
      expect(expectedModel, isA<RandomRecipeEntity>());
    });

    test('RandomRecipe model should return a valid model', () async {
      // arrange
      final dummyJsonResponse = json.decode(
        readJson(
            'features/home/helper/dummy_data/dummy_random_recipe_response.json'),
      );

      // print('--------------------> $dummyJsonResponse');

      // act
      final result = RandomRecipeModel.fromJson(dummyJsonResponse);

      // print('--------------------> $result');

      // assert
      expect(result, expectedModel);
    });
  });
}
