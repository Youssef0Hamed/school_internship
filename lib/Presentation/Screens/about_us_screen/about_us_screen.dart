import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colors.primary, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "About us",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: colors.onBackground,
          ),
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

              /// Logo + App Name
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.asset(
                      "assets/logo2.png",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.restaurant, size: 80),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "La Reserva",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w500,
                      color: colors.primary,
                      fontFamily: "GreatVibes",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              /// Description
              Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: colors.onBackground,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "“La Reserva is a smart restaurant reservation app that helps you find, "
                "book, and manage your dining experiences easily and quickly.”",
                style: TextStyle(
                  fontSize: 14,
                  color: colors.onBackground,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 30),

              /// Legal & Support
              Text(
                "Legal & Support",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: colors.onBackground,
                ),
              ),
              const SizedBox(height: 10),

              Text("Contact Support",
                  style: TextStyle(fontSize: 14, color: colors.primary)),
              const SizedBox(height: 7),

              Text("Privacy Policy",
                  style: TextStyle(fontSize: 14, color: colors.primary)),
              const SizedBox(height: 7),

              Text("Terms of Service",
                  style: TextStyle(fontSize: 14, color: colors.primary)),
              const SizedBox(height: 7),

              Text("License Information",
                  style: TextStyle(fontSize: 14, color: colors.primary)),
              const SizedBox(height: 12),

              const Spacer(),

              /// Footer
              Center(
                child: Text(
                  "Special thanks to our team and early testers.",
                  style: TextStyle(
                    fontSize: 12,
                    color: colors.onBackground,
                  ),
                ),
              ),
              const SizedBox(height: 6),

              Center(
                child: Text(
                  "© 2025 All rights reserved.",
                  style: TextStyle(
                    fontSize: 12,
                    color: colors.onBackground,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// Social Icons Placeholder
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [],
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
