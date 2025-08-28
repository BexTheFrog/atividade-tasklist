import 'package:atividade_tasklist/config/colors.dart';
import 'package:atividade_tasklist/widgets/customFormField.dart';
import 'package:atividade_tasklist/widgets/customFormLabel.dart';
import 'package:flutter/material.dart';
import 'package:atividade_tasklist/model/task_model.dart';
import 'package:atividade_tasklist/services/task_service.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController controllerTask = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.vanilla,
      appBar: AppBar(
        backgroundColor: AppColors.moonstone,
        title: Text(
          "Nova Tarefa",
          style: TextStyle(
            color: AppColors.vanilla,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                LabelsForm(title: "Tarefa"),
                CustomFormField(
                  hintText: "Ex: Ir no mercado",
                  state: false,
                  controller: controllerTask,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (controllerTask.text.isNotEmpty) {
                      final newTask = TaskModel(
                        taskTitle: controllerTask.text,
                        taskDate: DateTime.now(),
                      );

                      await TaskService.addTask(newTask);

                      controllerTask.clear();

                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.moonstone,
                  ),
                  child: Text(
                    "Salvar Tarefa",
                    style: TextStyle(color: AppColors.vanilla),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
