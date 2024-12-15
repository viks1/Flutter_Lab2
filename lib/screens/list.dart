import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/api.dart';

class JokesListScreen extends StatelessWidget {
  final String type;

  JokesListScreen({required this.type});

  Future<List<Joke>> fetchJokesByType() async {
    return await ApiServices.fetchJokesByType(type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$type Jokes'),
      ),
      body: FutureBuilder<List<Joke>>(
        future: fetchJokesByType(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final jokes = snapshot.data!;
            return ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                final joke = jokes[index];
                return ListTile(
                  title: Text(joke.setup),
                  subtitle: Text(joke.punchline),
                );
              },
            );
          } else {
            return Center(child: Text('Nema jokes'));
          }
        },
      ),
    );
  }
}