import 'package:flutter/material.dart';

class BacklogEpic extends StatelessWidget {
  final String title;
  final String assignee;
  final String dueDate;
  final String type;
  final String status;
  final String comments;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  BacklogEpic({
    required this.title,
    required this.assignee,
    required this.dueDate,
    required this.type,
    required this.status,
    required this.comments,
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
              "Assigné à: $assignee",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              "Date due: $dueDate",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              "Type: $type",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              "Status: $status",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              "Commentaires: $comments",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
