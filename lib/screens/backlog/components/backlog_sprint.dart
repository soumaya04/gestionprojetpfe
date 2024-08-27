import 'package:flutter/material.dart';

class BacklogSprint extends StatelessWidget {
  final String title;
  final String objective;
  final String startDate;
  final String endDate;
  final String status;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  BacklogSprint({
    required this.title,
    required this.objective,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF282A36),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              "Objectif: $objective",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              "Date début: $startDate",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              "Date fin: $endDate",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              "Status: $status",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: onEdit,
                  icon: Icon(Icons.edit, color: Colors.blue),
                ),
                SizedBox(width: 8),
                IconButton(
                  onPressed: onDelete,
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
