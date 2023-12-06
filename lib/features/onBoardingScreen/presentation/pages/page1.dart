import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/config/constants/app_images.dart';
import 'package:recipe_app/features/onBoardingScreen/presentation/widgets/Custom_button.dart';
import '../../../../config/constants/app_colors.dart';

class Page1 extends StatefulWidget {
  final VoidCallback onTap;
  const Page1({super.key, required this.onTap});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> with TickerProviderStateMixin {
  var duration = 500;
  var addition = 200;
  bool animate = true;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInDown(
            // animate: animate,
            duration: Duration(milliseconds: duration),
            child: Image(
              height: size.height * 0.4,
              image: const AssetImage(AppImages.firstPageImage),
            ),
          ),
          SizedBox(
            height: .05 * size.height,
          ),
          FadeInDown(
            animate: animate,
            duration: Duration(milliseconds: duration + addition),
            child: const Text(
              '25k+  PREMIUM RECIPES',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.buttonColor1,
              ),
            ),
          ),
          SizedBox(
            height: .01 * size.height,
          ),
          FadeInDown(
            animate: animate,
            duration: Duration(milliseconds: duration + addition),
            child: Text("It's \nCooking \nTime !",
                style: Theme.of(context).textTheme.headlineLarge),
          ),
          SizedBox(
            height: .05 * size.height,
          ),
          FadeInDown(
            animate: animate,
            duration: Duration(milliseconds: duration + addition),
            child: CustomButton(
              onTap: () {
                widget.onTap();
                setState(
                  () {
                    animate = !animate;
                  },
                );
              },
              text: 'Get Started',
            ),
          )
        ],
      ),
    );
  }
}
