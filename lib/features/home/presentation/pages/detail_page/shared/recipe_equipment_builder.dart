import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:recipe_app/features/home/domain/entites/recipe_detail_entity.dart';
import 'package:recipe_app/features/home/presentation/pages/detail_page/shared/ingredients_item.dart';

class RecipeEquipmentBuilder extends StatelessWidget {
  final List<Equipment> equipments;
  const RecipeEquipmentBuilder({super.key, required this.equipments});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        // scrollDirection: Axis.horizontal,
        itemCount: equipments.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            child: SlideAnimation(
              duration: const Duration(milliseconds: 500),
              horizontalOffset: -50.0,
              child: FadeInAnimation(
                duration: const Duration(seconds: 1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: RecipeIngredientsAndEquipmentWidget(
                      title: equipments[index].name.toString(),
                      imageUrl:
                          'https://spoonacular.com/cdn/ingredients_100x100/${equipments[index].image.toString()}',
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
