import 'package:fitfuel/data/models/exercise.dart';
import 'package:fitfuel/features/workouts/controllers/exercises_list.dart';
import 'package:fitfuel/theme/app_sizes.dart';
import 'package:flutter/material.dart';

class ExercisesList extends StatefulWidget {
  const ExercisesList({super.key});

  @override
  State<ExercisesList> createState() => _ExercisesListState();
}

class _ExercisesListState extends State<ExercisesList> {
  late Future<List<Exercise>> exercises;
  final controller = ExerciseController();
  Set<int> selectedIndices = <int>{};

  @override
  void initState() {
    super.initState();
    exercises = controller.fetchExercises();
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
      extendBody: true,
      appBar: AppBar(
        leadingWidth: 80,
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Cancel",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        title: const Text("Add Exercises"),
        actions: [
          TextButton(
            onPressed: () => controller.createExercise(),
            child: Text(
              "Create",
              style: TextStyle(color: Theme.of(context).primaryColor),
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
                bool isSelected = selectedIndices.contains(index);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedIndices.remove(index);
                      } else {
                        selectedIndices.add(index);
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(AppSizes.padding),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                exercise.gifUrl,
                                width: 65,
                                height: 65,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: AppSizes.padding),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    toTitleCase(exercise.name),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Text(
                                  toTitleCase(exercise.bodyPart),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed:
                              () =>
                                  controller.exerciseDetails(context, exercise),
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
      bottomNavigationBar:
          selectedIndices.isNotEmpty
              ? Container(
                padding: const EdgeInsets.all(AppSizes.paddingXL),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.radius),
                  child: FilledButton(
                    onPressed: () => controller.addExercises(),
                    child: Text(
                      "+ Add ${selectedIndices.length} ${selectedIndices.length == 1 ? 'Exercise' : 'Exercises'}",
                    ),
                  ),
                ),
              )
              : null,
    );
  }
}
