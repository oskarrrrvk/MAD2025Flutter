class RoutineModel {
  final String name;
  final List<String> exercises;

  RoutineModel({required this.name, required this.exercises});
  factory RoutineModel.fromMap(Map<String, dynamic> map) {
    return RoutineModel(
      name: map['name'] ?? 'routine without name',
      exercises: map.entries
          .where((entry) => entry.key != 'name' && entry.value == 1)
          .map((entry) => entry.key)
          .toList(),
    );
  }
}

List<RoutineModel> routines = [];
final List<String> allExercises = [
  'Push_Ups',
  'Squats',
  'Pull_Ups',
  'Deadlifts',
  'Lunges',
  'Jumping_Jacks',
  'Bench_Press',
  'Shoulder_Press',
  'Bicep_Curls',
  'Tricep_Dips',
  'Plank',
  'Mountain_Climbers',
  'Burpees',
  'Crunches',
  'Leg_Raises',
  'Russian_Twists',
  'Calf_Raises',
  'Hip_Thrusts',
  'Lat_Pulldowns',
  'Chest_Flyes',
  'Cable_Rows',
  'Overhead_Triceps_Extension',
  'Hammer_Curls',
  'Kettlebell_Swings',
  'Wall_Sits',
  'Step_Ups',
  'Glute_Bridges'
];