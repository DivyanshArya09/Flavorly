import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:recipe_app/features/home/domain/entites/recipe_detail_entity.dart';
import 'package:recipe_app/features/home/presentation/pages/detail_page/widgets/extended_ingredient_tile.dart';

class ExtendedIngredientWidget extends StatelessWidget {
  final List<ExtendedIngredients> ingredients;
  const ExtendedIngredientWidget({super.key, required this.ingredients});

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
                child: ExtendedIngredientTile(
                  name: ingredients[index].name.toString(),
                  amount: ingredients[index].amount.toString(),
                  unit: ingredients[index].unit.toString(),
                  imageUrl: ingredients[index].image.toString(),
                  aisle: ingredients[index].aisle.toString(),
                  consistency: ingredients[index].consistency.toString(),
                  unitShort:
                      ingredients[index].measures!.us!.unitShort.toString(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
