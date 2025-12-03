import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:intershipflutter/Presentation/Screens/home%20screen/home_screen.dart';
import 'package:intershipflutter/Presentation/login_screens/splash%20Screen/splash_Screen.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/InicatorProvider.dart';
=======
import 'package:intershipflutter/Presentation/Screens/UserScreens/favouriteScreen.dart';
>>>>>>> main
import 'package:intershipflutter/businessLogic/home%20provideres/cuisine_provider.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/offer_provider.dart';
import 'package:intershipflutter/businessLogic/restaurant%20provider/restaurant_provider.dart';
import 'package:provider/provider.dart';


//hi
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
      home: Favouritescreen(),
    );
  }
}
