import 'package:flutter/material.dart';
import 'package:recipe_app/config/constants/app_colors.dart';
import 'package:recipe_app/config/constants/font_sizes.dart';
import 'package:recipe_app/config/utils/responsive.dart';

class RecommendedDish extends StatelessWidget {
  const RecommendedDish({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: Responsive.isMobile(context) ? size.width * .38 : 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: !Responsive.isMobile(context) ? 150 : size.height * .25,
            width: !Responsive.isMobile(context) ? 220 : size.width * .38,
            decoration: const BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.01 - 3.5),
            child: Text(
              'Cream Puff vvvvvvvvvvvvvvvvvvvvvvvvvvvvvv',
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize:
                        size.width > 400 ? mediumFontSize : size.width * .045,
                  ),
            ),
          ),
          // const SizedBox(
          //   height: 3,
          // ),
          Text(
            'By John Doe',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize:
                      size.width > 400 ? smallFontSize : size.width * .035,
                ),
          )
        ],
      ),
    );
  }
}
