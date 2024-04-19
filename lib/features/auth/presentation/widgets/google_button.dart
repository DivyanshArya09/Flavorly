import 'package:flutter/material.dart';
import 'package:Flavorly/config/constants/app_colors.dart';
import 'package:Flavorly/config/constants/app_images.dart';

class SignInWithGoogleButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const SignInWithGoogleButton(
      {super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.darkGrey, width: 1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              height: 25,
              image: AssetImage(AppImages.googleIconImage),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(color: AppColors.darkGrey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
