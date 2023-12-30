import 'package:flutter/material.dart';

class IngredientTile extends StatelessWidget {
  const IngredientTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Sugar",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      leading: const Image(
          image: NetworkImage(
              'https://spoonacular.com/cdn/ingredients_100x100/cauliflower.jpg')),
      trailing: Text(
        "5g",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
