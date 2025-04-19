import 'package:flutter/material.dart';

class SignupController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void togglePasswordVisibility(StateSetter setState) {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void toggleConfirmPasswordVisibility(StateSetter setState) {
    setState(() {
      isConfirmPasswordVisible = !isConfirmPasswordVisible;
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

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return 'Please confirm your password';
    if (value != passwordController.text) return 'Passwords do not match';
    return null;
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
