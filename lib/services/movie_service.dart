import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/data/model/movie.dart';

class MovieService {
  String baseUrl = 'https://mocki.io/v1/b3b69459-255e-425f-be52-6e012fa925ac';

  Future<List<Movie>> getMovies() async {
    var url = baseUrl;

    var response = await http.get(Uri.parse(url));

    List data = jsonDecode(response.body)['movies'];
    List<Movie> movies = [];

    for (var item in data) {
      movies.add(Movie.fromJson(item));
    }
    return movies;
  }
}
