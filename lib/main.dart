import 'package:flutter/material.dart';
import 'package:intershipflutter/Presentation/Screens/home%20screen/home_screen.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/cuisine_provider.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/offer_provider.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/restaurant_provider.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OfferProvider()),
        ChangeNotifierProvider(create: (_) => CuisineProvider()),
        ChangeNotifierProvider(create: (_) => RestaurantProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}