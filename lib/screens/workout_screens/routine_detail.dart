import 'package:flutter/material.dart';
import 'package:mad2025/screens/workout_screens/routine.dart';
import 'package:mad2025/screens/workout_screens/start_routine.dart';

class RoutineDetailScreen extends StatelessWidget {
  final RoutineModel routine;

  const RoutineDetailScreen({super.key, required this.routine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(routine.name)),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: routine.exercises.map((e) => ListTile(title: Text(e))).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => StartRoutineScreen(routine: routine)),
              );
            },
            child: Text("Empezar Rutina"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Volver"),
          ),
        ],
      ),
    );
  }
}
