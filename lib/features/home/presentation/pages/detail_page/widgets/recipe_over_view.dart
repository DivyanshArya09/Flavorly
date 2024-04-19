import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:Flavorly/config/constants/app_colors.dart';
import 'package:Flavorly/features/home/domain/entites/recipe_detail_entity.dart';
import 'package:Flavorly/features/home/presentation/pages/detail_page/shared/extended_ingredient.dart';

class RecipeOverView extends StatelessWidget {
  final String? title;
  final String? timeToCook;
  final String? healthScore;
  final String? likes;
  final List<ExtendedIngredients> ingredients;

  const RecipeOverView({
    super.key,
    this.title,
    this.timeToCook,
    this.healthScore,
    this.likes,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width * .8,
            child: Text(
              title ?? "",
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
          )
              .animate()
              .fadeIn(duration: const Duration(milliseconds: 500))
              .slideY(
                begin: 0.2,
                end: 0,
                duration: const Duration(milliseconds: 400),
              ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: size.width * .9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _recipeStats(
                    const Icon(
                      Icons.timer_outlined,
                      color: AppColors.buttonColor1,
                    ),
                    "$timeToCook min",
                    context),
                _recipeStats(
                    const Icon(
                      color: AppColors.buttonColor1,
                      Icons.health_and_safety_outlined,
                    ),
                    "heath score $healthScore",
                    context),
                _recipeStats(
                    const Icon(
                      color: AppColors.buttonColor1,
                      Icons.thumb_up_outlined,
                    ),
                    likes ?? '',
                    context),
              ],
            )
                .animate()
                .fadeIn(duration: const Duration(milliseconds: 500))
                .slideX(
                  begin: -0.2,
                  end: 0,
                  duration: const Duration(milliseconds: 500),
                ),
          ),
          const SizedBox(
            height: 15,
          ),
          Visibility(
            visible: ingredients.isNotEmpty,
            child: Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          ExtendedIngredientWidget(
            ingredients: ingredients,
          ),
        ],
      ),
    );
  }

  Widget _recipeStats(Icon icon, String text, BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: 5,
        ),
        Text(text, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
