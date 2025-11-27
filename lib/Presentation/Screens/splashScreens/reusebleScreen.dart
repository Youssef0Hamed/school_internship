import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intershipflutter/Constans/colors.dart';
import 'package:intershipflutter/Presentation/Screens/UserScreens/Login.dart';
import 'package:intershipflutter/Presentation/Screens/UserScreens/SignupHolder.dart';
import 'package:intershipflutter/businessLogic/InicatorProvider.dart';
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

    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        children: [
        
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: List.generate(
                  3,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: provider.currentindex == index ? 38 : 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: provider.currentindex == index
                          ? mainColors().primary
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                },
                child: Row(
                  children: [
                    Text(
                      "Skip",
                      style: TextStyle(
                        color: mainColors().primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                     Icon(Icons.keyboard_arrow_right_sharp, size: 17),
                  ],
                ),
              )
            ],
          ),

          const Gap(60),

          Transform.scale(
            scale: imagePath == "assets/dish.png" ? 1.7 : 1.0,
            child: Image.asset(imagePath, height: 400),
          ),

          const Gap(30),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontFamily: "Inter-VariableFont_opsz,wght",
            ),
          ),

          const Gap(15),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: "Inter-VariableFont_opsz,wght",
            ),
          ),

          const Gap(40),


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
                minimumSize:  Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 23),
              ),
            )
          else
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColors().primary,
                    minimumSize:  Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child:  Text("Log in",
                      style: TextStyle(color: Colors.white)),
                ),
                 Gap(12),
                            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signupholder()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  elevation: 0,
                  backgroundColor: Colors.white,
                  side: BorderSide(color: mainColors().primary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Sign up",
                  style: TextStyle(color: mainColors().primary),
                ),
              ),

              ],
            )
        ],
      ),
    );
  }
}
