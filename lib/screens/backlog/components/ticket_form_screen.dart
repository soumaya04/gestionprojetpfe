import 'package:flutter/material.dart';
import 'package:admin/models/ticket.dart';

class TicketFormScreen extends StatelessWidget {
  final Ticket? ticket;

  TicketFormScreen({this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ticket == null ? 'Ajouter Ticket' : 'Modifier Ticket'),
      ),
      body: Center(
        child: Text('Formulaire pour ${ticket?.nomTicket ?? 'nouveau ticket'}'),
      ),
    );
  }
}
