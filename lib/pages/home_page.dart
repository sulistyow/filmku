import 'package:flutter/material.dart';
import 'package:movie_app/pages/movie_page.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:movie_app/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String route = '/home';
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    MovieProvider provider = Provider.of<MovieProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: customBottomNav(),
      body: MoviePage(),
    );
  }

  Widget customBottomNav() {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
            if (currentIndex != 0) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Feature under development")));
            }
          });
        },
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/movie.png',
                width: 40,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ticket.png',
                color:
                    currentIndex == 1 ? primaryTextColor : secondaryTextColor,
                width: 40,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/favorite.png',
                color:
                    currentIndex == 2 ? primaryTextColor : secondaryTextColor,
                width: 40,
              ),
              label: ""),
        ]);
  }
}
