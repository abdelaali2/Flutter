import 'package:flutter/material.dart';
import 'MovieInfo.dart';
import 'data/datasource/remote/constants.dart';
import 'data/model/MovieResponse.dart';

class GridSection extends StatelessWidget {
  List<Results> movieList;
  final void Function(Results) navigateToMovie;

  GridSection(this.movieList, this.navigateToMovie, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: movieList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          navigateToMovie(movieList[index]);
        },
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.network(
                  "${imageURL}${movieList[index].posterPath}",
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${movieList[index].title} (${movieList[index].releaseDate?.split("-")[0]})",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Rate: ${movieList[index].voteAverage} ⭐",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
