import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  Future initDB() async {
    String dbLocation = await getDatabasesPath();

    String path = join(dbLocation, "todo.db");

    Database db = await openDatabase(path,
        version: 1, onCreate: (Database db, _) async {});
  }
}
