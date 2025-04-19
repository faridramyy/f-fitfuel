import 'package:fitfuel/features/auth/controllers/signup.dart';
import 'package:fitfuel/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:fitfuel/theme/app_sizes.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final controller = SignupController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
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
              const SizedBox(height: AppSizes.gap),
              StatefulBuilder(
                builder:
                    (context, setState) => TextFormField(
                      controller: controller.passwordController,
                      obscureText: !controller.isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed:
                              () =>
                                  controller.togglePasswordVisibility(setState),
                        ),
                      ),
                      validator: controller.validatePassword,
                    ),
              ),
              const SizedBox(height: AppSizes.gap),
              StatefulBuilder(
                builder:
                    (context, setState) => TextFormField(
                      controller: controller.confirmPasswordController,
                      obscureText: !controller.isConfirmPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: 'Confirm your password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed:
                              () => controller.toggleConfirmPasswordVisibility(
                                setState,
                              ),
                        ),
                      ),
                      validator: controller.validateConfirmPassword,
                    ),
              ),
              const SizedBox(height: AppSizes.gapLarge),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {}
                  },
                  child: const Text("Sign Up"),
                ),
              ),
              const SizedBox(height: AppSizes.gap),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.login);
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
