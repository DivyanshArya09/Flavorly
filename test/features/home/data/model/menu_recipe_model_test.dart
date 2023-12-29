import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/features/home/data/models/menu_recipe_model.dart';
import 'package:recipe_app/features/home/domain/entites/menu_recipe_entiry.dart';

import '../../helper/json_reader.dart';

void main() {
  MenuRecipeModel expectedResult = const MenuRecipeModel(
    sId: 'pizza_my_heart_combo_pizza_slice',
    id: 387582,
    title: 'Combo Pizza (Slice)',
    image: 'https://images.spoonacular.com/file/wximages/387582-312x231.png',
    imageType: 'png',
    restaurantChain: 'Pizza My Heart',
    servings: Servings(
      number: 1.0,
      size: 1.0,
      unit: 'slice',
    ),
  );

  group(
    'MenuRecipeModel test',
    () {
      test(
        'MenuRecipe model should be subclass of MenuRecipeEntity',
        () {
          //assert

          expect(expectedResult, isA<MenuRecipeEntity>());
        },
      );

      test(
        'MenuRecipe model should return a valid model',
        () async {
          // arrange
          final dummyJsonResponse = json.decode(
            readJson(
                'features/home/helper/dummy_data/dummy_menu_recipe_response.json'),
          );

          // print('--------------------> $dummyJsonResponse');
          final result = MenuRecipeModel.fromJson(dummyJsonResponse);

          expect(result.id, expectedResult.id);
          expect(result.title, expectedResult.title);
          expect(result.image, expectedResult.image);
          expect(result.imageType, expectedResult.imageType);
          expect(result.restaurantChain, expectedResult.restaurantChain);
          expect(result.servings?.size, expectedResult.servings?.size);
          expect(result.sId, expectedResult.sId);
        },
      );
    },
  );
}
