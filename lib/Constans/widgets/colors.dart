
import 'package:flutter/material.dart';

class AppColorScheme {
  final Color primary;
  final Color titleColor;
  final Color backgroundColor;
  final Color buttonColor;

  const AppColorScheme({
    required this.primary,
    required this.titleColor,
    required this.backgroundColor,
    required this.buttonColor,
  });
}

class AppColors {
  // -------------------------
  // LIGHT THEME COLORS
  // -------------------------
  static const AppColorScheme light = AppColorScheme(
    primary: Color(0xff085651),
    titleColor: Color(0xff2E3A38),
    backgroundColor: Color(0xffEEEEEE),
    buttonColor: Color(0xFF00695C),
  );

  // -------------------------
  // DARK THEME COLORS
  // -------------------------
  static const AppColorScheme dark = AppColorScheme(
    primary: Color(0xFF1F3A35),
    titleColor: Color(0xFFE0E0E0), // FIX: Changed from dark color to light color for dark theme
    backgroundColor: Color(0xFF061514),
    buttonColor: Color(0xFF1F3A35),
  );
}
