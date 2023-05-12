import 'package:flutter/material.dart';
import 'package:moviesapp/data/datasource/remote/constants.dart';
import 'package:moviesapp/data/model/MovieCategory.dart';

import '../data/datasource/local/Products.dart';
import '../data/datasource/remote/APIService.dart';
import '../data/model/DetailedMovie.dart';
import '../utilities/NetworkError.dart';
import '../utilities/ProductInfo.dart';

class SimilarMovies extends StatelessWidget {
  const SimilarMovies(this.currentMovie, {super.key});

  final DetailedMovie currentMovie;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIService.api.fetchSimilarMovies(currentMovie.id!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          MovieCategory similarMoviesResponse = snapshot.data!;
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
                childAspectRatio: 1.120,
              ),
              itemBuilder: (context, index) {
                Movie similarMovie = similarMoviesResponse.results![index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductInfo(similarMovie.id!, Products.movie),
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
                              const AssetImage('assets/images/movie_void.png'),
                          image: NetworkImage(
                              '$imageURL/${similarMovie.posterPath}'),
                          fit: BoxFit.cover,
                          imageErrorBuilder: (context, error, stackTrace) {
                            return SizedBox(
                                width: 150,
                                height: 150,
                                child: Image.asset(
                                    'assets/images/movie_filled.png'));
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
          return NetworkError();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
