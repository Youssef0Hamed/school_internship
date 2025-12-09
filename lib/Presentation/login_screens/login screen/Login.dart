import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intershipflutter/Constans/widgets/login widgets/login_widgets.dart';
import 'package:intershipflutter/Presentation/Screens/home.dart';
import 'package:intershipflutter/Presentation/login_screens/signup screens/SignupHolder.dart';
import 'package:intershipflutter/businessLogic/home provideres/InicatorProvider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Inicatorprovider>(context);
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.06,
              vertical: height * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(height * 0.02),

                /// TITLE
                Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: width * 0.08,
                    fontWeight: FontWeight.w600,
                    color: colors.onSurface,
                  ),
                ),

                Gap(height * 0.08),

                /// EMAIL FIELD
                Textfiled("Enter Your Email"),

                Gap(height * 0.03),

                /// PASSWORD FIELD
                TextField(
                  obscureText: !provider.show,
                  style: TextStyle(color: colors.onSurface),
                  decoration: InputDecoration(
                    hintText: "Enter your Password",
                    hintStyle: TextStyle(
                      fontSize: width * 0.04,
                      color: colors.onSurface.withOpacity(0.6),
                    ),
                    filled: true,
                    fillColor: colors.surface,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: height * 0.02,
                      horizontal: width * 0.04,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide:
                          BorderSide(color: Colors.grey.shade600),
                    ),
                    suffixIcon: IconButton(
                      onPressed: provider.showpass,
                      icon: Icon(
                        provider.show
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: width * 0.05,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),

                Gap(height * 0.015),

                /// FORGOT PASSWORD
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Forget password",
                      style: TextStyle(
                        fontSize: width * 0.035,
                        color: colors.onSurface,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),

                Gap(height * 0.05),

                /// LOGIN BUTTON
                mainbutton(
                  "Login",
                  width * 0.88,
                  height * 0.065,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                ),

                Gap(height * 0.05),

                /// OR LOGIN WITH
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.03),
                      child: Text(
                        "or login with",
                        style: TextStyle(
                          fontSize: width * 0.04,
                          color: colors.onSurface.withOpacity(0.6),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),

                Gap(height * 0.05),

                /// SOCIAL ICONS
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

                Gap(height * 0.08),

                /// REGISTER SECTION
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: width * 0.045,
                        color: colors.onSurface,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => Signupholder()),
                        );
                      },
                      child: Text(
                        "Register Now",
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),

                Gap(height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}