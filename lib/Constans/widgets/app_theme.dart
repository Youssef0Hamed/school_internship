import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/widgets/colors.dart';

class AppTheme {
  static final _light = AppColors.light;
  static final _dark = AppColors.dark;

  // LIGHT THEME
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    primaryColor: _light.primary,
    scaffoldBackgroundColor: _light.backgroundColor,

    appBarTheme: AppBarTheme(
      backgroundColor: _light.primary,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: _light.titleColor),
      bodyMedium: TextStyle(color: _light.titleColor),
      bodySmall: TextStyle(color: _light.titleColor),
    ),

    cardColor: Colors.white,

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _light.buttonColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );

  // DARK THEME
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    primaryColor: _dark.primary,
    scaffoldBackgroundColor: _dark.backgroundColor,

    appBarTheme: AppBarTheme(
      backgroundColor: _dark.primary,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
      bodySmall: TextStyle(color: Colors.white70),
    ),

    cardColor: const Color(0xFF1E1E1E),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _dark.buttonColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}
