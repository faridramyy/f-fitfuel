import 'package:fitfuel/features/ai_trainer/ai_trainer.dart';
import 'package:fitfuel/features/auth/screens/forgot_password.dart';
import 'package:fitfuel/features/meals/meals.dart';
import 'package:fitfuel/features/onboarding/screens/onboarding.dart';
import 'package:fitfuel/features/auth/screens/signup.dart';
import 'package:fitfuel/features/auth/screens/login.dart';
import 'package:fitfuel/features/profile/profile.dart';
import 'package:fitfuel/features/workouts/screens/workouts.dart';
import 'package:fitfuel/features/auth/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class AppRoutes {
  static const String onboarding = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgotPassword';
  static const String mainNav = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        final isAuthenticated = authProvider.isAuthenticated;

        // Public routes that don't require authentication
        if (settings.name == onboarding ||
            settings.name == login ||
            settings.name == signup ||
            settings.name == forgotPassword) {
          return _buildRoute(settings);
        }

        // Protected routes that require authentication
        if (!isAuthenticated) {
          return const Login();
        }

        return _buildRoute(settings);
      },
    );
  }

  static Widget _buildRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return const Onboarding();
      case login:
        return const Login();
      case signup:
        return const Signup();
      case forgotPassword:
        return const ForgotPassword();
      case mainNav:
        return const MainNavigationScreen();
      default:
        return Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        );
    }
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int selected = 1;
  late final PageController controller;

  final List<Widget> _pages = [AiTrainer(), Workouts(), Meals(), Profile()];

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: selected);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: StylishBottomBar(
        option: BubbleBarOptions(
          barStyle: BubbleBarStyle.vertical,
          opacity: 0.3,
        ),
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        items: [
          BottomBarItem(
            icon: const Icon(Icons.people_outline_sharp),
            title: const Text('My trainer'),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomBarItem(
            icon: const Icon(Icons.fitness_center_outlined),
            title: const Text('Workouts'),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomBarItem(
            icon: const Icon(Icons.food_bank_outlined),
            title: const Text('Meals'),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomBarItem(
            icon: const Icon(Icons.person_outline),
            title: const Text('Profile'),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
        hasNotch: true,
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
            controller.jumpToPage(index);
          });
        },
      ),
    );
  }
}
