import 'package:flutter/material.dart';
import 'components/header.dart'; // Assurez-vous que ce chemin est correct

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CommentsPage(),
    );
  }
}

class CommentsPage extends StatelessWidget {
  final List<Comment> comments = [
    Comment(
      username: 'User1',
      content: 'This is a comment.',
      datePosted: DateTime.now().subtract(Duration(days: 1)),
    ),
    Comment(
      username: 'User2',
      content: 'Another comment.',
      datePosted: DateTime.now().subtract(Duration(hours: 5)),
    ),
  ];

  final double defaultPadding = 16.0; // Define a padding value here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0, // Cache l'AppBar
      ),
      body: Column(
        children: [
          SizedBox(height: 16.0),// Use the padding value here
          CommentaireHeader(), // Integrate your existing header
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Commentaires',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        return CommentCard(comment: comments[index]);
                      },
                    ),
                  ),
                  CommentInputField(),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFF212332),
    );
  }
}

class Comment {
  final String username;
  final String content;
  final DateTime datePosted;

  Comment({
    required this.username,
    required this.content,
    required this.datePosted,
  });
}

class CommentCard extends StatelessWidget {
  final Comment comment;

  CommentCard({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF2A2D3E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment.username,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              comment.content,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Posté le ${comment.datePosted.toLocal()}'.split(' ')[0],
              style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class CommentInputField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF9C27B0), Colors.blueGrey.shade900],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Ajouter un commentaire...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none, // Remove the default border
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              // Logic to post a comment
              _controller.clear();
            },
            child: Icon(Icons.send),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(16),
              shape: CircleBorder(),
              backgroundColor: Color(0xFF212332), // Updated from 'primary' to 'backgroundColor'
            ),
          ),
        ],
      ),
    );
  }
}
