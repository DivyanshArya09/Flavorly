import 'package:flutter/material.dart';
import 'package:recipe_app/config/constants/padding.dart';
import 'package:recipe_app/config/utils/responsive.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/header.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/search_bar.dart';
import 'package:recipe_app/features/home/presentation/pages/loading_pages/home_loading_page.dart/skelton_components/caresoul_skelton.dart';
import 'package:recipe_app/features/home/presentation/pages/loading_pages/home_loading_page.dart/skelton_components/categories_skelton.dart';
import 'package:recipe_app/features/home/presentation/pages/loading_pages/home_loading_page.dart/skelton_components/custom_row_skelton.dart';
import 'package:recipe_app/features/home/presentation/pages/loading_pages/home_loading_page.dart/skelton_components/skelton_grid.dart';
import 'package:recipe_app/features/home/presentation/pages/loading_pages/home_loading_page.dart/skelton_components/skelton_recommendation_section.dart';
import 'package:recipe_app/features/home/presentation/widgets/seprator.dart';

class SkeltonHomePage extends StatelessWidget {
  const SkeltonHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
                  size.width > 850 ? size.width * .13 : horizontalPadding),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                //header section with name and profile
                const Header(name: 'Anne'),
                //space between header and searchBar
                const CustomSeperator(),
                //search bar
                const CustomSearchBar(),
                //space between searchBar and categories
                const CustomSeperator(),
                //categories
                const SizedBox(
                  height: 90,
                  child: CategoriesSkelton(),
                ),
                //space between categories and recommended
                const CustomSeperator(),

                //recommended
                const CustomRowSkelton(),
                // space between recommended title and recommended recipes
                const CustomSeperator(),

                SizedBox(
                    height:
                        Responsive.isMobile(context) ? size.height * .35 : 250,
                    child: const RecommendedRecipesSkelton()),

                const CustomRowSkelton(),

                const CustomSeperator(),

                Visibility(
                  visible: !Responsive.isDesktop(context),
                  child: const CarouselSkelton(),
                ),
                Visibility(
                  visible: Responsive.isDesktop(context),
                  child: const SizedBox(
                    height: 230,
                    // : size.height * .34,
                    child: RecommendedRecipesSkelton(),
                  ),
                ),
                // const CustomRow(text: 'Cusines'),
                const CustomSeperator(),
                // Visibility(
                //     visible: !Responsive.isDesktop(context),
                //     child: const ()),
                Visibility(
                  visible: Responsive.isDesktop(context),
                  child: const SkeltonGrid(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
