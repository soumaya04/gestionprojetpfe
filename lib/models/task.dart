class Task {
  final String title;
  final String status;
  final double progress; // Removed the details field

  Task({
    required this.title,
    required this.status,
    required this.progress, // Removed details from constructor
  });
}

// Example task data
List<Task> demoTasks = [
  Task(title: "Task 1", status: "In Progress", progress: 0.5),
  Task(title: "Task 2", status: "Completed", progress: 1.0),
  Task(title: "Task 3", status: "Pending", progress: 0.2),
];

