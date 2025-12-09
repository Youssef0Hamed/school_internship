import 'package:flutter/material.dart';
import 'package:intershipflutter/Presentation/Screens/home.dart';
import 'package:intershipflutter/Presentation/login_screens/signup%20screens/SignupHolder.dart';
import 'package:intershipflutter/businessLogic/Theme_Provider.dart';
import 'package:intershipflutter/businessLogic/auth_provider.dart/auth_provider.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/InicatorProvider.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/cuisine_provider.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/offer_provider.dart';
import 'package:intershipflutter/businessLogic/restaurant%20provider/restaurant_provider.dart';
import 'package:intershipflutter/businessLogic/user%20provider/user_provider.dart';

// Import AppTheme
import 'package:intershipflutter/Constans/widgets/app_theme.dart';

// Your Screens

// THEME PROVIDER
import 'package:intershipflutter/businessLogic/theme%20provider/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()), 
        ChangeNotifierProvider(create: (_) => OfferProvider()),
        ChangeNotifierProvider(create: (_) => CuisineProvider()),
        ChangeNotifierProvider(create: (_) => RestaurantProvider()),
        ChangeNotifierProvider(create: (_) => Inicatorprovider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),

        // ADD THE THEME PROVIDER HERE
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,
      themeMode: themeProvider.currentTheme,
      home: const HomePage(),
    );
  }
}