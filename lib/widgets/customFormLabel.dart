import 'package:flutter/material.dart';
import 'package:atividade_tasklist/config/colors.dart';

class LabelsForm extends StatelessWidget {
  final String title;

  const LabelsForm({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.moonstone,
        // sua cor definida no app_colors.dart
      ),
    );
  }
}
