import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list_app/models/todo_model.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();
  Database? db;
//for homePage:
  Future initDB() async {
    String dbLocation = await getDatabasesPath();

    String path = join(dbLocation, "todo.db");

    db = await openDatabase(path, version: 1, onCreate: (Database db, _) async {
      String query =
          "CREATE TABLE IF NOT EXISTS todo(project_id INTEGER PRIMARY KEY AUTOINCREMENT,project_name TEXT NOT NULL,project_labels TEXT NOT NULL,project_status TEXT NOT NULL);";

      await db.execute(query);
    });
  }

  Future<int> insertProject({required ToDoModel data}) async {
    await initDB();

    String query =
        "INSERT INTO todo(project_name,project_labels,project_status)VALUES(?,?,?)";

    List args = [data.projectname, data.projectlables, data.projectstatus];

    int res = await db!.rawInsert(query, args);
    return res;
  }

  Future<List<ToDoModel>> fetchProject() async {
    await initDB();
    String query = "SELECT *FROM todo";

    List<Map<String, dynamic>> res = await db!.rawQuery(query);

    List<ToDoModel> todomodel =
        await res.map((e) => ToDoModel.fromMap(data: e)).toList();

    return todomodel;
  }

 Future<int> deleteProject({required int id})async{
    await initDB();
  String query =   "DELETE FROM todo WHERE project_id=?";

  List args = [id];

  int res = await db!.rawDelete(query,args);

  return res;
  }
}
