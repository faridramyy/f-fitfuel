import 'package:fitfuel/config/theme/theme_config.dart';
import 'package:flutter/material.dart';

class Workouts extends StatelessWidget {
  const Workouts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Workouts')),
      body: SafeArea(
        child: SingleChildScrollView(
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
                    backgroundColor:
                        Theme.of(context).colorScheme.outlineVariant,
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
                      onPressed: () {},
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
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge?.copyWith(
                            fontSize: AppTheme.largeFontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppTheme.defaultPadding),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
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
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge?.copyWith(
                            fontSize: AppTheme.largeFontSize,
                            fontWeight: FontWeight.w500,
                          ),
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
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge?.copyWith(
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(AppTheme.defaultPadding),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
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
      ),
    );
  }
}
