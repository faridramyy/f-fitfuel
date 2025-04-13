import 'package:flutter/material.dart';

class Workouts extends StatelessWidget {
  const Workouts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Workouts Demo')),
      body: Center(child: Text('Welcome to the Workouts Demo Page!')),
    );
  }
}
