import 'package:fitfuel/config/theme/theme_config.dart';
import 'package:flutter/material.dart';

class NewRoutine extends StatefulWidget {
  const NewRoutine({super.key});

  @override
  State<NewRoutine> createState() => _NewRoutineState();
}

class _NewRoutineState extends State<NewRoutine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Routine"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.defaultPadding),
          child: SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'assets/images/app_logo_dark_removebg.png'
                      : 'assets/images/app_logo_white_removebg.png',
                  height: 120,
                ),
                const SizedBox(height: AppTheme.defaultPadding * 2),
                const Text(
                  "Get Started by adding exercise to your new  routine!",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppTheme.defaultPadding * 2),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(AppTheme.defaultPadding),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: AppTheme.xlargeFontSize,
                    ),
                    label: const Text(
                      'Add Exercise',
                      style: TextStyle(
                        fontSize: AppTheme.mediumFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
