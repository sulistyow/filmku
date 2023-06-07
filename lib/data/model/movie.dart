// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  List<Movie> movies;

  Welcome({
    required this.movies,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    movies: List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "movies": List<dynamic>.from(movies.map((x) => x.toJson())),
  };
}

class Movie {
  String title;
  String year;
  String rated;
  String runtime;
  String genre;
  String description;
  String language;
  String poster;
  String trailler;
  String imdbRating;
  List<Actor> actors;

  Movie({
    required this.title,
    required this.year,
    required this.rated,
    required this.runtime,
    required this.genre,
    required this.description,
    required this.language,
    required this.poster,
    required this.trailler,
    required this.imdbRating,
    required this.actors,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    title: json["Title"],
    year: json["Year"],
    rated: json["Rated"],
    runtime: json["Runtime"],
    genre: json["Genre"],
    description: json["Description"],
    language: json["Language"],
    poster: json["Poster"],
    trailler: json["Trailler"],
    imdbRating: json["imdbRating"],
    actors: List<Actor>.from(json["Actors"].map((x) => Actor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Title": title,
    "Year": year,
    "Rated": rated,
    "Runtime": runtime,
    "Genre": genre,
    "Description": description,
    "Language": language,
    "Poster": poster,
    "Trailler": trailler,
    "imdbRating": imdbRating,
    "Actors": List<dynamic>.from(actors.map((x) => x.toJson())),
  };
}

class Actor {
  String name;
  String picture;

  Actor({
    required this.name,
    required this.picture,
  });

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
    name: json["Name"],
    picture: json["Picture"],
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Picture": picture,
  };
}
