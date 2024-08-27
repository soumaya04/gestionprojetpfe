// lib/screens/dashboard/components/task_details.dart
import 'package:flutter/material.dart';

class TaskInfoCard extends StatelessWidget {
  final String title;
  final String status;
  final double progress; // Removed the details property

  const TaskInfoCard({
    Key? key,
    required this.title,
    required this.status,
    required this.progress, // Removed details from constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFF2A2D3E),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.task,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 8.0),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white24,
            color: Colors.blue,
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Icon(
                Icons.info,
                color: Colors.white70,
                size: 16,
              ),
              SizedBox(width: 4.0),
              Text(
                status,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
