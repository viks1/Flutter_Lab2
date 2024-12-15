import 'package:flutter/material.dart';
import '../services/api.dart';
import 'list.dart';

class HomeScreen extends StatelessWidget {
  Future<List<String>> fetchJokeTypes() async {
    return await ApiServices.fetchJokeTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipovi na jokes'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_chart_sharp),
            onPressed: () {
              Navigator.pushNamed(context, '/randomJoke');
            },
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: fetchJokeTypes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final jokeTypes = snapshot.data!;
            return ListView.builder(
              itemCount: jokeTypes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(jokeTypes[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JokesListScreen(type: jokeTypes[index]),
                      ),
                    );
                  },
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