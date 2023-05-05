import 'package:flutter/material.dart';

import 'data/datasource/remote/constants.dart';
import 'data/model/MovieResponse.dart';

class ListSection extends StatelessWidget {
  List<Results> movieList;
  final void Function(Results) navigateToMovie;

  ListSection(this.movieList, this.navigateToMovie, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}