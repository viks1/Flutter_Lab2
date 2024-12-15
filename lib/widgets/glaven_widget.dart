import 'package:flutter/material.dart';
import '../models/joke.dart';

class JokeCard extends StatelessWidget {
  final Joke joke;

  JokeCard({required this.joke});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              joke.setup,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              joke.punchline,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}