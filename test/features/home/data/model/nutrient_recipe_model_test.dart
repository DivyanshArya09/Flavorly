import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/features/home/data/models/nutrient_recipe_model.dart';
import 'package:recipe_app/features/home/domain/entites/Nutrients_recipe_entity.dart';

import '../../helper/json_reader.dart';

void main() {
  NutrientRecipeModel model = const NutrientRecipeModel(
    id: 627987,
    title: "onion pakoda recipe",
    calories: 218,
    carbs: '26g',
    fat: '6g',
    protein: '10g',
    image: "https://spoonacular.com/recipeImages/627987-312x231.jpg",
    imageType: "jpg",
  );
  group(
    'NutrientModel test',
    () {
      test(
        'should be subclass of NutrientEntity',
        () {
          expect(model, isA<NutrientRecipeEntity>());
        },
      );

      test('should return a valid model', () {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(
          readJson(
              'features/home/helper/dummy_data/dummy_nutrient_recipe_response.json'),
        );

        print('--------------------> $jsonMap');

        // act
        final result = NutrientRecipeModel.fromJson(jsonMap);

        print('--------------------> $result');

        // assert
        expect(result, model);
      });
    },
  );
}
