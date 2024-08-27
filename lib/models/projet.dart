// lib/models/projet.dart
import 'sprint.dart';

class Projet {
  String nomProjet;
  List<Sprint> sprints;

  Projet({
    required this.nomProjet,
    required this.sprints,
  });
}
