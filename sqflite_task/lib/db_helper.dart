import 'program_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


final String tableName = "programs";
final String columnId = "id";
final String columnName = "value";



class ProgramHelper {
  Database db;

  ProgramHelper() {
    initDataBase();
  }

  Future<void> initDataBase() async {
    db = await openDatabase(
      join(await getDatabasesPath(), "program_db.db"),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnName TEXT)");
      },
      version: 1,
    );
  }

  Future<void> insertProgram(Program program) async {
    try {
      db.insert(
        tableName,
        program.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (_) {
      print(_);
    }
  }

  Future<List<Program>> getAllPrograms() async {
    final List<Map<String, dynamic>> programs = await db.query(tableName);
    return List.generate(programs.length, (i) {
      return Program(id: programs[i]['id'], value: programs[i]['value']);
    });
  }

  Future<void> deleteProgram(int id) async {
    await db.delete(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
