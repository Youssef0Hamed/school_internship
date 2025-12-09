import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/widgets/my%20orders%20widgets/my_orders_widgets.dart';
import 'package:intershipflutter/Constans/widgets/my%20orders%20widgets/upcoming_history_widget.dart';
import 'package:intershipflutter/Presentation/Screens/about_us_screen/about_us_screen.dart';
import 'package:intershipflutter/Presentation/Screens/my%20orders/my_orders.dart';
import 'package:intershipflutter/Presentation/Screens/profile%20menu%20screen/profile_menu_screen.dart';
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
        ChangeNotifierProvider(create: (_) => OfferProvider()),
        ChangeNotifierProvider(create: (_) => CuisineProvider()),
        ChangeNotifierProvider(create: (_) => RestaurantProvider()),
        ChangeNotifierProvider(create: (_) => Inicatorprovider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
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
      home: MyOrdersScreen(),
    );
  }
}
