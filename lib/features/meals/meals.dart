import 'package:flutter/material.dart';

class Meals extends StatelessWidget {
  const Meals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meals Demo')),
      body: Center(child: Text('Welcome to the Meals Demo Page!')),
    );
  }
}
