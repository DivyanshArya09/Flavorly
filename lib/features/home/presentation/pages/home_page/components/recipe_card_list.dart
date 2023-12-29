import 'package:flutter/widgets.dart';
import 'package:recipe_app/features/home/domain/entites/category_recipe_entity.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/recipe_card.dart';

class RecipeCardList extends StatelessWidget {
  final List<CategoryEntity> recipes;
  const RecipeCardList({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recipes.length,
      itemBuilder: (_, index) {
        return RecipeCard(
          imageUrl: recipes[index].image.toString(),
          title: recipes[index].title.toString(),
          readyInMinutes: recipes[index].readyInMinutes.toString(),
          onTap: () {},
        );
      },
    );
  }
}
