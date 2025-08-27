import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final themeData = ThemeData(
    primaryColor: AppPalettes.primary,
    scaffoldBackgroundColor: AppPalettes.background,
    brightness: Brightness.dark,
    fontFamily: 'CircularStd',
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppPalettes.background,
      contentTextStyle: TextStyle(color: AppPalettes.offWhite),
    ),

    // TextField Decoration
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppPalettes.secondBackground,
      hintStyle: const TextStyle(
        color: AppPalettes.hintTextColor,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide.none,
      ),
    ),

    // Button Theme Style
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPalettes.primary,
        elevation: 0,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    ),
  );
}
