import 'package:flutter/material.dart';
import 'package:mad2025/screens/workout_screens/routine.dart';
import 'package:mad2025/screens/workout_screens/routine_detail.dart';

import 'package:mad2025/widgets/DataBase.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreen createState() => _HistoryScreen();
}

class _HistoryScreen extends State<HistoryScreen>{
  RoutineDatabase db = RoutineDatabase.instance;
  late Future<List<Map<String, dynamic>>> routinesDB;

  @override
  void initState() {
    super.initState();
    routinesDB = db.getRoutines();
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('RUNNING')),
      body: createHistory(allExercises),
    );
  }

  Widget createHistory(List<String> exercises) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: routinesDB,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("There are not any routine."));
        }

        final filteredRoutines = snapshot.data!.where((routine) {
          return exercises.any((ex) => routine[ex] == 1);
        }).toList();

        if (filteredRoutines.isEmpty) {
          return const Center(child: Text("There are not any coincidence."));
        }

        return ListView.builder(
          itemCount: filteredRoutines.length,
          itemBuilder: (context, index) {
            final routine = filteredRoutines[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                title: Text(routine["name"] ?? "routine without name"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RoutineDetailScreen(
                        routine: RoutineModel.fromMap(routine),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}