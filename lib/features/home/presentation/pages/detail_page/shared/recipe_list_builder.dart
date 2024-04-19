import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:Flavorly/features/home/domain/entites/recipe_detail_entity.dart';
import 'package:Flavorly/features/home/presentation/pages/detail_page/shared/ingredients_item.dart';

class RecipeIngredientBuilder extends StatelessWidget {
  final List<Ingredients> ingredients;
  const RecipeIngredientBuilder({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        // scrollDirection: Axis.horizontal,
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            child: SlideAnimation(
              duration: const Duration(milliseconds: 500),
              // verticalOffset: 50.0,
              horizontalOffset: -50.0,
              child: FadeInAnimation(
                duration: const Duration(seconds: 1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: RecipeIngredientsAndEquipmentWidget(
                      title: ingredients[index].name.toString(),
                      imageUrl:
                          'https://spoonacular.com/cdn/ingredients_100x100/${ingredients[index].image.toString()}',
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
