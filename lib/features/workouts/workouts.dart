import 'package:fitfuel/config/theme/theme_config.dart';
import 'package:fitfuel/features/workouts/explore.dart';
import 'package:fitfuel/features/workouts/log_workout.dart';
import 'package:flutter/material.dart';
import 'package:fitfuel/features/workouts/new_routine.dart';

class Workouts extends StatelessWidget {
  const Workouts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Workouts')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                'Quick Start',
                style: TextStyle(
                  fontSize: AppTheme.xlargeFontSize,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(AppTheme.defaultPadding),
                  backgroundColor: Theme.of(context).colorScheme.outlineVariant,
                  foregroundColor: Colors.white,
                  alignment: Alignment.centerLeft,
                ),
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.onSecondary,
                  size: AppTheme.xlargeFontSize,
                ),
                label: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Start Workout',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: AppTheme.largeFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: AppTheme.defaultPadding),
            SizedBox(
              width: double.infinity,
              child: Text(
                'Routines',
                style: TextStyle(
                  fontSize: AppTheme.xlargeFontSize,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
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
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(AppTheme.defaultPadding),
                      backgroundColor:
                          Theme.of(context).colorScheme.outlineVariant,
                      foregroundColor: Colors.white,
                      alignment: Alignment.centerLeft,
                    ),
                    icon: Icon(
                      Icons.list_alt,
                      color: Theme.of(context).colorScheme.onSecondary,
                      size: AppTheme.xlargeFontSize,
                    ),
                    label: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'New Routine',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: AppTheme.largeFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppTheme.defaultPadding),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const Explore(),
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
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(AppTheme.defaultPadding),
                      backgroundColor:
                          Theme.of(context).colorScheme.outlineVariant,
                      foregroundColor: Colors.white,
                      alignment: Alignment.centerLeft,
                    ),
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.onSecondary,
                      size: AppTheme.xlargeFontSize,
                    ),
                    label: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Explore',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: AppTheme.largeFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            SizedBox(
              width: double.infinity,
              child: Text(
                'My Routines (3)',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.outline,
                  fontSize: AppTheme.mediumFontSize,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),

            const SizedBox(height: AppTheme.defaultPadding),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(
                  AppTheme.defaultBorderRadius,
                ),
              ),
              padding: EdgeInsets.only(
                right: AppTheme.defaultPadding,
                bottom: AppTheme.defaultPadding,
                left: AppTheme.defaultPadding,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Upper-Body",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: AppTheme.largeFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_horiz,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Eu ut anim Lorem aute laborum id consequat sunt laborum cillum qui. Enim ut elit ad nisi nulla magna dolor qui sit id commodo officia...",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppTheme.defaultPadding),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
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
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(AppTheme.defaultPadding),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: const Text(
                        'Start Routine',
                        style: TextStyle(
                          fontSize: AppTheme.mediumFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
