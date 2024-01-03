import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/features/home/data/models/recipe_detail_model.dart';
import 'package:recipe_app/features/home/domain/entites/recipe_detail_entity.dart';

import '../../helper/json_reader.dart';

void main() {
  test('Should return a valid model', () async {
    final dummyDataResponse = json.decode(readJson(
        'features/home/helper/dummy_data/dummy_recipe_detail_response.json'));
    final result = RecipeDetailModel.fromJson(dummyDataResponse);
    print('--------------------> $result');
    expect(result, isA<RecipeDetailEntity>());
  });

  test('measure model test', () {
    final dummyData = json.decode(readJson(
        'features/home/helper/dummy_data/dummy_recipe_detail_response.json'));

    final result = RecipeDetailModel.fromJson(dummyData);

    print('--------------------> $result');

    expect(result, isA<RecipeDetailEntity>());
  });
}
