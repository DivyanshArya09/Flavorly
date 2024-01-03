import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:recipe_app/features/home/domain/entites/menu_recipe_entiry.dart';
import 'package:recipe_app/features/home/presentation/pages/detail_page/recipe_detail_page.dart';
import 'package:recipe_app/features/home/presentation/widgets/carousel_item.dart';

class Carousel extends StatelessWidget {
  final List<MenuRecipeEntity> menuItems;
  const Carousel({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CarouselSlider.builder(
      itemCount: menuItems.length,
      itemBuilder: (context, index, realIndex) {
        return CarouselItem(
          title: menuItems[index].title.toString(),
          imageUrl: menuItems[index].image.toString(),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return RecipeDetailPage(id: menuItems[index].id);
            }));
          },
        );
      },
      options: CarouselOptions(
        height: size.height * .35,
        enlargeCenterPage: true,
        enlargeFactor: .15,
        autoPlay: true,
      ),
    ).animate().fadeIn(
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOutCubic,
          begin: 0,
        );
  }
}
