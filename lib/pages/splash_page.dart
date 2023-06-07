import 'package:flutter/material.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:movie_app/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "FilmKu",
          style: primaryTextStyle.copyWith(
              fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }

  getInit() async {
    await Provider.of<MovieProvider>(context, listen: false).getMovies();
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }
}
