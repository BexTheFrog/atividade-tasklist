import 'package:atividade_tasklist/config/colors.dart';
import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});
  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.crumpet,
      appBar: AppBar(
        backgroundColor: AppColors.honeycomb,
        title: Text(
          "Nova Tarefa",
          style: TextStyle(
            color: AppColors.crumpet,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 10),
              Text("Tarefa"),
              TextFormField(
                maxLength: 150,
                decoration: InputDecoration(
                  labelText: 'Descreva sua tarefa',
                  filled: true, // ativa o preenchimento
                  fillColor: AppColors.biscuit, // cor de fundo
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.hotPaprika),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.hotPaprika,
                      width: 3,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
