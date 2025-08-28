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
    tasks[index].taskStatus = !tasks[index].taskStatus;
    await TaskService.saveTasks(tasks);
    setState(() {});
  }

  Future<void> _deleteTask(int index) async {
    tasks.removeAt(index);
    await TaskService.saveTasks(tasks);
    setState(() {});
  }

  Future<void> _editTask(int index) async {
    TextEditingController editController = TextEditingController(
      text: tasks[index].taskTitle,
    );

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Editar tarefa"),
        content: TextField(
          controller: editController,
          decoration: InputDecoration(hintText: "Digite o novo título"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancelar"),
          ),
          TextButton(
            onPressed: () async {
              tasks[index].taskTitle = editController.text;
              await TaskService.saveTasks(tasks);
              setState(() {});
              Navigator.pop(context);
            },
            child: Text("Salvar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final completedCount = tasks.where((t) => t.taskStatus).length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.vanilla,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "To-Do List ($completedCount/${tasks.length})",
              style: TextStyle(
                color: AppColors.moonstone,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_sweep, color: AppColors.moonstone),
            onPressed: () async {
              tasks.removeWhere((task) => task.taskStatus);
              await TaskService.saveTasks(tasks);
              setState(() {});
            },
            tooltip: "Remover todas as tarefas concluídas",
          ),
        ],
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
                    onEdit: () => _editTask(index),
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
