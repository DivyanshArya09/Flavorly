import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/config/constants/app_images.dart';
import 'package:recipe_app/config/constants/app_strings.dart';
import 'package:recipe_app/config/constants/padding.dart';
import 'package:recipe_app/config/constants/styles.dart';

import '../../../../config/constants/animation_duration.dart';
import '../bloc/animation_bloc.dart';

class Page3 extends StatefulWidget {
  final AnimationBloc bloc;
  const Page3({super.key, required this.bloc});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(horizontalPadding),
      child: BlocListener<AnimationBloc, BlocState>(
        bloc: widget.bloc,
        listener: (context, state) {
          if (state is AnimateSecondPage) {
            controller.forward();
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppStrings.secondPageHeading,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            )
                .animate(
                  controller: controller,
                  onPlay: (controller) => controller.stop(),
                )
                .slideX(
                    end: -1,
                    begin: 0,
                    duration: Duration(milliseconds: duration))
                .fadeOut(),
            const SizedBox(
              height: verticalPadding,
            ),
            Text(
              AppStrings.secondPageQuote,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            )
                .animate(
                  controller: controller,
                  onPlay: (controller) => controller.stop(),
                )
                .slideX(
                    end: -1,
                    begin: 0,
                    duration: Duration(milliseconds: duration + addition))
                .fadeOut(),
            Image(
              height: size.height * 0.3,
              image: const AssetImage(AppImages.chef2Image),
            )
                .animate(
                  controller: controller,
                  onPlay: (controller) => controller.stop(),
                )
                .slideX(
                    end: -1,
                    begin: 0,
                    duration: Duration(milliseconds: duration + addition))
                .fadeOut(),
            // Text(count.toString()),
          ],
        ),
      ),
    );
  }
}
