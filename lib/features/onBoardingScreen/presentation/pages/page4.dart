import 'package:flutter/material.dart';
import 'package:recipe_app/config/constants/app_strings.dart';
import 'package:recipe_app/config/constants/padding.dart';
import 'package:recipe_app/config/constants/styles.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
              height: size.height * .3,
              image: const AssetImage('assets/Chef3.png')),
          const SizedBox(
            height: 20,
          ),
          Text(
            AppStrings.thirdPageHeading,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          Text(
            AppStrings.thirdPageQuote,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
