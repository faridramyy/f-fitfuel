import 'package:fitfuel/config/theme/theme_config.dart';
import 'package:fitfuel/features/login/login.dart';
import 'package:fitfuel/features/signup/signup.dart' show Signup;
import 'package:flutter/material.dart';
import 'features/onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => OnBoarding(),
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup(),
      },
    );
  }
}
