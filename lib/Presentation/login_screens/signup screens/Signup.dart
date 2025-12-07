import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intershipflutter/Constans/widgets/login widgets/login_widgets.dart';
import 'package:intershipflutter/Presentation/login_screens/login screens/Login.dart';

class SignupScreen extends StatelessWidget {
  final VoidCallback nextPage;

  const SignupScreen({super.key, required this.nextPage});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(height * 0.02),
            Text(
              "Sign up",
              style: TextStyle(
                fontSize: width * 0.08,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(height * 0.08),
            Textfiled("First name"),
            Gap(height * 0.025),
            Textfiled("Last name"),
            Gap(height * 0.025),
            Textfiled("Email"),
            Gap(height * 0.025),
            Textfiled("Password"),
            Gap(height * 0.045),

            // Continue button calls nextPage internally
            mainbutton(
              "Continue",
              double.infinity,
              height * 0.065,
              onPressed: nextPage,
            ),

            Gap(height * 0.06),

            Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Text("or login with"),
                ),
                Expanded(child: Divider()),
              ],
            ),

            Gap(height * 0.05),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                socialIcon("https://cdn-icons-png.flaticon.com/512/3128/3128304.png"),
                Gap(width * 0.1),
                socialIcon("https://cdn-icons-png.flaticon.com/128/300/300221.png"),
                Gap(width * 0.1),
                socialIcon("https://cdn-icons-png.flaticon.com/512/731/731985.png"),
              ],
            ),

            Gap(height * 0.06),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account "),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                    );
                  },
                  child: Text(
                    "Log in",
                    style: TextStyle(color: Colors.teal),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}