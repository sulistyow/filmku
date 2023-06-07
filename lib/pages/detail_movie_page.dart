import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/widgets/genre_item.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../data/model/movie.dart';
import '../widgets/cast_item.dart';

class DetailMoviePage extends StatefulWidget {
  final Movie movie;

  const DetailMoviePage({super.key, required this.movie});

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              YoutubePlayer(
                controller: YoutubePlayerController(
                    initialVideoId: widget.movie.trailler.toString(),
                    flags: const YoutubePlayerFlags(
                      autoPlay: false,
                      mute: false,
                    )),
                onReady: () {},
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Image.asset(
                      'assets/detail_menu.png',
                      color: Colors.white,
                      height: 30,
                      width: 30,
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.movie.title,
                              style: secondaryTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Image.asset('assets/favorite.png'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset('assets/rating.png'),
                      const SizedBox(width: 3),
                      Text(
                        '${widget.movie}/10 IMDb',
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: widget.movie.genre
                          .split(',')
                          .map((genre) => GenreItem(genre: genre))
                          .toList()),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Length',
                            style: secondaryTextStyle.copyWith(),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.movie.runtime,
                            style: secondaryTextStyle.copyWith(
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Column(
                        children: [
                          Text(
                            'Language',
                            style: secondaryTextStyle.copyWith(),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.movie.language,
                            style: secondaryTextStyle.copyWith(
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Column(
                        children: [
                          Text(
                            'Rating',
                            style: secondaryTextStyle.copyWith(),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.movie.rated,
                            style: secondaryTextStyle.copyWith(
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: primaryTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.movie.description,
                        style: secondaryTextStyle.copyWith(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cast',
                        style: primaryTextStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: tagBackground),
                        child: Text(
                          'See more',
                          style: secondaryTextStyle.copyWith(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: widget.movie.actors
                          .map((actor) => CastItem(actor: actor))
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
