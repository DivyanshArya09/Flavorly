import 'package:flutter/material.dart';
import 'package:recipe_app/config/utils/responsive.dart';
import 'package:recipe_app/features/home/presentation/widgets/recommeded_item.dart';

class NutrientRecipeCard extends StatelessWidget {
  const NutrientRecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          // mainAxisExtent: ,
          // mainAxisExtent: 400,
          maxCrossAxisExtent:
              MediaQuery.of(context).size.width < 300 ? 150 : 230,
          // crossAxisCount: Responsive.isMobile(context) ? 2 : 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: Responsive.isMobile(context)
              ? MediaQuery.of(context).size.width < 300
                  ? .52
                  : .62
              : .7),
      itemBuilder: (context, index) {
        return RecommendedDish(
            title: 'Tasty Burger',
            imageUrl:
                'https://media.istockphoto.com/id/1457433817/photo/group-of-healthy-food-for-flexitarian-diet.jpg?s=612x612&w=0&k=20&c=v48RE0ZNWpMZOlSp13KdF1yFDmidorO2pZTu2Idmd3M=',
            onTap: () {});
      },
    );
  }
}
