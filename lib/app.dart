import 'package:atividade_tasklist/config/colors.dart';
import 'package:atividade_tasklist/pages/add_task_page.dart';
import 'package:atividade_tasklist/pages/home_page.dart';
import 'package:flutter/material.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      // Se você usar 'initialRoute', não precisa do 'home'
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(),
        "/addTask": (context) => const AddTaskPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
