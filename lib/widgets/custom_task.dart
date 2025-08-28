import 'package:atividade_tasklist/config/colors.dart';
import 'package:flutter/material.dart';

class CustomTask extends StatefulWidget {
  final String taskTitle;
  final DateTime taskDate;
  final bool initialStatus;
  final ValueChanged<bool>? onStatusChanged;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  const CustomTask({
    super.key,
    required this.taskTitle,
    required this.taskDate,
    this.initialStatus = false,
    this.onStatusChanged,
    this.onDelete,
    this.onEdit,
  });

  @override
  State<CustomTask> createState() => _CustomTaskState();
}

class _CustomTaskState extends State<CustomTask> {
  late bool taskStatus;

  @override
  void initState() {
    super.initState();
    taskStatus = widget.initialStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.moonstone,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.taskTitle,
            style: TextStyle(
              color: AppColors.vanilla,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                "Adicionado em: ",
                style: TextStyle(
                  color: AppColors.vanilla,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                "${widget.taskDate.day}/${widget.taskDate.month}/${widget.taskDate.year}",
                style: TextStyle(
                  color: AppColors.vanilla,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: taskStatus,
                    onChanged: (bool? value) {
                      setState(() {
                        taskStatus = value ?? false;
                      });
                      if (widget.onStatusChanged != null) {
                        widget.onStatusChanged!(taskStatus);
                      }
                    },
                    checkColor: AppColors.moonstone,
                    fillColor: WidgetStateProperty.all(AppColors.vanilla),
                  ),
                  Text(
                    "Concluída",
                    style: TextStyle(
                      color: AppColors.vanilla,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 150),
                  IconButton(
                    icon: Icon(Icons.edit, color: AppColors.vanilla),
                    onPressed: widget.onEdit,
                  ),
                  IconButton(
                    onPressed: widget.onDelete,
                    icon: Icon(Icons.delete, color: AppColors.vanilla),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
