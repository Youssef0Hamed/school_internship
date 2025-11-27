import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/colors.dart';
import 'package:intershipflutter/Presentation/Screens/splashScreens/onBoardingScreen.dart';


class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override State<splashScreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<splashScreen> {
@override 
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => onBoardingScreen(),));
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColors().backgroundColor,
      body: Align(
  alignment: Alignment.center,
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
   Stack(
  alignment: Alignment.center,
  children: [
    Transform.scale(
      scale: 1.7,
      child: Image.asset("assets/logo.png"),
    ),
    Positioned(
      top: 220,
      child: Image.asset(
        "assets/image.png",
        width: 230,
      ),
    )
  ],
),

      Text("La Reserva",style: TextStyle(
    fontFamily: "GreatVibes",
    fontSize: 76,
    fontWeight: FontWeight.w600,color: mainColors().primary
  ),
)
    ],
  ),
),
      
    );
  }
}