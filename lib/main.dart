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
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => OnBoarding(),
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyApp')),
      body: const Center(child: Text('Hello, World!')),
    );
  }
}
