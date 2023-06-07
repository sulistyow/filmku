import 'package:flutter/material.dart';
import 'package:movie_app/pages/detail_movie_page.dart';
import 'package:movie_app/theme.dart';

import '../data/model/movie.dart';

class NowShowing extends StatelessWidget {
  final Movie movie;

  const NowShowing({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailMoviePage(movie: movie)));
      },
      child: Container(
        width: 145,
        margin: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                movie.poster,
                height: 212,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              movie.title,
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Image.asset('assets/rating.png'),
                const SizedBox(width: 3),
                Text(
                  '${movie.imdbRating}/10 IMDb',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
