import 'package:flutter/material.dart';

class NewRoutine extends StatefulWidget {
  const NewRoutine({super.key});

  @override
  State<NewRoutine> createState() => _NewRoutineState();
}

class _NewRoutineState extends State<NewRoutine> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("New Routine"),
          leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_down),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),

        body: Center(child: Text("Create your new routine here!")),
      ),
    );
  }
}
