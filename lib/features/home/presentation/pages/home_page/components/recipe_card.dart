// import 'package:flutter/foundation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:recipe_app/config/constants/app_colors.dart';
import 'package:recipe_app/features/home/presentation/pages/loading_pages/home_loading_page.dart/skelton_container.dart';

import '../../../../../../config/utils/responsive.dart';

class RecipeCard extends StatelessWidget {
  final String imageUrl, title, readyInMinutes;
  final VoidCallback onTap;
  const RecipeCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.onTap,
      required this.readyInMinutes});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        // padding: const EdgeInsets.symmetric(vertical: 8),
        height: Responsive.isMobile(context) ? size.height * .35 : 270,
        width: Responsive.isMobile(context) ? size.width : 220,
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                  imageUrl: 'https://spoonacular.com/recipeImages/$imageUrl',
                  fit: BoxFit.fill,
                  imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imageProvider,
                          ),
                        ),
                      ),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const SkeltonContainer(
                        height: double.infinity,
                        width: double.infinity,
                        radius: 20,
                      ),
                  errorWidget: (context, url, error) {
                    return const Image(
                      image: AssetImage('assets/halo-halo.png'),
                      fit: BoxFit.contain,
                      height: 100,
                      width: 100,
                    );
                  }),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                height: size.height * .1,
                width: size.width * .23,
                decoration: const BoxDecoration(
                  color: AppColors.buttonColor1,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.watch_later_outlined,
                      color: AppColors.white,
                    ),
                    Text(
                      '$readyInMinutes min',
                      style: const TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 10,
              child: SizedBox(
                width: size.width * .8,
                child: Text(
                  title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppColors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
 {
            "readyInMinutes": 25,
            "sourceUrl": "http://www.foodista.com/recipe/BDRS2JZG/corn-avocado-salsa",
            "image": "Corn-Avocado-Salsa-640062.jpg",
            "servings": 2,
            "id": 640062,
            "title": "Corn Avocado Salsa"
        },

*/ 