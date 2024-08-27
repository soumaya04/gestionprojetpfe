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

class TeamManagementPage extends StatefulWidget {
  @override
  _TeamManagementPageState createState() => _TeamManagementPageState();
}

class _TeamManagementPageState extends State<TeamManagementPage> {
  List<TeamMember> teamMembers = [
    TeamMember(name: 'Admin', role: 'member_scrum', email: 'mailadmin123456@gmail.com', id: '668led527d5c9f0a26e1052a'),
    TeamMember(name: 'User', role: 'member_scrum', email: 'maildeuser@gmail.com', id: '668led527d5c9f0a26e1052b'),
  ];

  void addTeamMember(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController roleController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController idController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Ajouter un Membre de l\'Équipe'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Nom'),
                ),
                TextField(
                  controller: roleController,
                  decoration: InputDecoration(labelText: 'Rôle'),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: idController,
                  decoration: InputDecoration(labelText: 'ID'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  teamMembers.add(TeamMember(
                    name: nameController.text,
                    role: roleController.text,
                    email: emailController.text,
                    id: idController.text,
                  ));
                });
                Navigator.of(context).pop();
              },
              child: Text('Ajouter'),
            ),
          ],
        );
      },
    );
  }

  void editTeamMember(BuildContext context, TeamMember member) {
    TextEditingController nameController = TextEditingController(text: member.name);
    TextEditingController roleController = TextEditingController(text: member.role);
    TextEditingController emailController = TextEditingController(text: member.email);
    TextEditingController idController = TextEditingController(text: member.id);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Modifier un Membre de l\'Équipe'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Nom'),
                ),
                TextField(
                  controller: roleController,
                  decoration: InputDecoration(labelText: 'Rôle'),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: idController,
                  decoration: InputDecoration(labelText: 'ID'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  member.name = nameController.text;
                  member.role = roleController.text;
                  member.email = emailController.text;
                  member.id = idController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Modifier'),
            ),
          ],
        );
      },
    );
  }

  void deleteTeamMember(TeamMember member) {
    setState(() {
      teamMembers.remove(member);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0), // Espacement pour le header et les bords
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TeamManagementHeader(),

            // Ajouter un SizedBox pour l'espace entre le header et le tableau
            SizedBox(height: 16.0), // Ajustez la hauteur selon vos besoins

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
                            DataColumn(label: Text('EDIT')),
                            DataColumn(label: Text('DELETE')),
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
                                DataCell(
                                  IconButton(
                                    icon: Icon(Icons.edit, color: Colors.yellow[700]),
                                    onPressed: () => editTeamMember(context, member),
                                  ),
                                ),
                                DataCell(
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red[700]),
                                    onPressed: () => deleteTeamMember(member),
                                  ),
                                ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => addTeamMember(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple[900],
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}
