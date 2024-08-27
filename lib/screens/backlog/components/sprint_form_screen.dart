// lib/screens/backlog/components/sprint_form_screen.dart
import 'package:flutter/material.dart';
import 'package:admin/models/sprint.dart';

class SprintFormScreen extends StatelessWidget {
  final Sprint? sprint;

  SprintFormScreen({this.sprint});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sprint == null ? 'Ajouter Sprint' : 'Modifier Sprint'),
      ),
      body: Center(
        child: Text('Formulaire pour ${sprint?.nomSprint ?? 'nouveau sprint'}'),
      ),
    );
  }
}
