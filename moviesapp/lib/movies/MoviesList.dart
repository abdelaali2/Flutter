import 'package:flutter/material.dart';
import 'package:moviesapp/utilities/CustomAppBar.dart';

import '../data/datasource/remote/constants.dart';
import '../data/model/MovieResponse.dart';

class MoviesList extends StatelessWidget {
  List<Results> movieList;
  final void Function(Results) navigateToMovie;

  MoviesList(this.movieList, this.navigateToMovie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: SingleChildScrollView(
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: movieList.length,
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              navigateToMovie(movieList[index]);
            },
            leading: Image.network(
              "${imageURL}${movieList[index].posterPath}",
            ),
            title: Text(
              "${movieList[index].title} (${movieList[index].releaseDate?.split("-")[0]})",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            subtitle: Text("Rate: ${movieList[index].voteAverage} ⭐"),
          ),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
