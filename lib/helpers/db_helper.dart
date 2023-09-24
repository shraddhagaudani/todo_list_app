import 'package:flutter/cupertino.dart';
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

      //for list_components:
      String listmytaskquery =
          "CREATE TABLE IF NOT EXISTS listmytask(mytask_id INTEGER PRIMARY KEY AUTOINCREMENT,to_day TEXT NOT NULL,to_morrow TEXT NOT NULL,this_week TEXT NOT NULL,high_priority TEXT NOT NULL,medium_priority TEXT NOT NULL,date TEXT NOT NULL,time TEXT NOT NULL);";

      await db.execute(listmytaskquery);
    });

    //for calender_component:
    String calenderquery =
        "CREATE TABLE IF NOT EXISTS calender(calender_id INTEGER PRIMARY KEY AUTOINCREMENT,date TEXT NOT NULL,time TEXT NOT NULL,workinformation TEXT NOT NULL);";

    await db?.execute(calenderquery);
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

  Future<int> deleteProject({required int id}) async {
    await initDB();
    String query = "DELETE FROM todo WHERE project_id=?";

    List args = [id];

    int res = await db!.rawDelete(query, args);

    return res;
  }

  //for list_components:
  Future<int> insertListMyTask({required ListMyTaskModel data}) async {
    await initDB();

    String query =
        "INSERT INTO listmytask(to_day,to_morrow,this_week,high_priority,medium_priority,date,time)VALUES(?,?,?,?,?,?,?);";

    List args = [
      data.today,
      data.tomorrow,
      data.thisweek,
      data.highpriority,
      data.mediumpriority,
      data.date,
      data.time,
    ];

    int res = await db!.rawInsert(query, args);
    return res;
  }

  Future<List<ListMyTaskModel>> fetchListMyTask() async {
    await initDB();

    String query = "SELECT *FROM listmytask";

    List<Map<String, dynamic>> res = await db!.rawQuery(query);

    List<ListMyTaskModel> listmytaskmodel =
        await res.map((e) => ListMyTaskModel.fromMap(data: e)).toList();

    return listmytaskmodel;
  }

  Future<int> deleteListMyTask({required int id}) async {
    await initDB();

    String query = "DELETE FROM listmytask WHERE mytask_id=?";
    List args = [id];

    int res = await db!.rawDelete(query, args);
    return res;
  }

  //for Calender_components:
  Future<int> insertCalender({required CalenderModel data}) async {
    await initDB();

    String query = "INSERT INTO calender(date,time,workinformation)VALUES(?,?,?)";

    List args = [
      data.date,
      data.time,
      data.workinformation,
    ];
    int res = await db!.rawInsert(query, args);
    return res;
  }

  Future<List<CalenderModel>> fetchCalender() async {
    await initDB();
    String query = "SELECT *FROM calender";

    List<Map<String, dynamic>> res = await db!.rawQuery(query);

    List<CalenderModel> calendermodel =
        res.map((e) => CalenderModel.fromMap(data: e)).toList();
    return calendermodel;
  }

  Future<int> deleteCalender({required int id}) async {
    await initDB();
    String query = "DELETE FROM calender WHERE calender_id=?";

    List args = [id];

    int res = await db!.rawDelete(query,args);
    return res;
  }
}
