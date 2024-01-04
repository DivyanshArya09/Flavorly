import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:recipe_app/features/home/domain/entites/Nutrients_recipe_entity.dart';
import 'package:recipe_app/features/home/presentation/pages/detail_page/recipe_detail_page.dart';
import 'package:recipe_app/features/home/presentation/widgets/recommeded_item.dart';

class NutrientRecipes extends StatelessWidget {
  final List<NutrientRecipeEntity> nutrientRecipes;
  const NutrientRecipes({super.key, required this.nutrientRecipes});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: nutrientRecipes.length,
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
                  padding: EdgeInsets.only(
                      top: 8, bottom: 8, left: index == 0 ? 0 : 10, right: 10),
                  child: RecommendedDish(
                    title: nutrientRecipes[index].title.toString(),
                    imageUrl: nutrientRecipes[index].image.toString(),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return RecipeDetailPage(
                                id: nutrientRecipes[index].id);
                          },
                        ),
                      );
                    },
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
