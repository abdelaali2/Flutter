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
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Drop down menu
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
              const SizedBox(
                height: 15,
              ),
              FutureBuilder(
                future: APIService.api.fetchMoviesInfo(_selectedValue),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    MovieResponse movieResponse = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: movieResponse.results?.length,
                      itemBuilder: (context, index) => ListTile(
                        onTap: () {
                          _navigateToMovie(movieResponse.results![index]);
                        },
                        leading: Image.network(
                            "${imageURL}${movieResponse.results![index].posterPath}"),
                        title: Text(
                            "${movieResponse.results![index].title} (${movieResponse.results![index].releaseDate?.split("-")[0]})"),
                        subtitle: Text(
                            "Rate: ${movieResponse.results![index].voteAverage} ⭐"),
                      ),
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
