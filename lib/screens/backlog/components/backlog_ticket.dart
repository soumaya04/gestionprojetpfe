import 'package:flutter/material.dart';

class BacklogTicket extends StatelessWidget {
  final String title;
  final String assignee;
  final String dueDate;
  final String type;
  final String status;
  final String comments;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const BacklogTicket({
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
      color: Color(0xFF2A2D3E),
      child: ListTile(
        title: Text(title, style: TextStyle(color: Colors.white)),
        subtitle: Text("Assigné à: $assignee\nDate d'échéance: $dueDate", style: TextStyle(color: Colors.white70)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit, color: Colors.white),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
