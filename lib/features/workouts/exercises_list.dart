import 'dart:convert';
import 'package:fitfuel/config/theme/theme_config.dart';
import 'package:fitfuel/features/workouts/exercise_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Exercise {
  final String name;
  final String bodyPart;
  final String equipment;
  final String gifUrl;
  final List<String> instructions;

  Exercise({
    required this.gifUrl,
    required this.name,
    required this.equipment,
    required this.bodyPart,
    required this.instructions,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['name'],
      bodyPart: json['bodyPart'],
      equipment: json['equipment'],
      gifUrl: json['gifUrl'],
      instructions: List<String>.from(json['instructions']),
    );
  }
}

class ExercisesList extends StatefulWidget {
  const ExercisesList({super.key});

  @override
  State<ExercisesList> createState() => _ExercisesListState();
}

class _ExercisesListState extends State<ExercisesList> {
  late Future<List<Exercise>> exercises;
  Set<int> selectedIndices = Set<int>(); // Track selected exercises

  @override
  void initState() {
    super.initState();
    exercises = fetchExercises();
  }

  Future<List<Exercise>> fetchExercises() async {
    final response = await http.get(
      Uri.parse('https://exercisedb.p.rapidapi.com/exercises'),
      headers: {
        'X-Rapidapi-Key': 'b7b30e6c2amsha53d1b744e3b589p1cebc2jsn71af7881d7e1',
        'X-Rapidapi-Host': 'exercisedb.p.rapidapi.com',
        'Host': 'exercisedb.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Exercise.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load exercises');
    }
  }

  String toTitleCase(String text) {
    if (text.isEmpty) return text;
    return text
        .split(' ')
        .map(
          (word) =>
              word.isNotEmpty
                  ? word[0].toUpperCase() + word.substring(1).toLowerCase()
                  : '',
        )
        .join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
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
                // Handle create action for selected exercises
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
      body: FutureBuilder<List<Exercise>>(
        future: exercises,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<Exercise> exerciseList = snapshot.data!;
            return ListView.builder(
              itemCount: exerciseList.length,
              itemBuilder: (context, index) {
                Exercise exercise = exerciseList[index];
                bool isSelected = selectedIndices.contains(
                  index,
                ); // Check if exercise is selected
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedIndices.remove(
                          index,
                        ); // Deselect if already selected
                      } else {
                        selectedIndices.add(
                          index,
                        ); // Select if not already selected
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withAlpha(50),
                          width: 1,
                        ),
                        left:
                            isSelected
                                ? BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 5,
                                )
                                : BorderSide.none,
                      ),
                    ),
                    padding: const EdgeInsets.all(AppTheme.defaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: Image.network(
                                exercise.gifUrl,
                                width: 65,
                                height: 65,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: AppTheme.defaultPadding),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    toTitleCase(exercise.name),
                                    style: const TextStyle(
                                      fontSize: AppTheme.largeFontSize,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                const SizedBox(
                                  height: AppTheme.defaultPadding / 4,
                                ),
                                Text(
                                  toTitleCase(exercise.bodyPart),
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
                          onPressed: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        ExerciseDetails(exercise: exercise),
                                transitionsBuilder: (
                                  context,
                                  animation,
                                  secondaryAnimation,
                                  child,
                                ) {
                                  const begin = Offset(1.0, 0.0);
                                  const end = Offset.zero;
                                  const curve = Curves.ease;
                                  var tween = Tween(
                                    begin: begin,
                                    end: end,
                                  ).chain(CurveTween(curve: curve));
                                  var offsetAnimation = animation.drive(tween);
                                  return SlideTransition(
                                    position: offsetAnimation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          icon: const Icon(Icons.mode_standby_rounded),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
      floatingActionButton:
          selectedIndices.isNotEmpty
              ? Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    "+ Add ${selectedIndices.length} ${selectedIndices.length == 1 ? 'Exercise' : 'Exercises'}",
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )
              : null,
    );
  }
}
