import 'package:flutter/material.dart';
import 'package:moviesapp/MovieInfo.dart';
import 'package:moviesapp/data/datasource/local/ctaegories.dart';
import 'package:moviesapp/data/datasource/remote/APIService.dart';
import 'package:moviesapp/data/datasource/remote/constants.dart';
import 'package:moviesapp/data/model/MovieResponse.dart';
import 'package:moviesapp/gridSection.dart';
import 'package:moviesapp/listSection.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            "assets/images/movie.png",
          ),
        ),
        title: Text('Movies Database'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Drop down menu
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                      value: _selectedValue,
                      items: categories
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
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
                        _displayGrid = true;
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
      )),
    );
  }
}
