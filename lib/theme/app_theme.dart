import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,

      // Primary
      primary: AppColors.logoGreen,
      onPrimary: AppColors.systemWhite,

      // Background
      background: AppColors.systemGray06Light,
      onBackground: AppColors.systemGray05Dark,

      // Secondary
      secondary: AppColors.systemGray05Dark,
      onSecondary: AppColors.systemGray06Light,

      // Surface
      surface: AppColors.systemGray06Light,
      onSurface: AppColors.systemGray05Dark,

      // Tertiary
      tertiary: AppColors.systemGray04Light,
      onTertiary: AppColors.systemGray05Dark,

      // Error
      error: Color(0xFFFF0000),
      onError: AppColors.systemGray06Light,
    ),
    scaffoldBackgroundColor: const Color(0xFFEBEBF0),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFEBEBF0),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontFamily: "SF-Pro"),
      bodyMedium: TextStyle(fontFamily: "SF-Pro"),
      bodySmall: TextStyle(fontFamily: "SF-Pro"),
      displayLarge: TextStyle(fontFamily: "SF-Pro"),
      displayMedium: TextStyle(fontFamily: "SF-Pro"),
      displaySmall: TextStyle(fontFamily: "SF-Pro"),
      headlineLarge: TextStyle(fontFamily: "SF-Pro"),
      headlineMedium: TextStyle(fontFamily: "SF-Pro"),
      headlineSmall: TextStyle(fontFamily: "SF-Pro"),
      labelLarge: TextStyle(fontFamily: "SF-Pro"),
      labelMedium: TextStyle(fontFamily: "SF-Pro"),
      labelSmall: TextStyle(fontFamily: "SF-Pro"),
      titleLarge: TextStyle(fontFamily: "SF-Pro"),
      titleMedium: TextStyle(fontFamily: "SF-Pro"),
      titleSmall: TextStyle(fontFamily: "SF-Pro"),
    ),
  );

  // static final darkTheme = ThemeData(
  //   scaffoldBackgroundColor: const Color(0xFF181A21),
  //   primaryColor: const Color(0xFF07C6A3),
  //   colorScheme: const ColorScheme(
  //     brightness: Brightness.dark,
  //     primary: Color(0xFF017862),
  //     onPrimary: Colors.white,
  //     // Ama ta esta zyayaya
  //     secondary: Color(0xFFCFFFF6),
  //     onSecondary: Colors.white,
  //     //
  //     error: Color(0xFFFF0000),
  //     onError: Colors.white,
  //     background: Color(0xFF181A21),
  //     onBackground: Colors.white,
  //     surface: Color(0xFF22262F),
  //     onSurface: Colors.white,
  //   ),
  // );
}

class AppColors {
  static const transparent = Colors.transparent;

  static const systemRed = Colors.red;

  static const systemWhite = Colors.white;

  /// Color(0xFF47A75D)
  static const logoGreen = Color(0xFF47A75D);

  /// Color(0xFF000000)
  static const logoBlack = Color(0xFF000000);

  /// Color(0xFF6C6C70)
  static const systemGray = Color(0xFF6C6C70);

  /// Color(0xFF8E8E93)
  static const systemGray02Light = Color(0xFF8E8E93);

  /// Color(0xFFAEAEB2)
  static const systemGray03Light = Color(0xFFAEAEB2);

  /// Color(0xFFBCBCC0)
  static const systemGray04Light = Color(0xFFBCBCC0);

  /// Color(0xFFD8D8DC)
  static const systemGray05Light = Color(0xFFD8D8DC);

  /// Color(0xFFEBEBF0)
  static const systemGray06Light = Color(0xFFEBEBF0);

  /// Color(0xFF2C2C2E)
  static const systemGray05Dark = Color(0xFF2C2C2E);
}
