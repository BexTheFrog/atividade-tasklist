import 'package:atividade_tasklist/config/colors.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.hotPaprika,
        title: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "To-Do List",
              style: TextStyle(
                color: AppColors.crumpet,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/addTask");
        },
        backgroundColor: AppColors.hotPaprika,
        child: Icon(Icons.add, color: AppColors.biscuit),
      ),
    );
  }
}
