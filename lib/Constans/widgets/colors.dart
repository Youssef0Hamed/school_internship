
import 'package:flutter/material.dart';

class AppColorScheme {
  final Color primary;
  final Color text;
  final Color backgroundColor;
  final Color buttonColor;

  const AppColorScheme({
    required this.primary,
    required this.backgroundColor,
    required this.buttonColor,
    required this.text,
  });

  get surface => null;
}

class AppColors {
  // -------------------------
  // LIGHT THEME COLORS
  // -------------------------
  static final AppColorScheme light = AppColorScheme(
    primary: const Color(0xff085651),
    backgroundColor:Colors.white,
    buttonColor: const Color(0xFF00695C),
    text: const Color(0xff000000),
  );

  // -------------------------
  // DARK THEME COLORS
  // -------------------------
  static final AppColorScheme dark = AppColorScheme(
    primary: const Color(0xFF1F3A35),
    backgroundColor: const Color(0xFF061514),
    buttonColor: const Color(0xFF1F3A35),
    text: const Color(0xffffffff),
  );
}

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.light.backgroundColor,
  colorScheme: ColorScheme.light(
    primary: AppColors.light.primary,
    surface: AppColors.light.backgroundColor,
    onSurface: AppColors.light.text,
    onPrimary: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.light.buttonColor,
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.dark.backgroundColor,
  colorScheme: ColorScheme.dark(
    primary: AppColors.dark.primary,
    surface: AppColors.dark.backgroundColor,
    onSurface: AppColors.dark.text,
    onPrimary: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.dark.buttonColor,
    ),
  ),
);
