import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/widgets/colors.dart';

/// -------------------------
/// MAIN BUTTON
/// -------------------------
Widget mainbutton(
  String text,
  double width,
  double height, {
  VoidCallback? onPressed,
}) {
  return Builder(
    builder: (context) {
      final isDark = Theme.of(context).brightness == Brightness.dark;

      return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                isDark ? AppColors.dark.primary : AppColors.light.primary,
            elevation: 6,
            shadowColor: Colors.black.withOpacity(0.25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
    },
  );
}

/// -------------------------
/// TEXT FIELD
/// -------------------------
Widget Textfiled(String hit_Text) {
  return Builder(
    builder: (context) {
      final isDark = Theme.of(context).brightness == Brightness.dark;

      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.3 : 0.1),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
          ),
          decoration: InputDecoration(
            hintText: hit_Text,
            hintStyle: TextStyle(
              fontSize: 15,
              color: isDark ? Colors.white70 : Colors.grey,
            ),
            filled: true,
            fillColor: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: isDark ? Colors.white24 : Colors.grey.shade300,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: isDark ? Colors.white24 : Colors.grey.shade300,
              ),
            ),
          ),
        ),
      );
    },
  );
}

/// -------------------------
/// SOCIAL ICON
/// -------------------------
Widget socialIcon(String url) {
  return Builder(
    builder: (context) {
      final isDark = Theme.of(context).brightness == Brightness.dark;

      return Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey.shade800 : Colors.white,
          borderRadius: BorderRadius.circular(35),
          border: Border.all(
            color: isDark ? Colors.white24 : Colors.black12,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withOpacity(0.5)
                  : Colors.grey.shade200,
              blurRadius: 6,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Image.network(
          url,
          height: 26,
          color: isDark ? Colors.white : null, // auto invert in dark mode
        ),
      );
    },
  );
}