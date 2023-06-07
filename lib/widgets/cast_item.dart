import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';

import '../data/model/movie.dart';

class CastItem extends StatelessWidget {
  final Actor actor;

  const CastItem({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              actor.picture,
              height: 76,
              width: 72,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            actor.name,
            style: primaryTextStyle.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
