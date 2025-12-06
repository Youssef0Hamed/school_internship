import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/widgets/colors.dart';
import 'package:intershipflutter/Presentation/login_screens/onbording_screens/onBoarding_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0;
  double _scale = 0.85;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _opacity = 1;
        _scale = 1;
      });
    });
    // ⭐ Navigate after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const onBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final logoWidth = size.width * 0.55; // Responsive width
    final bottomImageWidth = size.width * 0.6;

    return Scaffold(
      backgroundColor: mainColors().backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // ⭐ Logo Animation
              AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOut,
                opacity: _opacity,
                child: AnimatedScale(
                  scale: _scale,
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeOutBack,
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Transform.scale(
                        scale: 3.5,
                        child: Image.asset(
                          "assets/logo.png",
                          width: logoWidth,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        bottom: -bottomImageWidth * 0.3,
                        child: Image.asset(
                          "assets/image.png",
                          width: bottomImageWidth,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.08),

              AnimatedOpacity(
                duration: const Duration(milliseconds: 1200),
                opacity: _opacity,
                child: Text(
                  "La Reserva",
                  style: TextStyle(
                    fontFamily: "GreatVibes",
                    fontSize: size.width * 0.12, // Responsive text
                    fontWeight: FontWeight.w600,
                    color: mainColors().primary,
                    shadows: [
                      Shadow(
                        color: mainColors().primary.withOpacity(0.25),
                        blurRadius: 6,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}