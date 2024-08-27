// lib/screens/backlog/components/models.dart

class Sprint {
  final int idSprint;
  final String objectif;
  final DateTime dateDebut;
  final DateTime dateFin;
  final String nameSprint;
  final List<Epic> epics;
  final List<Ticket> tickets;

  Sprint({
    required this.idSprint,
    required this.objectif,
    required this.dateDebut,
    required this.dateFin,
    required this.nameSprint,
    required this.epics,
    required this.tickets,
  });
}

class Epic {
  final String idEpic;
  final String name;
  final String description;
  final DateTime dateDebut;
  final DateTime dateFin;
  final String state;
  final List<Ticket> tickets;

  Epic({
    required this.idEpic,
    required this.name,
    required this.description,
    required this.dateDebut,
    required this.dateFin,
    required this.state,
    required this.tickets,
  });
}

class Ticket {
  final int idTicket;
  final String nameTicket;
  final String description;
  final DateTime dateDebut;
  final DateTime dateFin;
  final String type;
  final String status;
  final String assignee;
  final String priority;

  Ticket({
    required this.idTicket,
    required this.nameTicket,
    required this.description,
    required this.dateDebut,
    required this.dateFin,
    required this.type,
    required this.status,
    required this.assignee,
    required this.priority,
  });
}
