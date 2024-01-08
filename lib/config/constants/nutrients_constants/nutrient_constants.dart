import 'dart:math';

import 'package:recipe_app/config/constants/nutrients_constants/nutrient_model.dart';

class NutrientsConstants {
  static List<NutrientModel> allNutrients = [
    NutrientModel(name: 'maxCarbs', unit: generateRandomNumber(50, 100)),
    NutrientModel(name: 'minCarbs', unit: generateRandomNumber(10, 49)),
    NutrientModel(name: 'minProtein', unit: generateRandomNumber(10, 50)),
    NutrientModel(name: 'maxProtein', unit: generateRandomNumber(50, 100)),
    NutrientModel(name: 'minCalories', unit: generateRandomNumber(50, 300)),
    NutrientModel(name: 'maxCalories', unit: generateRandomNumber(300, 800)),
    NutrientModel(name: 'minFat', unit: generateRandomNumber(1, 40)),
    NutrientModel(name: 'minVitaminA', unit: generateRandomNumber(10, 40)),
    NutrientModel(name: 'maxVitaminA', unit: generateRandomNumber(40, 100)),
    NutrientModel(name: 'minVitaminC', unit: generateRandomNumber(10, 40)),
    NutrientModel(name: 'maxVitaminC', unit: generateRandomNumber(40, 100)),
    NutrientModel(name: 'minVitaminD', unit: generateRandomNumber(10, 40)),
    NutrientModel(name: 'maxVitaminD', unit: generateRandomNumber(40, 100)),
    NutrientModel(name: 'minVitaminE', unit: generateRandomNumber(10, 40)),
    NutrientModel(name: 'maxVitaminE', unit: generateRandomNumber(40, 100)),
    NutrientModel(name: 'minVitaminK', unit: generateRandomNumber(10, 40)),
    NutrientModel(name: 'maxVitaminK', unit: generateRandomNumber(40, 100)),
  ];

  static List<NutrientModel> selectedList = [];

  static List<bool> values =
      List<bool>.generate(NutrientsConstants.allNutrients.length, (i) => false);

  static int generateRandomNumber(int min, int max) {
    if (min >= max) {
      throw ArgumentError(
          'The minimum value must be less than the maximum value.');
    }

    Random random = Random();
    return min + random.nextInt(max - min + 1);
  }
}
