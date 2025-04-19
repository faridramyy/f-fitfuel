import 'dart:async';
import 'package:fitfuel/theme/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class LogWorkout extends StatefulWidget {
  const LogWorkout({super.key});

  @override
  State<LogWorkout> createState() => _LogWorkoutState();
}

class _LogWorkoutState extends State<LogWorkout> {
  late Timer _timer;
  Duration _elapsed = Duration.zero;

  final List<ExerciseData> _exercises = [
    ExerciseData(
      name: "Exercise Name",
      notes: "",
      restTime: "OFF",
      sets: [
        {"kg": "30", "reps": "10", "checked": false},
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsed += const Duration(seconds: 1);
      });
    });
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    String result = '';
    if (hours > 0) result += '${hours}h ';
    if (minutes > 0 || hours > 0) result += '${minutes}min ';
    result += '${seconds}s';

    return result.trim();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log Workout"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.keyboard_arrow_down),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.alarm_outlined, size: AppSizes.iconL),
          ),
          FilledButton(onPressed: () {}, child: const Text('Finish')),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(AppSizes.paddingS),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Duration",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        _formatDuration(_elapsed),
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        "Volume",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text("${_calculateTotalVolume()} KG"),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Sets", style: TextStyle(color: Colors.grey)),
                      Text(_calculateTotalSets().toString()),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.gap),
            Column(
              children:
                  _exercises.map((exerciseData) {
                    int exerciseIndex = _exercises.indexOf(exerciseData);
                    return _buildExerciseContainer(exerciseData, exerciseIndex);
                  }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {
                    setState(() {
                      _exercises.add(
                        ExerciseData(
                          name: "Exercise Name",
                          notes: "",
                          restTime: "OFF",
                          sets: [
                            {"kg": "0", "reps": "0", "checked": false},
                          ],
                        ),
                      );
                    });
                  },
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  label: Text(
                    'Add Exercise',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _calculateTotalVolume() {
    int totalVolume = 0;
    for (var exercise in _exercises) {
      for (var set in exercise.sets) {
        totalVolume +=
            (int.tryParse(set["kg"] ?? "0") ?? 0) *
            (int.tryParse(set["reps"] ?? "0") ?? 0);
      }
    }
    return totalVolume;
  }

  int _calculateTotalSets() {
    int totalSets = 0;
    for (var exercise in _exercises) {
      totalSets += exercise.sets.length;
    }
    return totalSets;
  }

  Widget _buildExerciseContainer(ExerciseData exerciseData, int exerciseIndex) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/images/app_logo_light.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: AppSizes.gap),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    exerciseData.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        TextField(
          decoration: const InputDecoration(
            hintText: 'Add notes here...',
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            filled: false,
          ),
          style: const TextStyle(backgroundColor: Colors.transparent),
          onChanged: (value) {
            setState(() {
              _exercises[exerciseIndex].notes = value;
            });
          },
        ),
        TextButton.icon(
          onPressed: () {
            // Your logic here
          },
          icon: Icon(Icons.alarm, color: Theme.of(context).colorScheme.primary),
          label: Text(
            'Rest Time : ${exerciseData.restTime}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),

        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Text("SET", style: TextStyle(color: Colors.grey)),
                ),
              ),
              Expanded(
                flex: 4,
                child: Center(
                  child: Text("PREVIOUS", style: TextStyle(color: Colors.grey)),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text("KG", style: TextStyle(color: Colors.grey)),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text("REPS", style: TextStyle(color: Colors.grey)),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Icon(Icons.check, color: Colors.grey[600]),
                ),
              ),
            ],
          ),
        ),
        ...exerciseData.sets.asMap().entries.map((entry) {
          int setIndex = entry.key;
          var set = entry.value;

          return Slidable(
            key: ValueKey("$exerciseIndex-$setIndex"),
            endActionPane: ActionPane(
              motion: const DrawerMotion(),
              extentRatio: 0.25,
              dismissible: DismissiblePane(
                onDismissed: () {
                  setState(() {
                    _exercises[exerciseIndex].sets.removeAt(setIndex);
                  });
                },
              ),
              children: [
                SlidableAction(
                  onPressed: (_) {
                    setState(() {
                      _exercises[exerciseIndex].sets.removeAt(setIndex);
                    });
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  label: 'Delete',
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.symmetric(),
              width: double.infinity,
              decoration: BoxDecoration(
                color:
                    set['checked'] == true
                        ? Colors.green.withAlpha(80)
                        : Colors.transparent,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(child: Text("${setIndex + 1}")),
                  ),
                  Expanded(
                    flex: 4,
                    child: Center(child: Text("${set["kg"]}kg x 10")),
                  ),
                  Expanded(flex: 2, child: Center(child: Text(set["kg"]))),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: TextFormField(
                        initialValue: set["reps"],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,

                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          filled: false,
                          fillColor: Colors.transparent,
                        ),
                        onChanged: (value) {
                          // Use a regular expression to allow only digits
                          if (RegExp(r'^\d*$').hasMatch(value)) {
                            setState(() {
                              _exercises[exerciseIndex].sets[setIndex]["reps"] =
                                  value;
                            });
                          } else {
                            // Optionally, you can provide feedback to the user that only numbers are allowed
                            // For example, by showing a snackbar or changing the border color.
                            // For this example, we'll just ignore the invalid input.
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _exercises[exerciseIndex]
                                    .sets[setIndex]["checked"] =
                                !_exercises[exerciseIndex]
                                    .sets[setIndex]["checked"];
                          });
                        },
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color:
                                _exercises[exerciseIndex]
                                        .sets[setIndex]["checked"]
                                    ? Colors.green
                                    : Colors.grey[200],
                          ),
                          child: Icon(
                            Icons.check,
                            color:
                                _exercises[exerciseIndex]
                                        .sets[setIndex]["checked"]
                                    ? Colors.white
                                    : Colors.grey[700],
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {
                setState(() {
                  _exercises[exerciseIndex].sets.add({
                    "kg": "0",
                    "reps": "0",
                    "checked": false,
                  });
                });
              },
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
              ),
              icon: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              label: Text(
                'Add Set',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ExerciseData {
  String name;
  String notes;
  String restTime;
  List<Map<String, dynamic>> sets;

  ExerciseData({
    required this.name,
    required this.notes,
    required this.restTime,
    required this.sets,
  });
}
