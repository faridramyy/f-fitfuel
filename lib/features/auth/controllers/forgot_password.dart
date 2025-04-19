import 'package:flutter/material.dart';

class ForgotPasswordController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';
    return null;
  }

  void dispose() {
    emailController.dispose();
  }
}
