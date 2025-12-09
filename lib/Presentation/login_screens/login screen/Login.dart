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

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
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
                        fontFamily: "Inter-VariableFont_opsz,wght",
                      ),
                    ),

                    Gap(height * 0.08),

                    /// EMAIL FIELD
                    Textfiled("Enter Your Email"),

                    Gap(height * 0.03),

                    /// PASSWORD FIELD
                    TextField(
                      obscureText: !provider.show,
                      decoration: InputDecoration(
                        hintText: "Enter your Password",
                        hintStyle: TextStyle(fontSize: width * 0.04),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: height * 0.02,
                          horizontal: width * 0.04,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: Colors.grey.shade300),
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
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 1),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black87,
                                width: 1.2,
                              ),
                            ),
                          ),
                          child: Text(
                            "Forget password",
                            style: TextStyle(
                              fontSize: width * 0.035,
                              color: const Color(0xff3E3E3E),
                            ),
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
                            color: Colors.grey.shade300,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.03),
                          child: Text(
                            "or login with",
                            style: TextStyle(
                              fontSize: width * 0.04,
                              color: const Color(0xffB2B2B2),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),

                    Gap(height * 0.05),

                    /// SOCIAL ICONS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        socialIcon(
                            "https://cdn-icons-png.flaticon.com/512/3128/3128304.png"),
                        Gap(width * 0.1),
                        socialIcon(
                            "https://cdn-icons-png.flaticon.com/128/300/300221.png"),
                        Gap(width * 0.1),
                        socialIcon(
                            "https://cdn-icons-png.flaticon.com/512/731/731985.png"),
                      ],
                    ),

                    Gap(height * 0.08),

                    /// REGISTER SECTION
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(fontSize: width * 0.045),
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
            );
          },
        ),
      ),
    );
  }
}