import 'dart:convert';
import 'package:fitfuel/features/workouts/screens/exercise_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fitfuel/data/models/exercise.dart';

class ExerciseController {
  Future<List<Exercise>> fetchExercises() async {
    final String response = await rootBundle.loadString(
      'assets/exercises.json',
    );
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Exercise.fromJson(json)).toList();
  }

  void createExercise() {
    debugPrint("Create Exercise");
  }

  void exerciseDetails(BuildContext context, Exercise exercise) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExerciseDetails(exercise: exercise),
      ),
    );
  }

  void addExercises() {
    debugPrint("add Exercises");
  }
}
