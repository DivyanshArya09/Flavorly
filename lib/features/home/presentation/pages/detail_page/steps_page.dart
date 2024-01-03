import 'package:flutter/material.dart';
import 'package:recipe_app/features/home/presentation/pages/detail_page/shared/ingredients_item.dart';

class StepsPage extends StatelessWidget {
  const StepsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Step: 1", style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: 10,
          ),
          Text(
              "In a small bowl, whisk the mayonnaise, lemon juice, lemon zest and the remaining 2 tablespoons of olive oil. Season the dressing with salt and pepper.",
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(
            height: 20,
          ),
          Text('Ingredients', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: 10,
          ),
          Text('Equipments', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
