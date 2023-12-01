import 'package:flutter/material.dart';
import 'package:recipe_app/config/constants/app_colors.dart';
import 'package:recipe_app/config/constants/app_images.dart';

class SignInWithGoogleButton extends StatelessWidget {
  const SignInWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.darkGrey, width: 1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              height: 25,
              image: AssetImage(AppImages.googleIconImage),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Sign in with Google',
              style: TextStyle(color: AppColors.darkGrey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
