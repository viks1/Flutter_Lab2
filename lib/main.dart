import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/random.dart';

void main() {
  runApp(JokeApp());
}

class JokeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
      routes: {
        '/randomJoke': (context) => RandomJokeScreen(),
      },
    );
  }
}