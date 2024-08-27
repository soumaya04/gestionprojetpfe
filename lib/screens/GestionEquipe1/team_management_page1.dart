import 'package:flutter/material.dart';
import 'components/header.dart'; // Assurez-vous que ce chemin est correct

class TeamMember {
  String name;
  String role;
  String email;
  String id;

  TeamMember({
    required this.name,
    required this.role,
    required this.email,
    required this.id,
  });
}

class TeamManagementPage1 extends StatefulWidget {
  @override
  _TeamManagementPageState1 createState() => _TeamManagementPageState1();
}

class _TeamManagementPageState1 extends State<TeamManagementPage1> {
  List<TeamMember> teamMembers = [
    TeamMember(name: 'Admin', role: 'member_scrum', email: 'mailadmin123456@gmail.com', id: '668led527d5c9f0a26e1052a'),
    TeamMember(name: 'User', role: 'member_scrum', email: 'maildeuser@gmail.com', id: '668led527d5c9f0a26e1052b'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TeamManagementHeader(),
            SizedBox(height: 16.0), // Espacement entre le header et le tableau
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text('PHOTO')),
                            DataColumn(label: Text('MEMBER ID')),
                            DataColumn(label: Text('MEMBER NAME')),
                            DataColumn(label: Text('MEMBER MAIL')),
                            DataColumn(label: Text('MEMBER ROLE')),
                          ],
                          rows: teamMembers.map((member) {
                            return DataRow(
                              cells: [
                                DataCell(CircleAvatar(
                                  child: Text(member.name[0]),
                                  backgroundColor: Colors.deepPurple,
                                )),
                                DataCell(Text(member.id)),
                                DataCell(Text(member.name)),
                                DataCell(Text(member.email)),
                                DataCell(Text(member.role)),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}
