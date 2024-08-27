// lib/screens/dashboard/components/task_details.dart
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'package:admin/models/task.dart';
import 'task_info_card.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Task Details",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: defaultPadding),
            ...List.generate(demoTasks.length, (index) {
              final task = demoTasks[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: defaultPadding),
                child: TaskInfoCard(
                  title: task.title,
                  status: task.status,
                  progress: task.progress, // Removed details
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
