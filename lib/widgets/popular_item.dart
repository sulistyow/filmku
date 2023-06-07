import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/widgets/genre_item.dart';

import '../data/model/movie.dart';
import '../pages/detail_movie_page.dart';

class PopularItem extends StatelessWidget {
  final Movie movie;

  const PopularItem({super.key, required this.movie});

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
        margin: const EdgeInsets.only(bottom: 12, left: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                movie.poster,
                height: 128,
                width: 85,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      movie.title,
                      style: secondaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
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
                  const SizedBox(height: 8),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: movie.genre
                          .split(',')
                          .map((genre) => GenreItem(genre: genre))
                          .toList()),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 12,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        movie.runtime,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
