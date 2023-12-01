import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:recipe_app/features/onBoardingScreen/presentation/pages/page1.dart';
import 'package:recipe_app/features/onBoardingScreen/presentation/pages/page2.dart';
import 'package:recipe_app/features/onBoardingScreen/presentation/pages/page3.dart';
import 'package:recipe_app/features/onBoardingScreen/presentation/pages/page4.dart';
import 'package:recipe_app/features/onBoardingScreen/presentation/widgets/animated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../config/constants/app_colors.dart';
import '../bloc/bloc_bloc.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({super.key});

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  late PageController verticalController;
  late PageController horizontalController;

  bool isLastPage = true;

  @override
  void initState() {
    super.initState();
    verticalController = PageController(initialPage: 0);
    horizontalController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    verticalController.dispose();
    horizontalController.dispose();
    super.dispose();
  }

  BlocBloc blocBloc = BlocBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isLastPage
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.chevron_left,
                              color: AppColors.buttonColor1,
                              size: 40,
                            )),
                        TextButton(
                          onPressed: () {},
                          child: const Text('skip',
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ])
                      .animate()
                      .slideY(
                          duration: const Duration(milliseconds: 600),
                          begin: -1,
                          end: 0)
                      .fadeIn(duration: const Duration(milliseconds: 800)),
                ),
          Expanded(
            child: PageView(
              controller: verticalController,
              scrollDirection: Axis.vertical,
              physics: !isLastPage
                  ? const NeverScrollableScrollPhysics()
                  : const BouncingScrollPhysics(),
              children: [
                Page1(
                  onTap: () {
                    setState(
                      () {
                        isLastPage = false;
                      },
                    );
                    verticalController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 1800),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: PageView(
                          controller: horizontalController,
                          children: [
                            Page2(
                              bloc: blocBloc,
                            ),
                            Page3(
                              bloc: blocBloc,
                            ),
                            const Page4(),
                          ],
                        ),
                      ),
                      SmoothPageIndicator(
                          controller: horizontalController,
                          count: 3,
                          effect: const WormEffect(
                            activeDotColor: AppColors.buttonColor1,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      TweenAnimate(
                        bloc: blocBloc,
                        onTap: () {
                          _animatePage();
                          horizontalController.nextPage(
                            duration: const Duration(milliseconds: 1300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _animatePage() {
    switch (horizontalController.page) {
      case 0:
        blocBloc.add(StartFirstPageAnimation());
        break;
      case 1:
        blocBloc.add(StartSecondPageAnimation());
      default:
    }
  }
}
