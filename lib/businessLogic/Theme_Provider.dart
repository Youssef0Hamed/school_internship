import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/widgets/colors.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = true;

  bool get isDark => _isDark;

  ThemeMode get currentTheme => _isDark ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme(bool isDarkMode) {
    _isDark = isDarkMode;
    notifyListeners();
  }

  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.light.primary,
        scaffoldBackgroundColor: AppColors.light.backgroundColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.light.buttonColor,
          ),
        ),
        colorScheme: ColorScheme.light(
          primary: AppColors.light.primary,
          background: AppColors.light.backgroundColor,
        ),
      );

  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.dark.primary,
        scaffoldBackgroundColor: AppColors.dark.backgroundColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.dark.buttonColor,
          ),
        ),
        colorScheme: ColorScheme.dark(
          primary: AppColors.dark.primary,
          background: AppColors.dark.backgroundColor,
        ),
      );
}