import 'package:flutter/material.dart';
import 'package:moviesapp/data/model/MovieResponse.dart';

import 'data/datasource/remote/constants.dart';

class MovieInfo extends StatelessWidget {
  final Results movieInfo;
  const MovieInfo(this.movieInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CineGuide'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(
              height: 7,
            ),
            SizedBox(
                width: 280,
                child: Image.network("${imageURL}${movieInfo.posterPath}")),
            Text(
              "${movieInfo.title}\n(${movieInfo.releaseDate})",
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text("${movieInfo.voteAverage} ⭐"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${movieInfo.overview}",
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            // IconButton(
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //     icon: const Icon(Icons.arrow_back))
          ]),
        ),
      )),
    );
  }
}
