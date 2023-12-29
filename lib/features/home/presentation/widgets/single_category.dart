import 'package:flutter/material.dart';
import 'package:recipe_app/config/constants/app_colors.dart';
import 'package:recipe_app/config/utils/responsive.dart';

class Category extends StatelessWidget {
  final VoidCallback onTap;
  final String imageUrl, title;
  const Category(
      {super.key,
      required this.onTap,
      required this.imageUrl,
      required this.title});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        height: Responsive.isTablet(context) || Responsive.isDesktop(context)
            ? 120
            : size.height * .09,
        width: Responsive.isTablet(context) || Responsive.isDesktop(context)
            ? 150
            : size.width * .22,
        decoration: BoxDecoration(
          color: AppColors.buttonColor1,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Image(
                image: AssetImage(imageUrl),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                title,
                style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
