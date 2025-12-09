import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/widgets/colors.dart';
import 'package:intershipflutter/Presentation/login_screens/signup screens/Signup.dart';
import 'package:intershipflutter/Presentation/login_screens/signup screens/doneScreen.dart';
import 'package:intershipflutter/Presentation/login_screens/signup screens/Phone_Input_Screen.dart';
import 'package:intershipflutter/Presentation/login_screens/signup screens/Verification_Screen.dart';
import 'package:intershipflutter/businessLogic/home provideres/InicatorProvider.dart';
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

    final isDark = Theme.of(context).brightness == Brightness.dark;

    void goToNextPage() {
      provider.pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.dark.backgroundColor : AppColors.light.backgroundColor,

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 20),

        child: Column(
          children: [

            /// TOP BAR (BACK ARROW + INDICATORS)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                /// Back Arrow
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
                          color: isDark
                              ? AppColors.dark.primary
                              : AppColors.light.primary,
                        ),
                      ),

                /// Progress Indicators
                Row(
                  children: List.generate(
                    4,
                    (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      margin: EdgeInsets.symmetric(horizontal: 2),

                      width: provider.currentindexuser == index ? 38 : 5,
                      height: 5,

                      decoration: BoxDecoration(
                        color: provider.currentindexuser == index
                            ? (isDark
                                ? AppColors.dark.primary
                                : AppColors.light.primary)
                            : (isDark ? Colors.white24 : Colors.grey.shade400),

                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// PAGEVIEW
            Expanded(
              child: PageView(
                controller: provider.pageController,
                onPageChanged: provider.changeScreensUsers,
                physics: NeverScrollableScrollPhysics(),

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