import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:Flavorly/features/home/data/models/recommended_item_model.dart';
import 'package:Flavorly/features/home/domain/entites/recommend_recipe_entity.dart';

import '../../helper/json_reader.dart';

void main() {
  RecommendedRecipeModel dummyRecommendedRecipeModel =
      const RecommendedRecipeModel(
    id: 9751,
    title: "Dinner Tonight: Roasted Beet Bruschetta",
    imageType: "jpg",
    readyInMinutes: 45,
    servings: 4,
    sourceUrl:
        "http://www.seriouseats.com/recipes/2007/08/dinner-tonight-roasted-beet-bruschetta.html",
  );

  group(
    'RecommendedRecipeModel test',
    () {
      test(
        'RecommendedRecipe model should be subclass of RecommendedEntity',
        () {
          //assert

          expect(dummyRecommendedRecipeModel, isA<RecommendRecipeEntity>());
        },
      );

      test(
        'RandomRecipe model should return a valid model',
        () async {
          // arrange
          final dummyJsonResponse = json.decode(
            readJson(
                'features/home/helper/dummy_data/dummy_recommended_recipe_response.json'),
          );

          // print('--------------------> $dummyJsonResponse');
          final result = RecommendedRecipeModel.fromJson(dummyJsonResponse);

          expect(result, dummyRecommendedRecipeModel);
        },
      );
    },
  );
}
