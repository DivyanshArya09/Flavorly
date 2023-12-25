import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/features/home/data/models/category_model.dart';
import 'package:recipe_app/features/home/data/models/recommended_item_model.dart';
import 'package:recipe_app/features/home/domain/entites/category_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/entites/recommend_recipe_entity.dart';

import '../../helper/json_reader.dart';

void main() {
  CategoryModel dummyCategoryModel = const CategoryModel(
    readyInMinutes: 45,
    sourceUrl:
        "http://foodandspice.blogspot.com/2016/08/spicy-black-eyed-pea-curry-with-swiss.html",
    image:
        "spicy-black-eyed-pea-curry-with-swiss-chard-and-roasted-eggplant-798400.jpg",
    servings: 6,
    id: 798400,
    title: "Spicy Black-Eyed Pea Curry with Swiss Chard and Roasted Eggplant",
  );

  group(
    'CategoryModel test',
    () {
      test(
        'Category model should be subclass of RecommendedEntity',
        () {
          //assert

          expect(dummyCategoryModel, isA<CategoryEntity>());
        },
      );

      test(
        'Category model should return a valid model',
        () async {
          // arrange
          final dummyJsonResponse = json.decode(
            readJson(
                'features/home/helper/dummy_data/dummy_category_recipe_response.json'),
          );

          // print('--------------------> $dummyJsonResponse');
          final result = CategoryModel.fromJson(dummyJsonResponse);

          expect(result, dummyCategoryModel);
        },
      );
    },
  );
}
