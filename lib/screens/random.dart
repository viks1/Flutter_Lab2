import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/api.dart';

class RandomJokeScreen extends StatelessWidget {
  Future<Joke> fetchRandomJoke() async {
    return await ApiServices.fetchRandomJoke();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Joke')),
      body: FutureBuilder<Joke>(
        future: fetchRandomJoke(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final joke = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Setup: ${joke.setup}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('Punchline: ${joke.punchline}', style: TextStyle(fontSize: 16)),
                ],
              ),
            );
          } else {
            return Center(child: Text('Nema random jokes'));
          }
        },
      ),
    );
  }
}