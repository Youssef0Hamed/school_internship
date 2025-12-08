import 'package:flutter/material.dart';

class AppColorScheme {
  final Color primary;

  final Color backgroundColor;
  final Color buttonColor;

  const AppColorScheme({
    required this.primary,

    required this.backgroundColor,
    required this.buttonColor,
  });
}

class AppColors {
  // -------------------------
  // LIGHT THEME COLORS
  // -------------------------
  static final AppColorScheme light = AppColorScheme(
    primary: const Color(0xff085651),
    backgroundColor: const Color(0xffB4B4B4).withOpacity(0.3),
    buttonColor: const Color(0xFF00695C),
  );

  // -------------------------
  // DARK THEME COLORS
  // -------------------------
  static final AppColorScheme dark = AppColorScheme(
    primary: const Color(0xFF1F3A35),
    backgroundColor: const Color(0xFF061514),
    buttonColor: const Color(0xFF1F3A35),
  );
}
