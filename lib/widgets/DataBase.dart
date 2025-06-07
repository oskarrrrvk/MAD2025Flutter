import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../screens/workout_screens/routine.dart';

class RoutineDatabase {
  RoutineDatabase._privateConstructor();
  static final RoutineDatabase instance = RoutineDatabase._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    final path = await getDatabasesPath();
    return await openDatabase(
      join(path, 'routine_database.db'),
      onCreate: (db, version) async {
        await db.execute('''
 CREATE TABLE routines(
 name TEXT,
 Push_Ups INTEGER,
 Squats INTEGER,
 Pull_Ups INTEGER,
 Deadlifts INTEGER,
 Lunges INTEGER,
 Jumping_Jacks INTEGER,
 Bench_Press INTEGER,
 Shoulder_Press INTEGER,
 Bicep_Curls INTEGER,
 Tricep_Dips INTEGER,
 Plank INTEGER,
 Mountain_Climbers INTEGER,
 Burpees INTEGER,
 Crunches INTEGER,
 Leg_Raises INTEGER,
 Russian_Twists INTEGER,
 Calf_Raises INTEGER,
 Hip_Thrusts INTEGER,
 Lat_Pulldowns INTEGER,
 Chest_Flyes INTEGER,
 Cable_Rows INTEGER,
 Overhead_Triceps_Extension INTEGER,
 Hammer_Curls INTEGER,
 Kettlebell_Swings INTEGER,
 Wall_Sits INTEGER, 
 Step_Ups INTEGER,
 Glute_Bridges INTEGER
 )
 ''');
      },
      version: 1,
    );
  }

  Future<void> insertRoutine(RoutineModel routine) async {
    final db = await database;
    await db.insert('routines', {
      'name': routine.name,
      for(var exercise in allExercises)
        exercise: routine.exercises.contains(exercise) ? 1 : 0,
    });
  }
  Future<List<Map<String, dynamic>>> getRoutines() async {
    final db = await database;
    return await db.query('routines');
  }
}
