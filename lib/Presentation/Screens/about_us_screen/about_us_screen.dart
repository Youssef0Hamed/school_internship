import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/widgets/colors.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: mainColors().primary,
          size: 30,
          fontWeight: FontWeight.bold,
        ),
        title: Text(
          "About us",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              // 🔹 Logo + App Name
              Center(
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: Image.asset("assets/logo.png"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10, width: 20),
                    const Text(
                      "La Reserva",
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff0E5A4F),
                        fontFamily: "GreatVibes",
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // 🔹 Description
              const Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                "“La Reserva is a smart restaurant reservation app that helps you find, book, and manage your dining experiences easily and quickly.”",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 30),

              // 🔹 Legal & Support
              const Text(
                "Legal & Support",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "Contact Support",
                style: TextStyle(fontSize: 14, color: mainColors().primary),
              ),
              SizedBox(height: 7),
              Text(
                "Privacy Policy",
                style: TextStyle(fontSize: 14, color: mainColors().primary),
              ),
              SizedBox(height: 7),
              Text(
                "Terms of Service",
                style: TextStyle(fontSize: 14, color: mainColors().primary),
              ),
              SizedBox(height: 7),
              Text(
                "License Information",
                style: TextStyle(fontSize: 14, color: mainColors().primary),
              ),
              SizedBox(height: 12),

              Spacer(),

              // 🔹 Footer text
              const Center(
                child: Text(
                  "Special thanks to our team and early testers.",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(height: 6),
              const Center(
                child: Text(
                  "© 2025 All rights reserved.",
                  style: TextStyle(fontSize: 12),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Social Icons
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                
                ],
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
