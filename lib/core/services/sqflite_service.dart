import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteService {
  Database? _db;

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "notes.db");
    return await openDatabase(
      path,
      onCreate: _onCreate,
    );
  }

  _onCreate(Database db, int version) async {
    await db.execute(''' 
    CREATE TABLE "notes"(
      title TEXT , subtitle TEXT, date TEXT, color INTEGER
    )
    ''');
  }

  Future<Database?> get db async {
    _db ??= await initDB();
    return _db;
  }
}
