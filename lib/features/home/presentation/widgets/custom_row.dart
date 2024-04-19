import 'package:flutter/material.dart';
import 'package:Flavorly/config/constants/app_colors.dart';
import 'package:Flavorly/config/constants/font_sizes.dart';

class CustomRow extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool? isSeeAll;
  const CustomRow(
      {super.key,
      required this.text,
      required this.onTap,
      this.isSeeAll = false});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: size.width > 500 ? largeFontSize : size.width * .06,
              ),
        ),
        isSeeAll == true
            ? const SizedBox()
            : TextButton(
                onPressed: onTap,
                child: Text(
                  'See all',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.buttonColor1,
                        fontSize: size.width > 400 ? 14 : size.width * .03,
                      ),
                )),
      ],
    );
  }
}
