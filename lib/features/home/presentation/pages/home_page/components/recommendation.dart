import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:recipe_app/features/home/presentation/widgets/recommeded_item.dart';

class RecommendedItems extends StatelessWidget {
  const RecommendedItems({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
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
                  child: const RecommendedDish(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
