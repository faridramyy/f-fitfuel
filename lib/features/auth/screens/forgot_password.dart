import 'package:fitfuel/common/widgets/app_snackbar.dart.dart';
import 'package:flutter/material.dart';
import 'package:fitfuel/features/auth/controllers/forgot_password.dart';
import 'package:fitfuel/theme/app_sizes.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final controller = ForgotPasswordController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.paddingXL),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: AppSizes.gapLarge),
              Image.asset(
                Theme.of(context).brightness == Brightness.dark
                    ? 'assets/images/app_logo_dark_removebg.png'
                    : 'assets/images/app_logo_light_removebg.png',
                height: 120,
              ),
              const SizedBox(height: AppSizes.gapLarge),
              Text(
                'Enter your email to receive a password reset link.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSizes.gapLarge),
              TextFormField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                validator: controller.validateEmail,
              ),
              const SizedBox(height: AppSizes.gapLarge),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () async {
                    if (!controller.formKey.currentState!.validate()) {
                      return;
                    }

                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder:
                          (context) =>
                              const Center(child: CircularProgressIndicator()),
                    );

                    final errorMessage =
                        await controller.handleForgotPassword();
                    Navigator.of(context).pop();

                    if (errorMessage == null) {
                      AppSnackbar.show(
                        context,
                        'Email sent successfully',
                        type: SnackType.success,
                      );
                    } else {
                      AppSnackbar.show(
                        context,
                        errorMessage,
                        type: SnackType.error,
                      );
                    }
                  },

                  child: const Text("Send Reset Link"),
                ),
              ),
              const SizedBox(height: AppSizes.gap),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text('Back to Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
