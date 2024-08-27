import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/models/user_provider.dart';  // Ajoutez cette ligne

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF1E1E2C),
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        canvasColor: Color(0xFF2A2D3E),
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuAppController(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserProvider(),
          ),
        ],
        child: MainScreen(),
      ),
    );
  }
}
