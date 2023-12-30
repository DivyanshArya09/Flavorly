import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:recipe_app/features/home/presentation/pages/detail_page/widgets/ingredient_list.dart';

class RecipeOverView extends StatelessWidget {
  const RecipeOverView({super.key});

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
              "Dinner Tonight: Crispy Tilapia With Pico De Gallo Salsa",
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
            width: size.width * .7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _recipeStats(
                    const Icon(
                      Icons.timer_outlined,
                      color: Colors.blueGrey,
                    ),
                    "25 min",
                    context),
                _recipeStats(
                    const Icon(
                      color: Colors.blueGrey,
                      Icons.health_and_safety_outlined,
                    ),
                    "Heath score",
                    context),
                _recipeStats(
                    const Icon(
                      color: Colors.blueGrey,
                      Icons.thumb_up_alt_outlined,
                    ),
                    "Likes",
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
          Text(
            "Ingredients",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          const IngredientsList(),
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
