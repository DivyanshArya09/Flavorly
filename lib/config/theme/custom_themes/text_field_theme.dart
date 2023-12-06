import 'package:flutter/material.dart';
import 'package:recipe_app/config/constants/app_colors.dart';

class CustomTextFieldTheme {
  static InputDecorationTheme inputDecorationThemeLightMode =
      InputDecorationTheme(
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
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      borderSide: BorderSide.none,
      // borderSide: BorderSide(color: AppColors.textColor, width: 1.5),
    ),
  );

  static InputDecorationTheme inputDecorationThemeDarkMode =
      InputDecorationTheme(
    filled: true,
    fillColor: AppColors.grey.withOpacity(.5),
    focusColor: AppColors.buttonColor1,
    iconColor: AppColors.buttonColor1,
    prefixIconColor: AppColors.grey,
    suffixIconColor: AppColors.grey,
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
    hintStyle: const TextStyle(
      color: AppColors.grey,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
    labelStyle: const TextStyle(
      color: AppColors.grey,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      borderSide: BorderSide.none,
      // borderSide: BorderSide(color: AppColors.textColor, width: 1.5),
    ),
  );
}
