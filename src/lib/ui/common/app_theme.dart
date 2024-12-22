import 'package:flutter/material.dart';
import 'package:my_app/ui/common/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: kcPrimaryColor,
    scaffoldBackgroundColor: kcBackgroundColor,
    colorScheme: ColorScheme.light(
      primary: kcPrimaryColor,
      secondary: kcSecondaryColor,
      error: kcErrorColor,
      background: kcBackgroundColor,
      surface: kcSurfaceColor,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: kcSurfaceColor,
      iconTheme: IconThemeData(color: kcTextColor),
      titleTextStyle: TextStyle(
        color: kcTextColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: kcDividerColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: kcDividerColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: kcPrimaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: kcErrorColor),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kcPrimaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: kcPrimaryColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: kcTextColor,
      ),
      displayMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: kcTextColor,
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: kcTextColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: kcTextColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: kcTextColor,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: kcTextColorLight,
      ),
    ),
  );
}
