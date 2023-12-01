import 'package:flutter/material.dart';
import 'package:recipe_app/config/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Icon icon;
  final IconButton? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    required this.icon,
    this.suffixIcon,
    this.onSuffixIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.grey.withOpacity(.5),
          focusColor: AppColors.buttonColor1,
          iconColor: AppColors.buttonColor1,
          prefixIconColor: AppColors.darkGrey,
          suffixIconColor: AppColors.darkGrey,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(color: AppColors.buttonColor1, width: .7),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.darkGrey,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
          labelStyle: const TextStyle(
            color: AppColors.darkGrey,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
          prefixIcon: icon,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide.none,
            // borderSide: BorderSide(color: AppColors.textColor, width: 1.5),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
