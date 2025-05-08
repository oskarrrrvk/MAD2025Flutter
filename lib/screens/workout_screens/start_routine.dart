import 'package:flutter/material.dart';
import 'package:mad2025/screens/workout_screens/routine.dart';


class StartRoutineScreen extends StatefulWidget {
  final RoutineModel routine;

  const StartRoutineScreen({super.key, required this.routine});

  @override
  StartRoutineScreenState createState() => StartRoutineScreenState();
}

class StartRoutineScreenState extends State<StartRoutineScreen> {
  final Map<String, List<int>> series = {};

  void addSerie(String exercise) {
    setState(() {
      series.putIfAbsent(exercise, () => []);
      series[exercise]!.add(1); // añade una serie vacía
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Entrenando: ${widget.routine.name}")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: widget.routine.exercises.map((e) {
                final reps = series[e] ?? [];
                return Card(
                  child: ListTile(
                    title: Text(e),
                    subtitle: Text("Series: ${reps.length}"),
                    trailing: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => addSerie(e),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Aquí puedes guardar los datos si usas base de datos más adelante.
                Navigator.pop(context); // Por ahora solo vuelve atrás
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                textStyle: TextStyle(fontSize: 16),
              ),
              child: Text("Terminar Rutina"),
            ),
          )
        ],
      ),
    );
  }
}
