import 'package:flutter/material.dart';
import 'package:moviesapp/MovieInfo.dart';
import 'package:moviesapp/data/datasource/local/ctaegories.dart';
import 'package:moviesapp/data/datasource/remote/APIService.dart';
import 'package:moviesapp/data/datasource/remote/constants.dart';
import 'package:moviesapp/data/model/MovieResponse.dart';

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
                    icon: const Icon(Icons.grid_view),
                    onPressed: () {
                      _displayGrid = true;
                      setState(() {});
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.list),
                    onPressed: () {
                      _displayGrid = false;
                      setState(() {});
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
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: movieResponse.results?.length ?? 0,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                _navigateToMovie(movieResponse.results![index]);
                              },
                              child: Card(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Image.network(
                                        "${imageURL}${movieResponse.results![index].posterPath}",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${movieResponse.results![index].title} (${movieResponse.results![index].releaseDate?.split("-")[0]})",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            "Rate: ${movieResponse.results![index].voteAverage} ⭐",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: movieResponse.results?.length ?? 0,
                            itemBuilder: (context, index) => ListTile(
                              onTap: () {
                                _navigateToMovie(movieResponse.results![index]);
                              },
                              leading: Image.network(
                                "${imageURL}${movieResponse.results![index].posterPath}",
                              ),
                              title: Text(
                                "${movieResponse.results![index].title} (${movieResponse.results![index].releaseDate?.split("-")[0]})",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              subtitle: Text(
                                  "Rate: ${movieResponse.results![index].voteAverage} ⭐"),
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                          );
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
