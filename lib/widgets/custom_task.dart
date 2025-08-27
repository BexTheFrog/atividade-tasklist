import 'package:flutter/material.dart';

class CustomTask extends StatelessWidget {
  final String taskTitle;
  final bool taskStatus;
  final DateTime taskDate;

  const CustomTask({
    super.key,
    required this.taskTitle,
    required this.taskStatus,
    required this.taskDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          maxLength: 150,
          decoration: InputDecoration(
            labelText: taskTitle,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
        ),
      ],
    );
  }
}
