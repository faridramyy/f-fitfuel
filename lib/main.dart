import 'package:firebase_core/firebase_core.dart';
import 'package:fitfuel/firebase_options.dart';
import 'package:fitfuel/theme/app_theme.dart';
import 'package:fitfuel/routes/app_router.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fit Fuel',
      initialRoute: AppRoutes.mainNav,
      onGenerateRoute: AppRoutes.generateRoute,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
    );
  }
}
