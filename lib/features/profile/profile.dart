import 'package:fitfuel/features/auth/providers/auth_provider.dart';
import 'package:fitfuel/features/profile/providers/theme_provider.dart';
import 'package:fitfuel/features/profile/providers/language_provider.dart';
import 'package:fitfuel/features/profile/screens/edit_profile.dart';
import 'package:fitfuel/routes/app_router.dart';
import 'package:fitfuel/theme/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final userName = authProvider.userName;
    final userEmail = authProvider.userEmail;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authProvider.signOut();
              if (context.mounted) {
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: AppSizes.gapLarge),
            CircleAvatar(
              radius: 50,
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(
                userName?[0].toUpperCase() ?? 'U',
                style: const TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
            const SizedBox(height: AppSizes.gapLarge),
            Text(
              userName ?? 'User',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSizes.gap),
            Text(userEmail ?? '', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: AppSizes.gapLarge * 2),
            _buildProfileSection(
              context,
              title: 'Dashboard',
              items: [
                _ProfileMenuItem(
                  icon: Icons.dashboard_outlined,
                  title: 'My Dashboard',
                  onTap: () {
                    // TODO: Implement dashboard navigation
                  },
                ),
                _ProfileMenuItem(
                  icon: Icons.fitness_center_outlined,
                  title: 'Workout History',
                  onTap: () {
                    // TODO: Implement workout history
                  },
                ),
                _ProfileMenuItem(
                  icon: Icons.restaurant_menu_outlined,
                  title: 'Meal History',
                  onTap: () {
                    // TODO: Implement meal history
                  },
                ),
              ],
            ),
            const SizedBox(height: AppSizes.gapLarge),
            _buildProfileSection(
              context,
              title: 'Account Settings',
              items: [
                _ProfileMenuItem(
                  icon: Icons.person_outline,
                  title: 'Edit Profile',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfile(),
                      ),
                    );
                  },
                ),
                _ProfileMenuItem(
                  icon: Icons.notifications_outlined,
                  title: 'Notifications',
                  onTap: () {
                    // TODO: Implement notifications settings
                  },
                ),
                _ProfileMenuItem(
                  icon: Icons.security_outlined,
                  title: 'Privacy & Security',
                  onTap: () {
                    // TODO: Implement privacy settings
                  },
                ),
              ],
            ),
            const SizedBox(height: AppSizes.gapLarge),
            _buildProfileSection(
              context,
              title: 'App Settings',
              items: [
                _ProfileMenuItem(
                  icon: Icons.language_outlined,
                  title: 'Language',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: const Text('Select Language'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: const Text('English'),
                                  selected:
                                      languageProvider.languageCode == 'en',
                                  onTap: () {
                                    languageProvider.setLanguage('en');
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Spanish'),
                                  selected:
                                      languageProvider.languageCode == 'es',
                                  onTap: () {
                                    languageProvider.setLanguage('es');
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                    );
                  },
                ),
                _ProfileMenuItem(
                  icon: Icons.dark_mode_outlined,
                  title: 'Theme',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: const Text('Select Theme'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: const Text('System'),
                                  selected:
                                      themeProvider.themeMode ==
                                      ThemeMode.system,
                                  onTap: () {
                                    themeProvider.setThemeMode(
                                      ThemeMode.system,
                                    );
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Light'),
                                  selected:
                                      themeProvider.themeMode ==
                                      ThemeMode.light,
                                  onTap: () {
                                    themeProvider.setThemeMode(ThemeMode.light);
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Dark'),
                                  selected:
                                      themeProvider.themeMode == ThemeMode.dark,
                                  onTap: () {
                                    themeProvider.setThemeMode(ThemeMode.dark);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                    );
                  },
                ),
                _ProfileMenuItem(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                  onTap: () {
                    // TODO: Implement help & support
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(
    BuildContext context, {
    required String title,
    required List<_ProfileMenuItem> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppSizes.gap),
        Card(
          child: Column(
            children:
                items.map((item) {
                  final isLast = items.last == item;
                  return Column(
                    children: [
                      ListTile(
                        leading: Icon(item.icon),
                        title: Text(item.title),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: item.onTap,
                      ),
                      if (!isLast)
                        Divider(
                          height: 1,
                          color: Theme.of(context).dividerColor,
                        ),
                    ],
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}

class _ProfileMenuItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ProfileMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}
