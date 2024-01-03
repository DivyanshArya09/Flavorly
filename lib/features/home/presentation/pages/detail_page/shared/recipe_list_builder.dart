import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:recipe_app/features/home/presentation/pages/detail_page/shared/ingredients_item.dart';

class RecipeIngredientsAndEquipmentBuilder extends StatelessWidget {
  const RecipeIngredientsAndEquipmentBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        // scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            child: const SlideAnimation(
              duration: Duration(milliseconds: 500),
              // verticalOffset: 50.0,
              horizontalOffset: -50.0,
              child: FadeInAnimation(
                duration: Duration(seconds: 1),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: RecipeIngredientsAndEquipmentWidget(
                      title: '',
                      imageUrl: '',
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
