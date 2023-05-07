import 'package:flutter/material.dart';
import 'package:moviesapp/data/datasource/local/ctaegories.dart';
import 'package:moviesapp/data/datasource/remote/APIService.dart';
import 'package:moviesapp/data/model/MovieResponse.dart';

import 'MovieInfo.dart';
import 'MoviesGrid.dart';

class MoviesTab extends StatefulWidget {
  const MoviesTab({super.key});

  @override
  State<MoviesTab> createState() => _MoviesTabState();
}

class _MoviesTabState extends State<MoviesTab> {
  void _navigateToMovie(Results response) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieInfo(response),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Separator Sized Box.
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Now Playing",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Separator Sized Box.
            const SizedBox(
              height: 5,
            ),
            // Main Body
            FutureBuilder(
              future: APIService.api.fetchMoviesInfo(categories[0]),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  MovieResponse movieResponse = snapshot.data!;
                  return MoviesGrid(movieResponse.results!, _navigateToMovie);
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Top Rated",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Separator Sized Box.
            const SizedBox(
              height: 5,
            ),
            FutureBuilder(
              future: APIService.api.fetchMoviesInfo(categories[1]),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  MovieResponse movieResponse = snapshot.data!;
                  return MoviesGrid(movieResponse.results!, _navigateToMovie);
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Popular",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Separator Sized Box.
            const SizedBox(
              height: 5,
            ),
            FutureBuilder(
              future: APIService.api.fetchMoviesInfo(categories[2]),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  MovieResponse movieResponse = snapshot.data!;
                  return MoviesGrid(movieResponse.results!, _navigateToMovie);
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    ));
  }
}
