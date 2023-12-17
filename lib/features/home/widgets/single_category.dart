import 'package:flutter/material.dart';
import 'package:recipe_app/config/constants/app_colors.dart';
import 'package:recipe_app/config/utils/responsive.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: Responsive.isTablet(context) || Responsive.isDesktop(context)
          ? 120
          : size.height * .09,
      width: Responsive.isTablet(context) || Responsive.isDesktop(context)
          ? 150
          : size.width * .2,
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
