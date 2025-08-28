import 'dart:convert';
import 'package:atividade_tasklist/model/task_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskService {
  static const String _tasksKey = 'tasks';

  static Future<List<TaskModel>> getTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tasksString = prefs.getString(_tasksKey);
    if (tasksString == null) return [];

    List<dynamic> tasksJson = jsonDecode(tasksString);
    return tasksJson.map((taskMap) => TaskModel.fromMap(taskMap)).toList();
  }

  static Future<void> saveTasks(List<TaskModel> tasks) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> tasksMap = tasks
        .map((task) => task.toMap())
        .toList();
    await prefs.setString(_tasksKey, jsonEncode(tasksMap));
  }

  static Future<void> addTask(TaskModel task) async {
    List<TaskModel> tasks = await getTasks();
    tasks.add(task);
    await saveTasks(tasks);
  }

  static Future<void> toggleTaskDone(int index) async {
    List<TaskModel> tasks = await getTasks();
    tasks[index].taskStatus = !tasks[index].taskStatus;
    await saveTasks(tasks);
  }

  static Future<void> deleteTask(int index) async {
    List<TaskModel> tasks = await getTasks();
    tasks.removeAt(index);
    await saveTasks(tasks);
  }
}
