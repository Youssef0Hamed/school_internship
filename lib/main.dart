import 'package:flutter/material.dart';
import 'package:intershipflutter/Presentation/Screens/splashScreens/splashScreen.dart';
import 'package:intershipflutter/businessLogic/InicatorProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
ChangeNotifierProvider(create: (context) => Inicatorprovider(), child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
      home: splashScreen(),
    );
  }
}

