import 'package:atividade_tasklist/config/colors.dart';
import 'package:atividade_tasklist/model/task_model.dart';
import 'package:atividade_tasklist/services/task_service.dart';
import 'package:atividade_tasklist/widgets/custom_task.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TaskModel> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    List<TaskModel> loadedTasks = await TaskService.getTasks();
    setState(() {
      tasks = loadedTasks;
    });
  }

  Future<void> _toggleTaskDone(int index) async {
    await TaskService.toggleTaskDone(index);
    _loadTasks();
  }

  Future<void> _deleteTask(int index) async {
    await TaskService.deleteTask(index);
    _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.vanilla,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "To-Do List",
              style: TextStyle(
                color: AppColors.moonstone,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: tasks.isEmpty
            ? Center(
                child: Text(
                  "Nenhuma tarefa ainda!",
                  style: TextStyle(color: AppColors.moonstone, fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return CustomTask(
                    taskTitle: task.taskTitle,
                    taskDate: task.taskDate,
                    initialStatus: task.taskStatus,
                    onStatusChanged: (status) => _toggleTaskDone(index),
                    onDelete: () => _deleteTask(index),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/addTask").then((_) => _loadTasks());
        },
        backgroundColor: AppColors.moonstone,
        child: Icon(Icons.add, color: AppColors.vanilla),
      ),
    );
  }
}
