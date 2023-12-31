//for homepage project:
class ToDoModel {
  int? projectid;
  String projectname;
  String projectlables;
  String projectstatus;

  ToDoModel({
    this.projectid,
    required this.projectname,
    required this.projectlables,
    required this.projectstatus,
  });

  factory ToDoModel.fromMap({required Map<String, dynamic> data}) {
    return ToDoModel(
      projectid: data['project_id'],
      projectname: data['project_name'],
      projectlables: data['project_labels'],
      projectstatus: data['project_status'],
    );
  }
}

// for list_component page:
class ListMyTaskModel {
  int? mytaskid;
  String today;
  String tomorrow;
  String thisweek;
  String highpriority;
  String mediumpriority;
  String date;
  String time;

  ListMyTaskModel({
    this.mytaskid,
    required this.today,
    required this.tomorrow,
    required this.thisweek,
    required this.highpriority,
    required this.mediumpriority,
    required this.date,
    required this.time,
  });

  factory ListMyTaskModel.fromMap({required Map<String, dynamic> data}) {
    return ListMyTaskModel(
      mytaskid: data['mytask_id'],
      today: data['to_day'],
      tomorrow: data['to_morrow'],
      thisweek: data['this_week'],
      highpriority: data['high_priority'],
      mediumpriority: data['medium_priority'],
      date: data['date'],
      time: data['time'],
    );
  }
}

// calander_components:
class CalenderModel {
  int? calenderid;
  String date;
  String time;
  String workinformation;

  CalenderModel(
      {this.calenderid,
      required this.date,
      required this.time,

      required this.workinformation});

  factory CalenderModel.fromMap({required Map<String, dynamic> data}) {
    return CalenderModel(
      calenderid: data['calender_id'],
      date: data['date'],
      time: data['time'],
      workinformation: data['workinformation'],
    );
  }
}
