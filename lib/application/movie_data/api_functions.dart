import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_project/application/movie_data/movie_data.dart';

late Movie data;

Future<List<MovieData>> getMovie() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/trending/movie/day?api_key=b112189ea6f632bcf7580e8006c02ece'));

  if (response.statusCode == 200) {
    final bodyJson = jsonDecode(response.body);
    data = Movie.fromJson(bodyJson);
    return data.results;
  } else {}
  return data.results;
}

class Movie {
  final List<MovieData> results;

  Movie({required this.results});

  factory Movie.fromJson(Map<String, dynamic> json) {
    final List<dynamic> movieList = json['results'];
    final List<MovieData> movies =
        movieList.map((e) => MovieData.fromJson(e)).toList();
    return Movie(results: movies);
  }
}
