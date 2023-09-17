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
