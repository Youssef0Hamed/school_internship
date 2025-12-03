import 'package:flutter/material.dart';
import 'package:intershipflutter/Presentation/Screens/UserScreens/favouriteScreen.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/cuisine_provider.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/offer_provider.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/restaurant_provider.dart';
import 'package:provider/provider.dart';

//hi
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OfferProvider()),
        ChangeNotifierProvider(create: (_) => CuisineProvider()),
        ChangeNotifierProvider(create: (_) => RestaurantProvider()),
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
      home: Favouritescreen(),
    );
  }
}
