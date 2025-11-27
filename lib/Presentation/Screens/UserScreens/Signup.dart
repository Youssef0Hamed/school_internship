import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intershipflutter/Constans/widget.dart';
import 'package:intershipflutter/Presentation/Screens/UserScreens/Login.dart';
import 'package:intershipflutter/businessLogic/InicatorProvider.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
  
}

class _SignupScreenState extends State<SignupScreen> {


  @override
  Widget build(BuildContext context) {
    @override

    final provider = Provider.of<Inicatorprovider>(context);
    return  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                            
                  Gap(30),
                  Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter-VariableFont_opsz,wght",
                    ),
                  ),
              
                  Gap(
                    65,
                  ),
              
                  // Email
                  Textfiled(" First name",),Gap(25,),
                  Textfiled(" Last name",),Gap(25,),
                  Textfiled(" Email",),Gap(25,),
                  Textfiled(" Password",),Gap(25,),
                 
                  Gap(
                    30,
                  ),
                  // Login button
                  mainbutton(
                    "Continue",
                    double.infinity,
                    50,
                    onPressed: () {
                       provider.pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut
                  );},
                  ),
              
                  Gap(
                    50,
                  ),
              
                  // OR login with
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Text(
                          "or login with",
              
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(
                              0xffB2B2B2,
                            ),
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
              
                  Gap(
                    50,
                  ),
              
                  // Social icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      socialIcon(
                        "https://cdn-icons-png.flaticon.com/512/3128/3128304.png",
                      ),
                      Gap(
                        40,
                      ),
                      socialIcon(
                        "https://cdn-icons-png.flaticon.com/128/300/300221.png",
                      ),
                      Gap(
                        40,
                      ),
                      socialIcon(
                        "https://cdn-icons-png.flaticon.com/512/731/731985.png",
                      ),
                    ],
                  ),
              
                  Spacer(),
              
                  // Register Now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                        },
                        child: Text(
                          "Log in",
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
              
                 
                ],
              );  
  }
}