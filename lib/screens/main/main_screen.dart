import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/screens/backlog/backlog_screen.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:admin/screens/chronologie/chronologie.dart';
import 'package:admin/screens/GestionEquipe/team_management_page.dart';
import 'package:admin/screens/profile/profile_screen.dart';
import 'package:admin/screens/commentaire/commentaire.dart';
import 'package:admin/screens/ticket/MiseAJour.dart';
import 'package:admin/screens/login.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  bool _isAuthenticated = false;

  final List<Widget> _pages = [
    DashboardScreen(),
    BacklogScreen(),
    CalendarView(),
    TeamManagementPage(),
    ProfileScreen(),
    CommentsPage(),
    TicketPage(),
  ];

  void _onItemTapped(int index) {
    if (index == _pages.length) {
      _logout(); // Déclenche la déconnexion si l'élément "Log Out" est sélectionné
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  void _onLoginSuccess() {
    setState(() {
      _isAuthenticated = true;
    });
  }

  void _logout() {
    setState(() {
      _isAuthenticated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isAuthenticated) {
      return LoginPage(onLoginSuccess: _onLoginSuccess);
    }

    return Scaffold(  // Ajoutez la méthode Scaffold manquante ici
      key: context.read<MenuAppController>().scaffoldKey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: _pages[_currentIndex],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Backlog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Chronologie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Gestion d\'Équipe',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            label: 'Commentaires',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Mise à jour des tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Log Out',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    ); // Fin de la méthode Scaffold
  }
}
