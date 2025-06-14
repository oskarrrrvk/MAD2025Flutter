import 'package:flutter/material.dart';
import 'package:mad2025/screens/workout_screens/routine.dart';
import 'package:mad2025/screens/workout_screens/create_routine.dart';
import 'package:mad2025/screens/workout_screens/routine_detail.dart';

class WorkoutLoggerScreen extends StatefulWidget {
  const WorkoutLoggerScreen({super.key});

  @override
  State<WorkoutLoggerScreen> createState() => _WorkoutLoggerScreenState();
}

class _WorkoutLoggerScreenState extends State<WorkoutLoggerScreen> {
  void refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Entrenamientos")),
      body: Column(
        children: [
          Expanded(
            child: routines.isEmpty
                ? Center(child: Text("No routines created"))
                : ListView.builder(
              itemCount: routines.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(routines[index].name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RoutineDetailScreen(routine: routines[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CreateRoutineScreen(onRoutineCreated: refresh),
                ),
              );
            },
            child: Text("Create Routine"),
          ),
          ElevatedButton(
            onPressed: () {
            },
            child: Text("Free Workout"),
          ),
        ],
      ),
    );
  }
}
