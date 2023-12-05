import 'package:flutter/material.dart';
import 'package:recipe_app/config/constants/app_colors.dart';
import 'package:recipe_app/config/theme/custom_themes/text_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      primaryColor: AppColors.buttonColor1,
      scaffoldBackgroundColor: AppColors.white,
      textTheme: CustomTextTheme.lightTextTheme);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: AppColors.buttonColor1,
    scaffoldBackgroundColor: AppColors.black,
    textTheme: CustomTextTheme.darkTextTheme,
  );
}
