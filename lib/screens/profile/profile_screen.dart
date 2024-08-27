import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:admin/models/user_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/header.dart'; // Assurez-vous que ce chemin est correct

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = userProvider.user;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0), // Espacement pour le header et les bords
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BacklogHeader(), // Remplacez l'AppBar par BacklogHeader

            // Ajouter un SizedBox pour l'espace entre le header et le contenu
            SizedBox(height: 16.0), // Ajustez la hauteur selon vos besoins

            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Card(
                    color: Color(0xFF2A2D3E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Container(
                              width: 150, // Réduit la largeur
                              height: 150, // Réduit la hauteur
                              child: Image.asset(
                                "assets/images/profile_pic.png",
                                fit: BoxFit.cover, // Ajuste pour mieux remplir le conteneur
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            user.email,
                            style: TextStyle(fontSize: 18, color: Colors.white70),
                          ),
                          SizedBox(height: 20),
                          Text(
                            '${user.name} ${user.name}', // Note: Adjust this if needed
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Gérez vos informations personnelles',
                            style: TextStyle(fontSize: 16, color: Colors.white60),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Nom',
                              labelStyle: TextStyle(color: Colors.white70),
                              filled: true,
                              fillColor: Color(0xFF3A3F54),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                            controller: TextEditingController(text: user.name),
                          ),
                          SizedBox(height: 30),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Prénom',
                              labelStyle: TextStyle(color: Colors.white70),
                              filled: true,
                              fillColor: Color(0xFF3A3F54),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                            controller: TextEditingController(text: user.name), // Adjust if you have a separate first name
                          ),
                          SizedBox(height: 30),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Mot de passe',
                              labelStyle: TextStyle(color: Colors.white70),
                              filled: true,
                              fillColor: Color(0xFF3A3F54),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                            obscureText: true,
                            controller: TextEditingController(text: '********'),
                          ),
                          SizedBox(height: 40),
                          ElevatedButton(
                            onPressed: () {
                              // Handle button press
                            },
                            child: Text('Enregistrer'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                              textStyle: TextStyle(fontSize: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: FaIcon(FontAwesomeIcons.facebook),
                                color: Colors.white,
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: FaIcon(FontAwesomeIcons.twitter),
                                color: Colors.white,
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: FaIcon(FontAwesomeIcons.linkedin),
                                color: Colors.white,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF1E1E2C),
    );
  }
}
