import 'package:fitfuel/config/theme/theme_config.dart';
import 'package:fitfuel/features/ai_trainer/ai_trainer.dart';
import 'package:fitfuel/features/login/login.dart';
import 'package:fitfuel/features/meals/meals.dart';
import 'package:fitfuel/features/profile/profile.dart';
import 'package:fitfuel/features/signup/signup.dart' show Signup;
import 'package:fitfuel/features/workouts/workouts.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'features/onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainNavigationScreen(),
        '/onboarding': (context) => OnBoarding(),
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup(),
      },
    );
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

  final List<Widget> _pages = [
    AiTrainer(),
    Workouts(),
    Meals(),
    Profile(),
    Signup(),
  ];

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
          BottomBarItem(
            icon: const Icon(Icons.sign_language),
            title: const Text('Signin'),
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
