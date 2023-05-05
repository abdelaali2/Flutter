import 'package:flutter/material.dart';
import 'package:moviesapp/MovieInfo.dart';
import 'package:moviesapp/data/datasource/local/ctaegories.dart';
import 'package:moviesapp/data/datasource/remote/APIService.dart';
import 'package:moviesapp/data/datasource/remote/constants.dart';
import 'package:moviesapp/data/model/MovieResponse.dart';
import 'package:moviesapp/gridSection.dart';
import 'package:moviesapp/listSection.dart';

import 'BottomNavBar.dart';

class MoviesTab extends StatefulWidget {
  const MoviesTab({super.key});

  @override
  State<MoviesTab> createState() => _MoviesTabState();
}

class _MoviesTabState extends State<MoviesTab> {
  String _selectedValue = categories[0];
  bool _displayGrid = true;

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
          children: [
            // Drop down menu
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                    value: _selectedValue,
                    items: categories
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {
                      APIService.api.fetchMoviesInfo(value!);
                      setState(() {
                        _selectedValue = value;
                      });
                    }),
                IconButton(
                  icon: const Icon(Icons.grid_view_rounded),
                  onPressed: () {
                    setState(() {
                      _displayGrid = true;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.list),
                  onPressed: () {
                    setState(() {
                      _displayGrid = false;
                    });
                  },
                ),
              ],
            ),
            // Separator Sized Box.
            const SizedBox(
              height: 7,
            ),
            // Main Body
            FutureBuilder(
              future: APIService.api.fetchMoviesInfo(_selectedValue),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  MovieResponse movieResponse = snapshot.data!;
                  return _displayGrid
                      ? GridSection(movieResponse.results!, _navigateToMovie)
                      : ListSection(movieResponse.results!, _navigateToMovie);
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    ));
  }
}
