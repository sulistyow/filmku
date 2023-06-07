import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/widgets/now_showing_item.dart';
import 'package:movie_app/widgets/popular_item.dart';
import 'package:provider/provider.dart';

import '../provider/movie_provider.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    MovieProvider provider = Provider.of<MovieProvider>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Image.asset(
            'assets/Menu.png',
          ),
          title: Text(
            "Filmku",
            style: primaryTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
          actions: [Image.asset('assets/Notif.png')],
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Now Showing',
                    style: primaryTextStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: tagBackground),
                    child: Text(
                      'See more',
                      style: secondaryTextStyle.copyWith(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),

            // now showing content
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Row(
                      children: provider.movies
                          .map(
                            (movie) => NowShowing(
                              movie: movie,
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 24),

            // popular
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Popular',
                    style: primaryTextStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: tagBackground),
                    child: Text(
                      'See more',
                      style: secondaryTextStyle.copyWith(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: provider.movies
                        .map((movie) => PopularItem(movie: movie))
                        .toList()),
              ),
            ),
          ],
        ));
  }
}
