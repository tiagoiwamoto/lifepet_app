import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DbUtil {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    String nPath = path.join(dbPath, 'pets');
    return sql.openDatabase(nPath, onCreate: (db, version) {
      _createDb(db);
    }, version: 1);
  }

  static void _createDb(sql.Database db) {
    db.execute("""
      CREATE TABLE IF NOT EXISTS pets (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome VARCHAR(50),
        imageUrl TEXT,
        descricao TEXT,
        idade INTEGER,
        sexo VARCHAR(8),
        cor VARCHAR(20),
        bio TEXT)
    """);
  }

  static Future<void> insertData(String table, Map<String, Object> dados) async {
    final db = await database();
    print(await db.insert(table, dados, conflictAlgorithm: sql.ConflictAlgorithm.replace));
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await database();
    return await db.query(table);
  }

  static Future<List<Map<String, dynamic>>> getDataById(
      String table, List<String> columns, String whereString, List<dynamic> whereArgumento) async {
    final db = await database();
    return db.query(table, columns: columns, where: whereString, whereArgs: whereArgumento);
  }
}
