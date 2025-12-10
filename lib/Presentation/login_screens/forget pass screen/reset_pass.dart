import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController newPasswordController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  final Color mainGreenColor = const Color(0xFF0A5C54);

  @override
  void initState() {
    super.initState();

    // 👁️ أول ما المستخدم يكتب -> العين تفتح والباسورد يبان
    newPasswordController.addListener(() {
      if (newPasswordController.text.isNotEmpty &&
          _obscureNewPassword) {
        setState(() {
          _obscureNewPassword = false;
        });
      }
    });

    confirmPasswordController.addListener(() {
      if (confirmPasswordController.text.isNotEmpty &&
          _obscureConfirmPassword) {
        setState(() {
          _obscureConfirmPassword = false;
        });
      }
    });
  }

  InputDecoration _inputDecoration({
    required String hintText,
    required Widget suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

      // 🔲 Border العادي
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.grey),
      ),

      // ✅ Border عند الـ Focus
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: mainGreenColor, width: 2),
      ),

      suffixIcon: suffixIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // 🔹 Title
              const Text(
                'Forget password',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 24),

              // 🔐 New Password
              TextField(
                controller: newPasswordController,
                obscureText: _obscureNewPassword,
                enableInteractiveSelection: true,
                decoration: _inputDecoration(
                  hintText: 'Enter new Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureNewPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureNewPassword =
                            !_obscureNewPassword;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // 🔐 Confirm Password
              TextField(
                controller: confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                enableInteractiveSelection: true,
                decoration: _inputDecoration(
                  hintText: 'Confirm password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword =
                            !_obscureConfirmPassword;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ✅ Confirm Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: validate & submit
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainGreenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
