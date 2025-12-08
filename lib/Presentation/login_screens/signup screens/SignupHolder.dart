import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/widgets/colors.dart';
import 'package:intershipflutter/Presentation/login_screens/signup%20screens/Signup.dart';
import 'package:intershipflutter/Presentation/login_screens/signup%20screens/doneScreen.dart';
import 'package:intershipflutter/Presentation/login_screens/signup%20screens/Phone_Input_Screen.dart';
import 'package:intershipflutter/Presentation/login_screens/signup%20screens/Verification_Screen.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/InicatorProvider.dart';
import 'package:provider/provider.dart';

class Signupholder extends StatefulWidget {
  const Signupholder({super.key});

  @override
  State<Signupholder> createState() => _SignupholderState();
}

class _SignupholderState extends State<Signupholder> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Inicatorprovider>(context);

    void goToNextPage() {
      provider.pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      backgroundColor: AppColors.light.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 20),
        child: Column(
          children: [
            // Top row with back arrow and indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                provider.currentindexuser == 0
                    ? SizedBox(width: 24)
                    : GestureDetector(
                        onTap: () {
                          provider.pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 22,
                          color: AppColors.light.primary,
                        ),
                      ),
                Row(
                  children: List.generate(
                    4,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      width: provider.currentindexuser == index ? 38 : 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: provider.currentindexuser == index
                            ? AppColors.light.primary
                            : Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // PageView
            Expanded(
              child: PageView(
                controller: provider.pageController,
                onPageChanged: provider.changeScreensUsers,
                physics: NeverScrollableScrollPhysics(), // prevent swipe if you want controlled navigation
                children: [
                  SignupScreen(nextPage: goToNextPage),
                  PhoneInputScreen(nextPage: goToNextPage),
                  VerificationScreen(nextPage: goToNextPage),
                  Donescreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}