import 'epic.dart';
import 'ticket.dart';

class Sprint {
  int idSprint;
  String objectif;
  DateTime dateDebut;
  DateTime dateFin;
  String nomSprint; // Renommé en nomSprint
  List<Epic> epics;
  List<Ticket> tickets;

  Sprint({
    required this.idSprint,
    required this.objectif,
    required this.dateDebut,
    required this.dateFin,
    required this.nomSprint,
    required this.epics,
    required this.tickets,
  });
}
