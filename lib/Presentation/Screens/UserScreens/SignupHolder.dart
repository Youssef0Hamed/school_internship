import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/colors.dart';
import 'package:intershipflutter/Presentation/Screens/UserScreens/Signup.dart';
import 'package:intershipflutter/Presentation/Screens/UserScreens/doneScreen.dart';
import 'package:intershipflutter/Presentation/Screens/UserScreens/enterPhone.dart';
import 'package:intershipflutter/Presentation/Screens/UserScreens/verifyPhone.dart';
import 'package:intershipflutter/businessLogic/InicatorProvider.dart';
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

    return Scaffold(
      backgroundColor: mainColors().backgroundColor,
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 45, horizontal: 20),

        child: Column(
          children: [

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
                          color: mainColors().primary,
                        ),
                      ),

                Row(
                  children: List.generate(
                    4,
                    (index) => Container(
                      margin:  EdgeInsets.symmetric(horizontal: 2),
                      width: provider.currentindexuser == index ? 38 : 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: provider.currentindexuser == index
                            ? mainColors().primary
                            : Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),



            Expanded(
              child: PageView(
                controller: provider.pageController,
                onPageChanged: provider.changeScreensUsers,
                children:  [
                  SignupScreen(),
                  EnterPhoneScreen(),
                  VerifyphoneScreen(),
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
