import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/config/constants/app_images.dart';
import 'package:recipe_app/config/constants/app_strings.dart';
import 'package:recipe_app/config/constants/padding.dart';

import '../../../../config/constants/animation_duration.dart';
import '../bloc/animation_bloc.dart';

class Page2 extends StatefulWidget {
  final AnimationBloc bloc;
  const Page2({super.key, required this.bloc});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> with TickerProviderStateMixin {
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
      child: BlocListener<AnimationBloc, AnimationState>(
        bloc: widget.bloc,
        listener: (context, state) {
          if (state is AnimateFirstPage) {
            controller.forward();
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              height: size.height * 0.3,
              image: const AssetImage(AppImages.chef1Image),
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
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              AppStrings.firstPageHeading,
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
              AppStrings.firstPageQuote,
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
            // Text(count.toString()),
          ],
        ),
      ),
    );
  }
}
