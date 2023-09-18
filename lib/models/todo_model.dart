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

  ListMyTaskModel({
    this.mytaskid,
    required this.today,
    required this.tomorrow,
    required this.thisweek,
    required this.highpriority,
    required this.mediumpriority,
  });

  factory ListMyTaskModel.fromMap({required Map<String, dynamic> data}) {
    return ListMyTaskModel(
        today: data['to_day'],
        tomorrow: data['to_morrow'],
        thisweek: data['this_week'],
        highpriority: data['high_priority'],
        mediumpriority: data['medium_priority']);
  }
}
