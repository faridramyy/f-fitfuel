import 'package:fitfuel/config/theme/theme_config.dart';
import 'package:flutter/material.dart';

class ExercisesList extends StatefulWidget {
  const ExercisesList({super.key});

  @override
  State<ExercisesList> createState() => _WorkoutsListState();
}

class _WorkoutsListState extends State<ExercisesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80, // Give space to avoid wrapping
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 14,
              ),
            ),
          ),
        ),
        title: const Text("Add Exercises", style: TextStyle(fontSize: 18)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton(
              onPressed: () {
                // Handle create action
              },
              child: Text(
                "Create",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(50),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/app_logo_white.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppTheme.defaultPadding * 1.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exercise Name",
                            style: TextStyle(
                              fontSize: AppTheme.largeFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          const Text(
                            "Exercise Description",
                            style: TextStyle(
                              fontSize: AppTheme.mediumFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_standby_rounded),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
