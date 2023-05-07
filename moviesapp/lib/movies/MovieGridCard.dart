import 'package:flutter/material.dart';

import '../data/datasource/remote/constants.dart';
import '../data/model/MovieResponse.dart';

class MovieGridCard extends StatelessWidget {
  MovieGridCard(this.movie, {super.key});
  Results movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Image.network(
            "$imageURL${movie.posterPath}",
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "${movie.title} (${movie.releaseDate?.split("-")[0]})",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                "Rate: ${movie.voteAverage} ⭐",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
