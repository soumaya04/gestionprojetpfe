// lib/models/RecentFile.dart
class RecentFile {
  final String? icon, title, responsiblePerson, duration, startDate, endDate;

  RecentFile({
    this.icon,
    this.title,
    this.responsiblePerson,
    this.duration,
    this.startDate,
    this.endDate,
  });
}

List<RecentFile> demoRecentFiles = [
  RecentFile(
    icon: "assets/icons/project_icon.svg",
    title: "Project Alpha",
    responsiblePerson: "John Doe",
    duration: "3 months",
    startDate: "01/01/2023",
    endDate: "31/03/2023",
  ),
  // Add more recent files as needed
];
