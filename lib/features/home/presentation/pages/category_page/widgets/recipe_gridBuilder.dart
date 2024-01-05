import 'package:flutter/material.dart';
import 'package:recipe_app/config/utils/responsive.dart';
import 'package:recipe_app/features/home/domain/entites/category_recipe_entity.dart';
import 'package:recipe_app/features/home/presentation/pages/detail_page/recipe_detail_page.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/recipe_card.dart';

class RecipeGridBuilder extends StatelessWidget {
  final List<CategoryEntity> categoryList;
  const RecipeGridBuilder({super.key, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            childAspectRatio: Responsive.isMobile(context) ? 1.5 : 1.2,
            crossAxisCount: Responsive.isMobile(context) ? 1 : 3),
        itemCount: categoryList.length,
        itemBuilder: (context, idx) {
          return RecipeCard(
              imageUrl: categoryList[idx].image.toString(),
              title: categoryList[idx].title.toString(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailPage(
                      id: categoryList[idx].id,
                    ),
                  ),
                );
              },
              readyInMinutes: categoryList[idx].readyInMinutes.toString());
        });
  }
}
