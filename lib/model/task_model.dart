class TaskModel {
  String taskTitle;
  bool taskStatus;
  DateTime taskDate;

  TaskModel({
    required this.taskTitle,
    this.taskStatus = false,
    required this.taskDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'Title': taskTitle,
      'Status': taskStatus,
      'Date': taskDate.toIso8601String(),
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      taskTitle: map['Title'],
      taskStatus: map['Status'],
      taskDate: DateTime.parse(map['Date']),
    );
  }
}
