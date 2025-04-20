import 'package:fitfuel/features/ai_trainer/ai_trainer.dart';
import 'package:fitfuel/features/auth/screens/forgot_password.dart';
import 'package:fitfuel/features/meals/meals.dart';
import 'package:fitfuel/features/onboarding/screens/onboarding.dart';
import 'package:fitfuel/features/auth/screens/signup.dart';
import 'package:fitfuel/features/auth/screens/login.dart';
import 'package:fitfuel/features/workouts/screens/workouts.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class AppRoutes {
  static const String onboarding = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgotPassword';
  static const String mainNav = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (_) => const Onboarding());
      case login:
        return MaterialPageRoute(builder: (_) => const Login());
      case signup:
        return MaterialPageRoute(builder: (_) => const Signup());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case mainNav:
        return MaterialPageRoute(builder: (_) => const MainNavigationScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
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
  int selected = 0;
  final PageController controller = PageController();

  final List<Widget> _pages = [AiTrainer(), Workouts(), Meals(), Signup()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe
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
