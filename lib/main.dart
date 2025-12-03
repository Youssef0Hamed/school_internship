import 'package:flutter/material.dart';
import 'package:intershipflutter/Presentation/Screens/favourite%20screen/favourite_screen.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/InicatorProvider.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/cuisine_provider.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/offer_provider.dart';
import 'package:intershipflutter/businessLogic/restaurant%20provider/restaurant_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OfferProvider()),
        ChangeNotifierProvider(create: (_) => CuisineProvider()),
        ChangeNotifierProvider(create: (_) => RestaurantProvider()),
        ChangeNotifierProvider(create: (_) => Inicatorprovider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Favourite_screen(),
    );
  }
}
