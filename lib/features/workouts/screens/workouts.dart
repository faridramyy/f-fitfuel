import 'package:fitfuel/features/workouts/controllers/workouts.dart';
import 'package:fitfuel/features/workouts/screens/log_workout.dart';
import 'package:fitfuel/theme/app_sizes.dart';
import 'package:flutter/material.dart';

class Workouts extends StatefulWidget {
  const Workouts({super.key});

  @override
  State<Workouts> createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {
  @override
  Widget build(BuildContext context) {
    final controller = WorkoutController();

    return Scaffold(
      appBar: AppBar(title: const Text('Workouts')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Quick Start'),
            const SizedBox(height: AppSizes.gap),
            WorkoutButton(
              icon: Icons.add,
              label: 'Start Workout',
              onPressed: () => controller.onStartWorkout(context),
            ),
            const SizedBox(height: AppSizes.gap),
            const SectionTitle(title: 'Routines'),
            const SizedBox(height: AppSizes.gap),
            Row(
              children: [
                Expanded(
                  child: WorkoutButton(
                    icon: Icons.list_alt,
                    label: 'New Routine',
                    onPressed: () => controller.onNewRoutine(context),
                  ),
                ),
                const SizedBox(width: AppSizes.gap),
                Expanded(
                  child: WorkoutButton(
                    icon: Icons.search,
                    label: 'Explore',
                    onPressed: () => controller.onExplore(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.gapLarge),
            const Text('My Routines (1)'),
            const SizedBox(height: AppSizes.gap),
            RoutineCard(
              title: "Upper-Body",
              description: "Push, pull, and core work in a quick 30-min set.",
              onStartRoutine: () {},
              onEdit: () {
                // open edit routine page
              },
              onDelete: () {
                // show confirmation then delete
              },
              onDuplicate: () {
                // duplicate the routine
              },
            ),
            RoutineCard(
              title: "Upper-Body",
              description: "Push, pull, and core work in a quick 30-min set.",
              onStartRoutine: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder:
                        (context, animation, secondaryAnimation) =>
                            const LogWorkout(),
                    transitionsBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                      child,
                    ) {
                      const begin = Offset(0.0, 1.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;

                      final tween = Tween(
                        begin: begin,
                        end: end,
                      ).chain(CurveTween(curve: curve));
                      final offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              onEdit: () {
                // open edit routine page
              },
              onDelete: () {
                // show confirmation then delete
              },
              onDuplicate: () {
                // duplicate the routine
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final Color? color;

  const SectionTitle({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: AppSizes.fontXL,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}

class WorkoutButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const WorkoutButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(AppSizes.padding),
      ),
      icon: Icon(
        icon,
        color: Theme.of(context).colorScheme.onSecondary,
        size: AppSizes.fontXL,
      ),
      label: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: AppSizes.fontL,
          ),
        ),
      ),
    );
  }
}

class RoutineCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onStartRoutine;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onDuplicate;

  const RoutineCard({
    super.key,
    required this.title,
    required this.description,
    required this.onStartRoutine,
    required this.onEdit,
    required this.onDelete,
    required this.onDuplicate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(AppSizes.radius),
      ),
      padding: const EdgeInsets.all(AppSizes.padding),
      margin: const EdgeInsets.only(bottom: AppSizes.gap),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppSizes.fontL,
                ),
              ),
              PopupMenuButton<String>(
                icon: Icon(
                  Icons.more_horiz,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                onSelected: (value) {
                  switch (value) {
                    case 'edit':
                      onEdit();
                      break;
                    case 'delete':
                      onDelete();
                      break;
                    case 'duplicate':
                      onDuplicate();
                      break;
                  }
                },
                itemBuilder:
                    (context) => [
                      PopupMenuItem(
                        value: 'edit',
                        child: Center(
                          child: Text('Edit', textAlign: TextAlign.center),
                        ),
                      ),
                      PopupMenuItem(
                        value: 'duplicate',
                        child: Center(
                          child: Text('Duplicate', textAlign: TextAlign.center),
                        ),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Center(
                          child: Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
              ),
            ],
          ),
          Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: AppSizes.gap),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onStartRoutine,
              child: const Text('Start Routine'),
            ),
          ),
        ],
      ),
    );
  }
}
