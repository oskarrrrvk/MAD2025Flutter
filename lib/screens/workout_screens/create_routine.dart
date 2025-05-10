import 'package:flutter/material.dart';
import 'package:mad2025/screens/workout_screens/routine.dart';

class CreateRoutineScreen extends StatefulWidget {
  final VoidCallback onRoutineCreated;

  const CreateRoutineScreen({super.key, required this.onRoutineCreated});

  @override
  CreateRoutineScreenState createState() => CreateRoutineScreenState();
}

class CreateRoutineScreenState extends State<CreateRoutineScreen> {
  final TextEditingController _nameController = TextEditingController();
  final List<String> allExercises = [
    'Push Ups',
    'Squats',
    'Pull Ups',
    'Deadlifts',
    'Lunges',
    'Jumping Jacks',
    'Bench Press',
    'Shoulder Press',
    'Bicep Curls',
    'Tricep Dips',
    'Plank',
    'Mountain Climbers',
    'Burpees',
    'Crunches',
    'Leg Raises',
    'Russian Twists',
    'Calf Raises',
    'Hip Thrusts',
    'Lat Pulldowns',
    'Chest Flyes',
    'Cable Rows',
    'Overhead Triceps Extension',
    'Hammer Curls',
    'Kettlebell Swings',
    'Wall Sits',
    'Step Ups',
    'Glute Bridges'
  ];

  final List<String> selectedExercises = [];

  void toggleExercise(String exercise) {
    setState(() {
      selectedExercises.contains(exercise)
          ? selectedExercises.remove(exercise)
          : selectedExercises.add(exercise);
    });
  }

  void createRoutine() {
    if (_nameController.text.isNotEmpty && selectedExercises.isNotEmpty) {
      routines.add(RoutineModel(
        name: _nameController.text,
        exercises: List.from(selectedExercises),
      ));
      widget.onRoutineCreated();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crear Rutina")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Nombre de la rutina"),
            ),
            Expanded(
              child: ListView(
                children: allExercises.map((exercise) {
                  final isSelected = selectedExercises.contains(exercise);
                  return ListTile(
                    title: Text(exercise),
                    trailing: isSelected ? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank),
                    onTap: () => toggleExercise(exercise),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: createRoutine,
              child: Text("Crear"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancelar"),
            )
          ],
        ),
      ),
    );
  }
}

