import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryYellow = Color(0xFFFFD93D);
  static const Color secondaryGreen = Color(0xFF6BCB77);
  static const Color accentCoral = Color(0xFFFF6B6B);
  static const Color neutralCream = Color(0xFFFFF8E1);
  static const Color textGray = Color(0xFF4A4A4A);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryYellow,
        brightness: Brightness.light,
        primary: primaryYellow,
        secondary: secondaryGreen,
        error: accentCoral,
        surface: neutralCream,
      ),
      scaffoldBackgroundColor: neutralCream,
      fontFamily: 'Nunito',
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontFamily: 'Nunito',
          fontWeight: FontWeight.bold,
          fontSize: 32,
          color: textGray,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Nunito',
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: textGray,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Nunito',
          fontSize: 18,
          color: textGray,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Nunito',
          fontSize: 16,
          color: textGray,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryYellow,
          foregroundColor: textGray,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
