import 'package:flutter/material.dart';
import 'package:moviesapp/data/model/DetailedTVShow.dart';
import 'package:moviesapp/utilities/RatingStars.dart';

import '../data/datasource/remote/constants.dart';
import 'SimilarTVShows.dart';

class TVShowPage extends StatelessWidget {
  TVShowPage(this.tvShow, {super.key});
  DetailedTVShow tvShow;

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
            placeholder: const AssetImage('assets/images/tv_void.png'),
            image: NetworkImage('$imageURL/${tvShow.posterPath}'),
            fit: BoxFit.contain,
            imageErrorBuilder: (context, error, stackTrace) {
              return SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset('assets/images/tv_filled.png'));
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "${tvShow.name}\n(${tvShow.firstAirDate})",
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Center(
          child: Column(
            children: [
              Text("${tvShow.voteAverage}"),
              RatingStars(tvShow.voteAverage.toDouble()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${tvShow.overview}",
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
        SimilarTVShows(tvShow),
      ]),
    );
  }
}
