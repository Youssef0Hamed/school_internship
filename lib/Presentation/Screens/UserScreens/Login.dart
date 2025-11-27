import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intershipflutter/Constans/widget.dart';
import 'package:intershipflutter/Presentation/Screens/UserScreens/SignupHolder.dart';
import 'package:intershipflutter/businessLogic/InicatorProvider.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return   Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20 , vertical: 65),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 SizedBox(height: 25),
            
                 Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Inter-VariableFont_opsz,wght"
                  ),
                ),
            
                 Gap(95),
            
                // Email
               Textfiled("Enter Your Email"),
            
                 Gap(25),
            
                // Password
                TextField(
                  obscureText: !provider.show,
                  decoration: InputDecoration(
                    hintText: "Enter your Password",
                    hintStyle:  TextStyle(fontSize: 15),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding:
                         EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        provider.showpass();
                      },
                      icon: Icon(
                        provider.show ? Icons.visibility_off : Icons.visibility,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
            
            
              Gap(10),
                // Forget password
              Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.only(bottom: 0.4),
                      decoration: BoxDecoration(
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
                          fontSize: 12,
                          color: Color(0xff3E3E3E),
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(40),
                // Login button
               mainbutton("Login", double.infinity,50, onPressed: (){}),
            
                Gap(50),
            
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
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "or login with",
                        
                        style: TextStyle(fontSize: 15,color: Color(
                                0xffB2B2B2,
                              )),
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
            
                Gap(50),
            
                // Social icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialIcon("https://cdn-icons-png.flaticon.com/512/3128/3128304.png"),
                    Gap(40),
                    socialIcon("https://cdn-icons-png.flaticon.com/128/300/300221.png"),
                     Gap(40),
                    socialIcon("https://cdn-icons-png.flaticon.com/512/731/731985.png"),
                  ],
                ),
            
               Spacer(),
            
                // Register Now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: 17),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Signupholder(),));
                      },
                      child: Text(
                        "Register Now",
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
            
                const SizedBox(height: 20),
              ],
            ),
          );
        
        },
      ),
    );
  }

 
}
