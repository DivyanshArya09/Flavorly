import 'package:flutter/material.dart';
import 'package:recipe_app/config/constants/app_colors.dart';

class GetInstructionsButton extends StatefulWidget {
  const GetInstructionsButton({super.key});

  @override
  State<GetInstructionsButton> createState() => _GetInstructionsButtonState();
}

class _GetInstructionsButtonState extends State<GetInstructionsButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.buttonColor1),
        child: const Text(
          'Get Instructions',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
