import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../screens/workout_screens/routine.dart';

class RoutineDatabase {
  RoutineDatabase._privateConstructor(); // Private constructor for the singleton
  static final RoutineDatabase instance = RoutineDatabase._privateConstructor(); // Singleton instance

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
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 name TEXT,
 Push Ups INTEGER,
 Squats INTEGER,
 Pull Ups INTEGER,
 Deadlifts INTEGER,
 Lunges INTEGER,
 Jumping Jacks INTEGER,
 Bench Press INTEGER,
 Shoulder Press INTEGER,
 Bicep Curls INTEGER,
 Tricep Dips INTEGER,
 Plank INTEGER,
 Mountain Climbers INTEGER,
 Burpees INTEGER,
 Crunches INTEGER,
 Leg Raises INTEGER,
 Russian Twists INTEGER,
 Calf Raises INTEGER,
 Hip Thrusts INTEGER,
 Lat Pulldowns INTEGER,
 Chest Flyes INTEGER,
 Cable Rows INTEGER,
 Overhead Triceps Extension INTEGER,
 Hammer Curls INTEGER,
 Kettlebell Swings INTEGER,
 Wall Sits INTEGER, 
 Step Ups INTEGER,
 Glute Bridges INTEGER
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
