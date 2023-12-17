import 'package:flutter/material.dart';
import 'package:recipe_app/config/constants/app_colors.dart';

class RecommendedDish extends StatelessWidget {
  const RecommendedDish({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: size.height * .23,
          width: size.width * .38,
          decoration: const BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Cream Puff',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: size.width * .045,
              ),
        ),
        // const SizedBox(
        //   height: 3,
        // ),
        Text(
          'By John Doe',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: size.width * .035,
              ),
        )
      ],
    );
  }
}
