import 'package:flutter/material.dart';
import 'package:fitfuel/features/workouts/screens/exercises_list.dart';

class NewRoutineController {
  // Method to navigate to the ExercisesList screen
  void navigateToAddExercise(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const ExercisesList(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  // Method to close the current screen
  void close(BuildContext context) {
    Navigator.of(context).pop();
  }

  void save(BuildContext context) {
    Navigator.of(context).pop();
  }

  void minimize(BuildContext context) {
    Navigator.of(context).pop();
  }

}
