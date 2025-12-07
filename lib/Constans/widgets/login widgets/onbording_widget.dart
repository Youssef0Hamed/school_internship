import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intershipflutter/Constans/widgets/colors.dart';
import 'package:intershipflutter/Presentation/login_screens/login screens/Login.dart';
import 'package:intershipflutter/Presentation/login_screens/signup screens/SignupHolder.dart';
import 'package:intershipflutter/businessLogic/home provideres/InicatorProvider.dart';
import 'package:provider/provider.dart';

class OnBoardingItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final PageController pageController;
  final bool isLast;

  const OnBoardingItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.pageController,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Inicatorprovider>(context);
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.03,
          horizontal: 20,
        ),
        child: Column(
          children: [
            // ⭐ TOP INDICATORS + SKIP
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    3,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width:
                          provider.currentindex == index
                              ? screenWidth * 0.10
                              : 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color:
                            provider.currentindex == index
                                ? mainColors().primary
                                : Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),

                InkWell(
                  onTap:
                      () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      ),
                  child: Row(
                    children: [
                      Text(
                        "Skip",
                        style: TextStyle(
                          color: mainColors().primary,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_right_sharp, size: 17),
                    ],
                  ),
                ),
              ],
            ),

            Gap(screenHeight * 0.05),

            // ⭐ RESPONSIVE IMAGE (NO OVERFLOW)
            Expanded(
              flex: 4,
              child: Transform.scale(
                scale: imagePath == "assets/dish.png" ? 1.5 : 1.0,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  width: screenWidth * 0.8,
                ),
              ),
            ),

            Gap(screenHeight * 0.03),

            // ⭐ TITLE
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.085,
                fontWeight: FontWeight.bold,
                fontFamily: "Inter-VariableFont_opsz,wght",
              ),
            ),

            Gap(screenHeight * 0.015),

            // ⭐ SUBTITLE
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontFamily: "Inter-VariableFont_opsz,wght",
              ),
            ),

            Gap(screenHeight * 0.04),

            // ⭐ BUTTONS (RESPONSIVE)
            if (!isLast)
              ElevatedButton(
                onPressed: () {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColors().primary,
                  minimumSize: Size(screenWidth * 0.7, screenHeight * 0.09),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.055,
                  ),
                ),
              )
            else
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColors().primary,
                      minimumSize: Size(screenWidth * 0.7, screenHeight * 0.09),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.06,
                      ),
                    ),
                  ),

                  Gap(screenHeight * 0.015),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Signupholder()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(screenWidth * 0.7, screenHeight * 0.09),
                      elevation: 0,
                      backgroundColor: Colors.white,
                      side: BorderSide(color: mainColors().primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: mainColors().primary,
                        fontSize: screenWidth * 0.06,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
