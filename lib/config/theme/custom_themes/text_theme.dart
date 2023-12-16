import 'package:flutter/material.dart';

class CustomTextTheme {
  CustomTextTheme._(); // this makes the constructor private so no one could make its object out of this class so we can only access the static methods

  static TextTheme lightTextTheme = TextTheme(
      headlineLarge: const TextStyle().copyWith(
        color: Colors.black,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: const TextStyle().copyWith(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: const TextStyle().copyWith(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: const TextStyle().copyWith(
        color: Colors.grey,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ));
  static TextTheme darkTextTheme = TextTheme(
      headlineLarge: const TextStyle().copyWith(
        color: Colors.white,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: const TextStyle().copyWith(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: const TextStyle().copyWith(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: const TextStyle().copyWith(
        color: Colors.grey,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ));
}
