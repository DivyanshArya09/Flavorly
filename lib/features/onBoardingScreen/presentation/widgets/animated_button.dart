import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/auth/presentation/pages/login_page.dart';

import '../../../../config/constants/app_colors.dart';
import '../bloc/animation_bloc.dart';

class TweenAnimate extends StatefulWidget {
  final AnimationBloc bloc;
  final VoidCallback onTap;
  const TweenAnimate({super.key, required this.bloc, required this.onTap});

  @override
  State<TweenAnimate> createState() => _TweenAnimateState();
}

class _TweenAnimateState extends State<TweenAnimate>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = Tween<double>(begin: 60, end: 200).animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: BlocListener<AnimationBloc, AnimationState>(
        bloc: widget.bloc,
        listener: (context, state) {
          if (state is AnimateSecondPage) {
            controller.forward();
          }
        },
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                        width: animation.value,
                        height: animation.value > 60 ? 50 : 60,
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor1,
                          borderRadius: animation.value > 60
                              ? BorderRadius.circular(10)
                              : BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisAlignment: animation.value == 200
                              ? MainAxisAlignment.spaceEvenly
                              : MainAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: animation.value == 200,
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ).animate().fadeIn(
                                  duration: const Duration(milliseconds: 500)),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ))
                    .animate(
                        controller: controller,
                        onPlay: (controller) => controller.stop())
                    .slideY(
                        begin: 0,
                        end: .7,
                        duration: const Duration(seconds: 1)),
                const SizedBox(
                  height: 40,
                ),
                AnimatedOpacity(
                  opacity: animation.value > 85 ? 1 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ?',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.buttonColor1,
                        ),
                        child: Text(
                          'Login',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
