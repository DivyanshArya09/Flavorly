import 'package:Flavorly/config/constants/app_colors.dart';
import 'package:Flavorly/config/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

import 'custom_themes/text_field_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: AppColors.buttonColor1,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: CustomTextTheme.lightTextTheme,
    inputDecorationTheme: CustomTextFieldTheme.inputDecorationThemeLightMode,
    cardColor: Colors.white,
    // cardColor:
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: AppColors.buttonColor1,
    scaffoldBackgroundColor: const Color.fromARGB(255, 54, 54, 54),
    textTheme: CustomTextTheme.darkTextTheme,
    inputDecorationTheme: CustomTextFieldTheme.inputDecorationThemeDarkMode,
    cardColor: const Color.fromARGB(255, 54, 54, 54),
  );
}
