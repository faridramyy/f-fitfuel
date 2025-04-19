import 'package:fitfuel/features/workouts/screens/explore.dart';
import 'package:fitfuel/features/workouts/screens/new_routine.dart';
import 'package:flutter/material.dart';

class WorkoutController {
  void onStartWorkout(BuildContext context) {
    debugPrint('Workout started');
  }

  void onNewRoutine(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: const NewRoutine(),
        );
      },
    );
  }

  void onExplore(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) => const Explore(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
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

  void onStartRoutine() {
    debugPrint('Routine started');
  }

  void onRoutineOptions() {
    debugPrint('Routine options tapped');
  }
}
