import 'package:flutter/material.dart';
import 'package:recipe_app/config/constants/app_colors.dart';

class CustomRow extends StatelessWidget {
  final String text;
  const CustomRow({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: size.height * .025,
                ),
          ),
          Text(
            'See all',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.buttonColor1,
                ),
          ),
        ],
      ),
    );
  }
}
