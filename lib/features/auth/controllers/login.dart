import 'package:flutter/material.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;

  void togglePasswordVisibility(StateSetter setState) {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your password';
    return null;
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
