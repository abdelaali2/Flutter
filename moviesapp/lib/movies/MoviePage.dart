import 'package:flutter/material.dart';

import '../data/datasource/remote/constants.dart';
import '../data/model/DetailedMovie.dart';
import 'SimilarMovies.dart';

class MoviePage extends StatelessWidget {
  MoviePage(this.movie, {super.key});
  DetailedMovie movie;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(
          height: 7,
        ),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.deepOrange.withOpacity(0.30),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3))
          ]),
          child: FadeInImage(
            width: 450,
            placeholder: const AssetImage('assets/images/logo.png'),
            image: NetworkImage('$imageURL${movie.posterPath}'),
            fit: BoxFit.contain,
            imageErrorBuilder: (context, error, stackTrace) {
              return SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset('assets/images/movie_filled.png'));
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "${movie.title}\n(${movie.releaseDate})",
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text("${movie.voteAverage} ⭐"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${movie.overview}",
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "You may also like",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SimilarMovies(movie),
      ]),
    );
  }
}
