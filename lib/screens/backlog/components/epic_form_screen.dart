// lib/screens/backlog/components/epic_form_screen.dart
import 'package:flutter/material.dart';
import 'package:admin/models/epic.dart';

class EpicFormScreen extends StatelessWidget {
  final Epic? epic;

  EpicFormScreen({this.epic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(epic == null ? 'Ajouter Epic' : 'Modifier Epic'),
      ),
      body: Center(
        child: Text('Formulaire pour ${epic?.nomEpic ?? 'nouvelle epic'}'),
      ),
    );
  }
}
