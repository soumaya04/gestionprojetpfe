import 'package:flutter/material.dart';
import 'components/header.dart'; // Assurez-vous que le chemin est correct

class Ticket {
  String nameTicket;
  String type;
  String status;
  String assignee;
  String priority;
  DateTime dateDebut;
  DateTime dateFin;

  Ticket({
    required this.nameTicket,
    required this.type,
    required this.status,
    required this.assignee,
    required this.priority,
    required this.dateDebut,
    required this.dateFin,
  });
}

class Epic {
  String name;
  List<Ticket> tickets;

  Epic({required this.name, required this.tickets});
}

class Sprint {
  String name;
  DateTime dateDebut;
  DateTime dateFin;
  List<Epic> epics;

  Sprint({required this.name, required this.dateDebut, required this.dateFin, required this.epics});
}

class BacklogScreen extends StatefulWidget {
  @override
  _BacklogScreenState createState() => _BacklogScreenState();
}

class _BacklogScreenState extends State<BacklogScreen> {
  List<Sprint> sprints = [
    Sprint(
      name: "Sprint 4",
      dateDebut: DateTime(2024, 6, 12),
      dateFin: DateTime(2024, 6, 23),
      epics: [
        Epic(
          name: "Epic1",
          tickets: [
            Ticket(
              nameTicket: "Ticket 1",
              type: "task",
              status: "ToDo",
              assignee: "john.doe@example.com",
              priority: "High",
              dateDebut: DateTime(2024, 6, 6),
              dateFin: DateTime(2024, 6, 16),
            ),
            Ticket(
              nameTicket: "Ticket 2",
              type: "bug",
              status: "InProgress",
              assignee: "jane.doe@example.com",
              priority: "High",
              dateDebut: DateTime(2024, 6, 12),
              dateFin: DateTime(2024, 6, 18),
            ),
          ],
        ),
      ],
    ),
  ];

  // Variables d'état pour gérer l'affichage des sections
  bool showSprintSection = false;
  bool showEpicSection = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BacklogHeader(), // Utilisez le header ici
          SizedBox(height: 10), // Ajoutez un espace ici
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // Barre similaire à celle de la capture d'écran
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        height: 60,
                        color: Color(0xFF9C27B0), // Couleur unie
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Backlog',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF673AB7),
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      showSprintSection = true;
                                    });
                                  },
                                  child: Text('Ajouter un Sprint'),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF673AB7),
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      showEpicSection = true;
                                    });
                                  },
                                  child: Text('Créer une Epic'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: sprints.map((sprint) {
                              return Card(
                                color: Color(0xFF512DA8),
                                margin: EdgeInsets.all(8.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: ExpansionTile(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        sprint.name,
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          // Action pour démarrer le sprint
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF673AB7),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30.0),
                                          ),
                                        ),
                                        child: Text("Démarrer le Sprint"),
                                      ),
                                    ],
                                  ),
                                  children: sprint.epics.map((epic) {
                                    return Card(
                                      color: Color(0xFF673AB7),
                                      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      child: ExpansionTile(
                                        title: Text(
                                          epic.name,
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                        ),
                                        children: epic.tickets.map((ticket) {
                                          return Container(
                                            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                            decoration: BoxDecoration(
                                              color: Color(0xFF9575CD),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                            child: ListTile(
                                              title: Text(ticket.nameTicket, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                              subtitle: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Type: ${ticket.type}', style: TextStyle(color: Colors.white)),
                                                  Text('Statut: ${ticket.status}', style: TextStyle(color: Colors.white)),
                                                  Text('Assigné à: ${ticket.assignee}', style: TextStyle(color: Colors.white)),
                                                  Text('Priorité: ${ticket.priority}', style: TextStyle(color: Colors.white)),
                                                  Text('Début: ${ticket.dateDebut.toString().split(' ')[0]}', style: TextStyle(color: Colors.white)),
                                                  Text('Fin: ${ticket.dateFin.toString().split(' ')[0]}', style: TextStyle(color: Colors.white)),
                                                ],
                                              ),
                                              trailing: IconButton(
                                                icon: Icon(Icons.delete, color: Color(0xFFFF5252)),
                                                onPressed: () {
                                                  // Action pour supprimer le ticket
                                                },
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BacklogScreen(),
  ));
}
