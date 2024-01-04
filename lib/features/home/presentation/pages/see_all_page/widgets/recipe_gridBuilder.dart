import 'package:flutter/material.dart';
import 'package:recipe_app/config/utils/responsive.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/recipe_card.dart';

class RecipeGridBuilder extends StatelessWidget {
  const RecipeGridBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: Responsive.isMobile(context) ? 1.5 : 1.2,
          crossAxisCount: Responsive.isMobile(context) ? 1 : 3),
      children: [
        RecipeCard(
            imageUrl: 'mushroom-goat-cheese-baked-eggs-782619.png',
            title: "Mushroom Goat Cheese Baked Eggs",
            onTap: () {},
            readyInMinutes: '45'),
        RecipeCard(
            imageUrl: 'mushroom-goat-cheese-baked-eggs-782619.png',
            title: "Mushroom Goat Cheese Baked Eggs",
            onTap: () {},
            readyInMinutes: '45'),
        RecipeCard(
            imageUrl: 'mushroom-goat-cheese-baked-eggs-782619.png',
            title: "Mushroom Goat Cheese Baked Eggs",
            onTap: () {},
            readyInMinutes: '45'),
        RecipeCard(
            imageUrl: 'mushroom-goat-cheese-baked-eggs-782619.png',
            title: "Mushroom Goat Cheese Baked Eggs",
            onTap: () {},
            readyInMinutes: '45'),
        RecipeCard(
            imageUrl: 'mushroom-goat-cheese-baked-eggs-782619.png',
            title: "Mushroom Goat Cheese Baked Eggs",
            onTap: () {},
            readyInMinutes: '45'),
        RecipeCard(
            imageUrl: 'mushroom-goat-cheese-baked-eggs-782619.png',
            title: "Mushroom Goat Cheese Baked Eggs",
            onTap: () {},
            readyInMinutes: '45'),
        RecipeCard(
            imageUrl: 'mushroom-goat-cheese-baked-eggs-782619.png',
            title: "Mushroom Goat Cheese Baked Eggs",
            onTap: () {},
            readyInMinutes: '45'),
        RecipeCard(
            imageUrl: 'mushroom-goat-cheese-baked-eggs-782619.png',
            title: "Mushroom Goat Cheese Baked Eggs",
            onTap: () {},
            readyInMinutes: '45'),
        RecipeCard(
            imageUrl: 'mushroom-goat-cheese-baked-eggs-782619.png',
            title: "Mushroom Goat Cheese Baked Eggs",
            onTap: () {},
            readyInMinutes: '45'),
      ],
    );
  }
}
