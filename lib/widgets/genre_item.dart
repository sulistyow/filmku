import 'package:flutter/material.dart';

import '../theme.dart';

class GenreItem extends StatelessWidget {
  final String genre;

  const GenreItem({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 4),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: tagBackground),
        child: Text(
          genre,
          style: secondaryTextStyle.copyWith(fontSize: 8, color: tagTextColor),
        ));
  }
}
