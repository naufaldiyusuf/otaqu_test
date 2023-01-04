part of '../data.dart';

class LocalDB {
  Map<int, String> migrateScript = {
    1:'CREATE TABLE destination('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'destination_id INTEGER,'
        'type_source TEXT,'
        'type_name TEXT,'
        'name TEXT'
        ')'
  };

  LocalDB._();

  Database? _database;

  static final LocalDB provider = LocalDB._();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: migrateScript.length, onOpen: (db) {},
        onCreate: createTable, onUpgrade: onUpgrade);
  }

  void onUpgrade(Database database, int oldVersion, int newVersion) async {
    for (int i = oldVersion + 1; i <= newVersion; i++) {
      await database.execute(migrateScript[i]!);
    }
  }

  void createTable(Database database, int version) async {
    for (int i = 1; i <= migrateScript.length; i++) {
      await database.execute(migrateScript[i]!);
    }
  }
}