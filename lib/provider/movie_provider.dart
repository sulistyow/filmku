import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:movie_app/services/movie_service.dart';

import '../data/model/movie.dart';

class MovieProvider with ChangeNotifier {
  List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  set movies(List<Movie> movies) {
    _movies = movies;
    notifyListeners();
  }

  Future<void> getMovies() async{
    try{
      List<Movie> movies =await MovieService().getMovies();
      _movies = movies;
    }catch(e){
      print(e);
    }
  }

}