import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/joke.dart';

class ApiServices {
  static const String baseUrl = 'https://official-joke-api.appspot.com';

  // probaj da zemes
  static Future<List<String>> fetchJokeTypes() async {
    final response = await http.get(Uri.parse('$baseUrl/types'));
    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body));
    } else {
      throw Exception('ne mozhe da najde joke');
    }
  }

  // zemi po tip
  static Future<List<Joke>> fetchJokesByType(String type) async {
    final response = await http.get(Uri.parse('$baseUrl/jokes/$type/ten'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Joke.fromJson(json)).toList();
    } else {
      throw Exception('ne mozhe da najde joke');
    }
  }

  // zemi random
  static Future<Joke> fetchRandomJoke() async {
    final response = await http.get(Uri.parse('$baseUrl/random_joke'));
    if (response.statusCode == 200) {
      return Joke.fromJson(json.decode(response.body));
    } else {
      throw Exception('ne mozhe da najde joke');
    }
  }
}