import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:Flavorly/config/utils/responsive.dart';
import 'package:Flavorly/core/network/network_info.dart';
import 'package:Flavorly/core/shared/dialog_box.dart';
import 'package:Flavorly/features/home/domain/entites/Nutrients_recipe_entity.dart';
import 'package:Flavorly/features/home/presentation/pages/detail_page/recipe_detail_page.dart';
import 'package:Flavorly/features/home/presentation/widgets/recommeded_item.dart';

class NutrientRecipeCard extends StatelessWidget {
  final List<NutrientRecipeEntity> nutrientRecipes;
  const NutrientRecipeCard({super.key, required this.nutrientRecipes});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: nutrientRecipes.length,
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
            title: nutrientRecipes[index].title.toString(),
            imageUrl: nutrientRecipes[index].image.toString(),
            onTap: () async {
              await GetIt.I.get<NetworkInfo>().isConnected.then((value) => {
                    if (value)
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return RecipeDetailPage(
                                id: nutrientRecipes[index].id,
                              );
                            },
                          ),
                        )
                      }
                    else
                      {openDialog(context)}
                  });
            });
      },
    );
  }
}
