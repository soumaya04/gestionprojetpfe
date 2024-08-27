import 'package:flutter/material.dart';
import 'user.dart';
class UserProvider with ChangeNotifier {
  User _user = User(name: 'Nom d’utilisateur', email: 'email@example.com', avatarUrl: 'url/to/avatar');

  User get user => _user;

  void updateUser(String name, String email, String avatarUrl) {
    _user = User(name: name, email: email, avatarUrl: avatarUrl);
    notifyListeners();
  }
}
