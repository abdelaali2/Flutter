import 'package:flutter/material.dart';
import 'package:moviesapp/data/model/SearchResponse.dart';

import '../data/datasource/remote/constants.dart';
import '../utilities/ProductInfo.dart';

class SearchMovieTile extends StatelessWidget {
  const SearchMovieTile(this.searchedMovie, {super.key});

  final SearchResults searchedMovie;

  @override
  Widget build(BuildContext context) {
    print("searchedMovie ${searchedMovie}");
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductInfo(searchedMovie.id!, searchedMovie.mediaType!)));
      },
      leading: FadeInImage(
        width: 60,
        placeholder: const AssetImage('assets/images/movie_void.png'),
        image: NetworkImage('$imageURL/${searchedMovie.posterPath}'),
        fit: BoxFit.contain,
        imageErrorBuilder: (context, error, stackTrace) {
          return SizedBox(
              width: 60, child: Image.asset('assets/images/movie_filled.png'));
        },
      ),
      title: Text(
        "${searchedMovie.title} (${searchedMovie.releaseDate?.split("-")[0]})",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      subtitle: Text("Rate: ${searchedMovie.voteAverage} ⭐"),
      trailing: Image.asset(
        'assets/images/movie_filled.png',
        width: 24.0,
        height: 24.0,
      ),
    );
  }
}
