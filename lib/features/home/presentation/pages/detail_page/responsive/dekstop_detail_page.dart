import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:recipe_app/features/home/presentation/pages/detail_page/shared/recipe_list_builder.dart';
import 'package:recipe_app/features/onBoardingScreen/presentation/widgets/Custom_button.dart';

class DekStopDetailLayout extends StatelessWidget {
  const DekStopDetailLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 100),
          constraints: const BoxConstraints(
            maxWidth: 1200,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        SizedBox(
                          width: size.width * .6,
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
                        const Image(
                          image: NetworkImage(
                            "https://images.pexels.com/photos/62389/pexels-photo-62389.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: size.width * .6,
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
                              .fadeIn(
                                  duration: const Duration(milliseconds: 500))
                              .slideX(
                                begin: -0.2,
                                end: 0,
                                duration: const Duration(milliseconds: 500),
                              ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                            width: 200,
                            child: CustomButton(
                                onTap: () {}, text: 'Get Instructions'))
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(
                          "Ingredients",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const RecipeIngredientsAndEquipmentBuilder(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
        Text(text, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
