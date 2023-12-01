import 'package:flutter/material.dart';

import '../../../../config/constants/app_colors.dart';

class SignUpLoginButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  const SignUpLoginButton(
      {super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          color: AppColors.buttonColor1,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
