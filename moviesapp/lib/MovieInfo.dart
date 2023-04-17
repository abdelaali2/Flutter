import 'package:flutter/material.dart';
import 'package:moviesapp/data/model/MovieResponse.dart';

import 'data/datasource/remote/constants.dart';

class MovieInfo extends StatelessWidget {
  final Results movieInfo;
  const MovieInfo(this.movieInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.network("${imageURL}${movieInfo.posterPath}"),
          Text("${movieInfo.title} (${movieInfo.releaseDate})"),
          Text("${movieInfo.voteAverage}"),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back))
        ]),
      )),
    );
  }
}
