// lib/models/epic.dart
import 'ticket.dart';

class Epic {
  int idEpic;
  String nomEpic; // Ajouté cette propriété
  DateTime dateDebut;
  DateTime dateFin;
  List<Ticket> tickets;

  Epic({
    required this.idEpic,
    required this.nomEpic, // Renommé en nomEpic
    required this.dateDebut,
    required this.dateFin,
    required this.tickets,
  });
}
