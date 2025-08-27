class TaskModel {
  String taskTitle;
  bool taskStatus;

  TaskModel({required this.taskTitle, this.taskStatus = false});

  Map<String, dynamic> toMap() {
    return {'Title': taskTitle, 'Status': taskStatus};
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(taskTitle: map['Title'], taskStatus: map['Status']);
  }
}
