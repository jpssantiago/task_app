import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task_app/models/task.dart';
import 'package:task_app/providers/task_provider.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  TaskItem({
    @required this.task,
  });

  @override
  Widget build(BuildContext context) {
    bool isCompleted() {
      return task.status == TaskStatus.completed;
    }

    void toggleCompleted(bool value) {
      var provider = Provider.of<TaskProvider>(context, listen: false);
      if (value) {
        provider.setStatus(
          task: task,
          status: TaskStatus.completed,
        );
      } else {
        provider.setStatus(
          task: task,
          status: TaskStatus.active,
        );
      }
    }

    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
      title:
          Text(task.status == TaskStatus.completed ? 'completed' : task.title),
      trailing: Checkbox(
        value: isCompleted(),
        onChanged: toggleCompleted,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}