import 'package:flutter/material.dart';
import 'package:recipe_app/config/constants/app_colors.dart';
import 'package:recipe_app/config/constants/font_sizes.dart';
import 'package:recipe_app/config/utils/responsive.dart';

class CusineTile extends StatelessWidget {
  const CusineTile({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: Responsive.isMobile(context)
            ? size.height * .15
            : size.height * .25,
        width: size.width,
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Container(
              height: double.infinity,
              width: size.width * .35,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
            SizedBox(
              width: size.width * .02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FittedBox(
                  child: Text(
                    'Dish name',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: size.width > 500
                              ? largeFontSize
                              : size.width * .035,
                        ),
                  ),
                ),
                SizedBox(
                  width: size.width > 500 ? size.width * .32 : size.width * .5,
                  child: Text(
                    'A super easy, full flavoured Butter Chicken recipe that rivals any restaurant. Aromatic golden chicken pieces in an incredible curry sauce ',
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: size.width > 500
                              ? largeFontSize
                              : size.width * .035,
                        ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'By John Doe',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontSize: size.width > 500
                                    ? largeFontSize
                                    : size.width * .035,
                              ),
                    ),
                    SizedBox(
                      width: size.width * .05,
                    ),
                    Text(
                      '30 . mins',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: AppColors.buttonColor1,
                            fontSize: size.width > 500
                                ? largeFontSize
                                : size.width * .034,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
