import 'package:fitfuel/features/workouts/controllers/new_routine.dart';
import 'package:fitfuel/theme/app_sizes.dart';
import 'package:flutter/material.dart';

class NewRoutine extends StatefulWidget {
  const NewRoutine({super.key});

  @override
  State<NewRoutine> createState() => _NewRoutineState();
}

class _NewRoutineState extends State<NewRoutine> {
  @override
  Widget build(BuildContext context) {
    final controller = NewRoutineController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("New Routine"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down),
          onPressed: () => controller.minimize(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () => controller.save(context),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => controller.close(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Theme.of(context).brightness == Brightness.dark
                  ? 'assets/images/app_logo_dark_removebg.png'
                  : 'assets/images/app_logo_light_removebg.png',
              height: 120,
            ),
            const SizedBox(height: AppSizes.gapLarge),
            const Text(
              "Get started by adding exercises to your new routine!",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: AppSizes.gapLarge),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => controller.navigateToAddExercise(context),
                icon: const Icon(Icons.add),
                label: const Text('Add Exercise'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
