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
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: GridView.builder(
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: movieList.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 1 / 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemBuilder: (context, index) => Container(
          width: MediaQuery.of(context).size.width,
          child: GestureDetector(
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
        ),
      ),
    );
  }
}
