import 'package:fitfuel/data/models/exercise.dart';
import 'package:fitfuel/theme/app_sizes.dart';
import 'package:flutter/material.dart';

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
                      color: const Color(0xFFFDFDFD),
                      width: double.infinity,
                      child: Image.asset(
                        exercise.gifUrl,
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppSizes.padding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            toTitleCase(exercise.name),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppSizes.fontXXL,
                            ),
                          ),
                          const SizedBox(height: AppSizes.gapSmall),
                          Text(
                            'Body Part: ${exercise.bodyPart}',
                            style: const TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'Equipment: ${exercise.equipment}',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.red,
                    ),
                    const SizedBox(height: AppSizes.gapSmall),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: AppSizes.gapSmall,
                        children: [
                          FilledButton(
                            onPressed: () {},
                            child: Text('Heaviest Weight'),
                          ),
                          FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              foregroundColor:
                                  Theme.of(context).colorScheme.onSecondary,
                              alignment: Alignment.centerLeft,
                            ),
                            child: Text('One Rep Max'),
                          ),
                          FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              foregroundColor:
                                  Theme.of(context).colorScheme.onSecondary,
                              alignment: Alignment.centerLeft,
                            ),
                            child: Text('Best Set Volume'),
                          ),
                          FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              foregroundColor:
                                  Theme.of(context).colorScheme.onSecondary,
                              alignment: Alignment.centerLeft,
                            ),
                            child: Text('Session Volume'),
                          ),
                          FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              foregroundColor:
                                  Theme.of(context).colorScheme.onSecondary,
                              alignment: Alignment.centerLeft,
                            ),
                            child: Text('Total Rep'),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(AppSizes.padding),
                      child: Column(
                        spacing: AppSizes.gapSmall,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Heaviest Weight",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "--",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text(
                                "Best Set Volume",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "--",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text(
                                "Best 1RM",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "--",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text(
                                "Best Session Volume",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "--",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
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
                    color: const Color(0xFFFDFDFD),
                    width: double.infinity,
                    child: Image.asset(
                      exercise.gifUrl,
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(AppSizes.padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          toTitleCase(exercise.name),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppSizes.fontXXL,
                          ),
                        ),
                        const SizedBox(height: AppSizes.gap),
                        Text(
                          'Instructions:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppSizes.fontL,
                          ),
                        ),
                        const SizedBox(height: AppSizes.gap),
                        ...exercise.instructions.asMap().entries.map((entry) {
                          int index = entry.key;
                          String step = entry.value;
                          return Padding(
                            padding: const EdgeInsets.only(),
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
