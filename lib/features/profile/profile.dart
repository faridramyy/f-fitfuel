import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Demo')),
      body: Center(child: Text('Welcome to the Profile Demo Page!')),
    );
  }
}
