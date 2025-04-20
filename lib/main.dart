import 'package:firebase_core/firebase_core.dart';
import 'package:fitfuel/firebase_options.dart';
import 'package:fitfuel/theme/app_theme.dart';
import 'package:fitfuel/routes/app_router.dart';
import 'package:fitfuel/features/auth/providers/auth_provider.dart';
import 'package:fitfuel/features/onboarding/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fit Fuel',
        home: Consumer<AuthProvider>(
          builder: (context, authProvider, _) {
            // Show loading indicator while checking auth state
            if (!authProvider.isInitialized) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            // If user is authenticated, go to main navigation
            if (authProvider.isAuthenticated) {
              return const MainNavigationScreen();
            }

            // Otherwise, show onboarding
            return const Onboarding();
          },
        ),
        onGenerateRoute: AppRoutes.generateRoute,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
      ),
    );
  }
}
