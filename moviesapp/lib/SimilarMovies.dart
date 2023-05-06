import 'package:flutter/material.dart';
import 'package:moviesapp/MoviesGrid.dart';
import 'package:moviesapp/data/datasource/remote/constants.dart';
import 'package:moviesapp/data/model/MovieResponse.dart';

import 'MovieInfo.dart';
import 'data/datasource/local/ctaegories.dart';
import 'data/datasource/remote/APIService.dart';

class SimilarMovies extends StatelessWidget {
  SimilarMovies(this.currentMovie, {super.key});

  Results currentMovie;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIService.api.fetchSimilarMovies(currentMovie.id!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          MovieResponse similarMoviesResponse = snapshot.data!;
          return SizedBox(
            width: double.infinity,
            height: 200,
            child: GridView.builder(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: similarMoviesResponse.results!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (context, index) {
                Results similarMovie = similarMoviesResponse.results![index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieInfo(similarMovie),
                        ));
                  },
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(150),
                        child: FadeInImage(
                          width: 150,
                          height: 150,
                          placeholder:
                              const AssetImage('assets/images/tab1.png'),
                          image: NetworkImage(
                              '$imageURL/${similarMovie.posterPath}'),
                          fit: BoxFit.cover,
                          imageErrorBuilder: (context, error, stackTrace) {
                            return SizedBox(
                                width: 150,
                                height: 150,
                                child: Image.asset('assets/images/tab1.png'));
                          },
                        ),
                      ),
                      Text("${similarMovie.title}"),
                    ],
                  ),
                );
              },
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
    );
  }
}
