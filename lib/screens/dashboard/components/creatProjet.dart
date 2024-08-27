import 'package:flutter/material.dart';
import 'nextpage.dart'; // Ensure this import is correct

class CreateProjectPage extends StatefulWidget {
  @override
  _CreateProjectPageState createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_checkInput);
  }

  void _checkInput() {
    setState(() {
      _isButtonEnabled = _controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212332),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Quel nom souhaitez-vous donner à votre projet ?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Saisissez le nom de votre projet",
                  hintStyle: TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Color(0xFF2A2D3E),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Retour à la page précédente
                  },
                  child: Text("Retour"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF9C27B0),
                    padding: EdgeInsets.symmetric(horizontal: 32),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _isButtonEnabled
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScrumMasterPage()),
                    );
                  }
                      : null,
                  child: Text("Suivant"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isButtonEnabled
                        ? Color(0xFF9C27B0)
                        : Colors.grey, // couleur de fond quand désactivé
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
