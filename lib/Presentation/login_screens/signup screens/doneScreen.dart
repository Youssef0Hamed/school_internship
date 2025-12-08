import 'package:flutter/material.dart';
import '../../../Constans/widgets/colors.dart';

class Donescreen extends StatelessWidget {
  // Note: The original Signupholder code had a Donescreen without a nextPage callback,
  // but for consistency and future use, a callback is a good practice.
  // We will assume the button on this screen navigates away from the flow.
  const Donescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.light;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Thank you for being with ####",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "You won't regret choosing us",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              // In a real app, this would navigate to the main app home screen.
              // For this example, we'll just pop to the root.
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Start',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}