import 'package:flutter/material.dart';
import 'package:recipe_app/config/utils/responsive.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/recipe_card.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/search_bar.dart';
import 'package:recipe_app/features/home/presentation/pages/see_all_page/widgets/recipe_gridBuilder.dart';

class CategoryPage extends StatelessWidget {
  final String category;
  const CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black,
        body: Center(
          child: Container(
            // color: Colors.yellow,
            constraints: const BoxConstraints(
              maxWidth: 1200,
            ),
            // alignment: size.width > 1100 ? Alignment.topCenter : null,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.only(
                top: 30,
                left: !Responsive.isMobile(context) ? 80 : 0,
                right: !Responsive.isMobile(context) ? 80 : 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search Categories',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: Responsive.isMobile(context)
                      ? double.infinity
                      : size.width / 2.5,
                  child: const CustomSearchBar(text: 'search any recipes'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Results for Breakfast',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Expanded(
                  child: RecipeGridBuilder(
                    categoryList: [],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
