import 'package:flutter/material.dart';
import 'package:recipe_app/features/home/domain/entites/recipe_detail_entity.dart';
import 'package:recipe_app/features/home/presentation/pages/detail_page/shared/recipe_equipment_builder.dart';
import 'package:recipe_app/features/home/presentation/pages/detail_page/shared/recipe_list_builder.dart';

class StepsPage extends StatelessWidget {
  final String stepNumber;
  final String step;
  final List<Ingredients> ingredients;
  final List<Equipment> equipment;
  const StepsPage(
      {super.key,
      required this.stepNumber,
      required this.step,
      required this.ingredients,
      required this.equipment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Step: $stepNumber",
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: 10,
          ),
          Text(step, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(
            height: 20,
          ),
          Text('Ingredients', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: 10,
          ),
          RecipeIngredientBuilder(ingredients: ingredients),
          Text('Equipments', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: 10,
          ),
          RecipeEquipmentBuilder(equipments: equipment),
        ],
      ),
    );
  }
}
