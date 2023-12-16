import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/config/constants/app_colors.dart';

class Header extends StatelessWidget {
  final String name;
  const Header({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, $name',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    wordSpacing: 5,
                    fontSize: size.width * .041,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'What do you like\nto cook today?',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    // letterSpacing: 1.,
                    // fontSize: size.width * .06,
                    fontSize: size.width * .06,
                  ),
            ),
          ],
        ),
        Container(
          height: size.height * .06,
          // height: 60.h,
          width: size.height * .06,
          // width: 60.h,
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(size.width),
          ),
        ),
      ],
    );
  }
}
