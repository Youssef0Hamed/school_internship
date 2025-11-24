import 'package:flutter/material.dart';

class EnterPhoneScreen extends StatelessWidget {
  const EnterPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20), 

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(
            "What's your phone number",
            style: TextStyle(
              fontSize: 25, 
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          Text(
            "We need to verify and secure your account",
            style: TextStyle(fontSize: 14),
          ),

          SizedBox(height: 40),

        ],
      ),
    );
  }
}
