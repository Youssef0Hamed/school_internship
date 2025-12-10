import 'package:flutter/material.dart';
import 'package:intershipflutter/Presentation/admin_screens/edit_screen.dart';
import 'package:intershipflutter/Presentation/admin_screens/home_admin_screen.dart';
import 'package:intershipflutter/Presentation/Screens/home.dart';
import 'package:intershipflutter/Presentation/login_screens/signup%20screens/SignupHolder.dart';
import 'package:intershipflutter/businessLogic/Favorites%20provider/Favorites_resturant_provider.dart';
import 'package:intershipflutter/businessLogic/Theme_Provider.dart';
import 'package:intershipflutter/businessLogic/auth_provider.dart/auth_provider.dart';
import 'package:intershipflutter/businessLogic/booking_provider/booking_provider.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/InicatorProvider.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/cuisine_provider.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/offer_provider.dart';
import 'package:intershipflutter/businessLogic/restaurant%20provider/restaurant_provider.dart';
import 'package:intershipflutter/businessLogic/user%20provider/user_provider.dart';
import 'package:provider/provider.dart';


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
        ChangeNotifierProvider(create: (_) => FavoritesProvider ()),
        ChangeNotifierProvider(create: (_) => BookingProvider()),
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
      // home: const Signupholder(),
      home: HomePage(),
      // home: RestaurantListScreen(),
    );
  }
}
