import 'package:flutter/material.dart';
import 'package:recipe_app/features/home/presentation/widgets/recommeded_item.dart';

class RecommendedItems extends StatelessWidget {
  const RecommendedItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
              top: 8, bottom: 8, left: index == 0 ? 0 : 10, right: 10),
          child: const RecommendedDish(),
        );
      },
    );
  }
}
