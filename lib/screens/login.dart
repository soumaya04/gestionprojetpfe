import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function onLoginSuccess;

  LoginPage({required this.onLoginSuccess});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      // Add your authentication logic here
      // If authentication succeeds, call the login success function
      widget.onLoginSuccess();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 400, // Set the maximum width for the form
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Change color to white for better clarity
                        ),
                      ),
                      SizedBox(height: 8.0),

                      SizedBox(height: 24.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          labelStyle: TextStyle(
                            color: Colors.white, // White label text for better contrast
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1), // Light background for input fields
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, // White border for clarity
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        style: TextStyle(color: Colors.white), // White input text color
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value ?? '';
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors.white, // White label text for better contrast
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1), // Light background for input fields
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, // White border for clarity
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        style: TextStyle(color: Colors.white), // White input text color
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value ?? '';
                        },
                      ),
                      SizedBox(height: 8.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Handle forgot password action
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.purple),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Color(0xFF6200EE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text('LOGIN'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
