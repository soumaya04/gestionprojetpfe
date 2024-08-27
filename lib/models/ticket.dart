// lib/models/ticket.dart

class Ticket {
  int idTicket;
  String nomTicket; // Ajouté cette propriété
  String description;
  DateTime dateCreation;
  DateTime? dateResolution;

  Ticket({
    required this.idTicket,
    required this.nomTicket, // Renommé en nomTicket
    required this.description,
    required this.dateCreation,
    this.dateResolution,
  });
}
