import 'package:fitfuel/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:fitfuel/features/workouts/exercises_list.dart'; // adjust import if needed

class ExerciseDetails extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDetails({super.key, required this.exercise});

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
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(toTitleCase(exercise.name)),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Summary'),
              Tab(text: 'History'),
              Tab(text: 'How To'),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              /// Tab 1: Summary
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white, // background color
                      width: double.infinity,
                      child: Image.asset(
                        exercise.gifUrl,
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppTheme.defaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            toTitleCase(exercise.name),
                            style: TextStyle(
                              fontSize: AppTheme.xLargeFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          Text(
                            'Body Part: ${exercise.bodyPart}',
                            style: const TextStyle(
                              fontSize: AppTheme.smallFontSize,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Equipment: ${exercise.equipment}',
                            style: const TextStyle(
                              fontSize: AppTheme.smallFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.red,
                    ),
                    const SizedBox(height: AppTheme.defaultPadding),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle Heaviest Weight tap
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                foregroundColor: Colors.white,
                                alignment: Alignment.centerLeft,
                              ),
                              child: Text(
                                'Heaviest Weight',
                                style: Theme.of(
                                  context,
                                ).textTheme.labelLarge?.copyWith(
                                  fontSize: AppTheme.mediumFontSize,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle One Rep Max tap
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                backgroundColor:
                                    Theme.of(
                                      context,
                                    ).colorScheme.outlineVariant,
                                foregroundColor: Colors.white,
                                alignment: Alignment.centerLeft,
                              ),
                              child: Text(
                                'One Rep Max',
                                style: Theme.of(
                                  context,
                                ).textTheme.labelLarge?.copyWith(
                                  fontSize: AppTheme.mediumFontSize,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle Best Set Volume tap
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                backgroundColor:
                                    Theme.of(
                                      context,
                                    ).colorScheme.outlineVariant,
                                foregroundColor: Colors.white,
                                alignment: Alignment.centerLeft,
                              ),
                              child: Text(
                                'Best Set Volume',
                                style: Theme.of(
                                  context,
                                ).textTheme.labelLarge?.copyWith(
                                  fontSize: AppTheme.mediumFontSize,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle Session Volume tap
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                backgroundColor:
                                    Theme.of(
                                      context,
                                    ).colorScheme.outlineVariant,
                                foregroundColor: Colors.white,
                                alignment: Alignment.centerLeft,
                              ),
                              child: Text(
                                'Session Volume',
                                style: Theme.of(
                                  context,
                                ).textTheme.labelLarge?.copyWith(
                                  fontSize: AppTheme.mediumFontSize,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle Total Rep tap
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                backgroundColor:
                                    Theme.of(
                                      context,
                                    ).colorScheme.outlineVariant,
                                foregroundColor: Colors.white,
                                alignment: Alignment.centerLeft,
                              ),
                              child: Text(
                                'Total Rep',
                                style: Theme.of(
                                  context,
                                ).textTheme.labelLarge?.copyWith(
                                  fontSize: AppTheme.mediumFontSize,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(AppTheme.defaultPadding),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: AppTheme.defaultPadding,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey, // Customize the color
                                  width: 1.0, // Customize the thickness
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Text(
                                  "Heaviest Weight",
                                  style: TextStyle(
                                    fontSize: AppTheme.mediumFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "--",
                                  style: TextStyle(
                                    fontSize: AppTheme.mediumFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: AppTheme.defaultPadding,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey, // Customize the color
                                  width: 1.0, // Customize the thickness
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Text(
                                  "Best 1RM",
                                  style: TextStyle(
                                    fontSize: AppTheme.mediumFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "--",
                                  style: TextStyle(
                                    fontSize: AppTheme.mediumFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: AppTheme.defaultPadding,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey, // Customize the color
                                  width: 1.0, // Customize the thickness
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Text(
                                  "Best Set Volume",
                                  style: TextStyle(
                                    fontSize: AppTheme.mediumFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "--",
                                  style: TextStyle(
                                    fontSize: AppTheme.mediumFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: AppTheme.defaultPadding,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey, // Customize the color
                                  width: 1.0, // Customize the thickness
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Text(
                                  "Best Session Volume",
                                  style: TextStyle(
                                    fontSize: AppTheme.mediumFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "--",
                                  style: TextStyle(
                                    fontSize: AppTheme.mediumFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// Tab 2: History (placeholder content)
              const Center(child: Text('No Exercise History Data Available.')),

              /// Tab 3: How To (instructions)
              ListView(
                children: [
                  Container(
                    color: Colors.white, // background color
                    width: double.infinity,
                    child: Image.network(
                      exercise.gifUrl,
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(AppTheme.defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          toTitleCase(exercise.name),
                          style: TextStyle(
                            fontSize: AppTheme.xLargeFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: AppTheme.defaultPadding),
                        Text(
                          'Instructions:',
                          style: TextStyle(
                            fontSize: AppTheme.largeFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: AppTheme.defaultPadding / 2),
                        ...exercise.instructions.asMap().entries.map((entry) {
                          int index = entry.key;
                          String step = entry.value;
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: AppTheme.defaultPadding / 1.5,
                            ),
                            child: Text('${index + 1}. $step'),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
