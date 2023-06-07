import 'package:flutter/material.dart';
import 'package:movie_app/pages/detail_movie_page.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/pages/movie_page.dart';
import 'package:movie_app/pages/splash_page.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(
          create: (context) => MovieProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Filmku',
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => const HomePage(),
          '/movie': (context) => const MoviePage(),
        },
      ),
    );
  }
}
