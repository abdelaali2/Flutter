import 'package:flutter/material.dart';
import 'package:moviesapp/data/datasource/local/Categories.dart';
import 'package:moviesapp/data/datasource/remote/APIService.dart';
import 'package:moviesapp/data/model/MovieCategory.dart';
import 'package:moviesapp/utilities/SearchBar.dart';

import '../utilities/CategoryGrid.dart';

class MoviesTab extends StatefulWidget {
  const MoviesTab({super.key});

  @override
  State<MoviesTab> createState() => _MoviesTabState();
}

class _MoviesTabState extends State<MoviesTab> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(const Duration(milliseconds: 1500), () {
          setState(() {});
        });
      },
      child: ListView(
        children: [
          SafeArea(
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
                  const SearchBar(),
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
                    future: APIService.api.fetchMovies(Categories[0]),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        MovieCategory movieResponse = snapshot.data!;
                        return CategoryGrid(movieResponse.results!);
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
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
                    future: APIService.api.fetchMovies(Categories[1]),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        MovieCategory movieResponse = snapshot.data!;
                        return CategoryGrid(movieResponse.results!);
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
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
                    future: APIService.api.fetchMovies(Categories[2]),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        MovieCategory movieResponse = snapshot.data!;
                        return CategoryGrid(movieResponse.results!);
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Upcoming",
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
                    future: APIService.api.fetchMovies(Categories[4]),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        MovieCategory category = snapshot.data!;
                        return CategoryGrid(category.results!);
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
