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
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  // Filter states - changed to Sets for multiple selection
  Set<String> selectedBodyParts = {};
  Set<String> selectedEquipment = {};
  Set<String> selectedTargets = {};
  Set<String> selectedSecondaryMuscles = {};

  // Available filter options
  Set<String> bodyParts = {};
  Set<String> equipment = {};
  Set<String> targets = {};
  Set<String> secondaryMuscles = {};

  @override
  void initState() {
    super.initState();
    exercises = controller.fetchExercises();
    searchController.addListener(() {
      setState(() {
        searchQuery = searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder:
          (context) => StatefulBuilder(
            builder:
                (context, setState) => Container(
                  padding: const EdgeInsets.all(AppSizes.padding),
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Filter Exercises',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedBodyParts.clear();
                                selectedEquipment.clear();
                                selectedTargets.clear();
                                selectedSecondaryMuscles.clear();
                              });
                              this.setState(() {});
                            },
                            child: const Text('Reset'),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSizes.padding),
                      // Selected Filters Section
                      if (selectedBodyParts.isNotEmpty ||
                          selectedEquipment.isNotEmpty ||
                          selectedTargets.isNotEmpty ||
                          selectedSecondaryMuscles.isNotEmpty) ...[
                        const Text(
                          'Selected Filters',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: AppSizes.padding / 2),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            ...selectedBodyParts.map(
                              (part) => Chip(
                                label: Text(part),
                                deleteIcon: const Icon(Icons.close, size: 18),
                                onDeleted: () {
                                  setState(() {
                                    selectedBodyParts.remove(part);
                                  });
                                  this.setState(() {});
                                },
                              ),
                            ),
                            ...selectedEquipment.map(
                              (equip) => Chip(
                                label: Text(equip),
                                deleteIcon: const Icon(Icons.close, size: 18),
                                onDeleted: () {
                                  setState(() {
                                    selectedEquipment.remove(equip);
                                  });
                                  this.setState(() {});
                                },
                              ),
                            ),
                            ...selectedTargets.map(
                              (target) => Chip(
                                label: Text(target),
                                deleteIcon: const Icon(Icons.close, size: 18),
                                onDeleted: () {
                                  setState(() {
                                    selectedTargets.remove(target);
                                  });
                                  this.setState(() {});
                                },
                              ),
                            ),
                            ...selectedSecondaryMuscles.map(
                              (muscle) => Chip(
                                label: Text(muscle),
                                deleteIcon: const Icon(Icons.close, size: 18),
                                onDeleted: () {
                                  setState(() {
                                    selectedSecondaryMuscles.remove(muscle);
                                  });
                                  this.setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSizes.padding),
                        const Divider(),
                        const SizedBox(height: AppSizes.padding),
                      ],
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildFilterSection(
                                'Body Part',
                                bodyParts.toList(),
                                selectedBodyParts,
                                (value, selected) {
                                  setState(() {
                                    if (selected) {
                                      selectedBodyParts.add(value);
                                    } else {
                                      selectedBodyParts.remove(value);
                                    }
                                  });
                                  this.setState(() {});
                                },
                              ),
                              _buildFilterSection(
                                'Equipment',
                                equipment.toList(),
                                selectedEquipment,
                                (value, selected) {
                                  setState(() {
                                    if (selected) {
                                      selectedEquipment.add(value);
                                    } else {
                                      selectedEquipment.remove(value);
                                    }
                                  });
                                  this.setState(() {});
                                },
                              ),
                              _buildFilterSection(
                                'Target Muscle',
                                targets.toList(),
                                selectedTargets,
                                (value, selected) {
                                  setState(() {
                                    if (selected) {
                                      selectedTargets.add(value);
                                    } else {
                                      selectedTargets.remove(value);
                                    }
                                  });
                                  this.setState(() {});
                                },
                              ),
                              _buildFilterSection(
                                'Secondary Muscles',
                                secondaryMuscles.toList(),
                                selectedSecondaryMuscles,
                                (value, selected) {
                                  setState(() {
                                    if (selected) {
                                      selectedSecondaryMuscles.add(value);
                                    } else {
                                      selectedSecondaryMuscles.remove(value);
                                    }
                                  });
                                  this.setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSizes.padding),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Apply Filters'),
                        ),
                      ),
                    ],
                  ),
                ),
          ),
    );
  }

  Widget _buildFilterSection(
    String title,
    List<String> options,
    Set<String> selectedValues,
    Function(String, bool) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: AppSizes.padding / 2),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children:
              options.map((option) {
                final isSelected = selectedValues.contains(option);
                return FilterChip(
                  label: Text(option),
                  selected: isSelected,
                  onSelected: (selected) {
                    onChanged(option, selected);
                  },
                );
              }).toList(),
        ),
        const SizedBox(height: AppSizes.padding),
      ],
    );
  }

  List<Exercise> filterExercises(List<Exercise> exercises) {
    return exercises.where((exercise) {
      // Text search filter
      if (searchQuery.isNotEmpty) {
        final matchesSearch =
            exercise.name.toLowerCase().contains(searchQuery) ||
            exercise.bodyPart.toLowerCase().contains(searchQuery) ||
            exercise.target.toLowerCase().contains(searchQuery);
        if (!matchesSearch) return false;
      }

      // Category filters
      if (selectedBodyParts.isNotEmpty &&
          !selectedBodyParts.contains(exercise.bodyPart)) {
        return false;
      }
      if (selectedEquipment.isNotEmpty &&
          !selectedEquipment.contains(exercise.equipment)) {
        return false;
      }
      if (selectedTargets.isNotEmpty &&
          (exercise.target.isEmpty ||
              !selectedTargets.contains(exercise.target))) {
        return false;
      }
      if (selectedSecondaryMuscles.isNotEmpty &&
          (exercise.secondaryMuscles.isEmpty ||
              !exercise.secondaryMuscles.any(
                (muscle) => selectedSecondaryMuscles.contains(muscle),
              ))) {
        return false;
      }

      return true;
    }).toList();
  }

  void _updateFilterOptions(List<Exercise> exercises) {
    bodyParts = exercises.map((e) => e.bodyPart).toSet();
    equipment = exercises.map((e) => e.equipment).toSet();
    targets =
        exercises
            .where((e) => e.target.isNotEmpty)
            .map((e) => e.target)
            .toSet();
    secondaryMuscles =
        exercises
            .expand((e) => e.secondaryMuscles)
            .where((muscle) => muscle.isNotEmpty)
            .toSet();
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSizes.padding),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search exercises...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: _showFilterBottomSheet,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radius),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.padding,
                  vertical: AppSizes.padding,
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Exercise>>(
              future: exercises,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final exerciseList = snapshot.data!;
                  _updateFilterOptions(exerciseList);
                  final filteredExercises = filterExercises(exerciseList);

                  if (filteredExercises.isEmpty) {
                    return const Center(
                      child: Text('No exercises found matching your criteria.'),
                    );
                  }

                  return ListView.builder(
                    itemCount: filteredExercises.length,
                    itemBuilder: (context, index) {
                      Exercise exercise = filteredExercises[index];
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                            2,
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
                                    () => controller.exerciseDetails(
                                      context,
                                      exercise,
                                    ),
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
          ),
        ],
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
