import 'package:flutter/material.dart';
import 'package:moviesapp/data/datasource/local/Products.dart';
import 'package:moviesapp/data/model/SearchResponse.dart';

import '../data/datasource/remote/constants.dart';
import 'ProductInfo.dart';
import 'RatingStars.dart';

class SearchTile extends StatelessWidget {
  const SearchTile(this.tileItem, {super.key});

  final SearchResults tileItem;

  @override
  Widget build(BuildContext context) {
    String? title;
    dynamic releaseDate;
    dynamic voidImage;
    dynamic filledImage;
    int? id = tileItem.id;
    String? posterPath = tileItem.posterPath;
    String? mediaType = tileItem.mediaType;
    dynamic voteAverage = tileItem.voteAverage;

    if (tileItem.mediaType == Products.movie) {
      title = tileItem.title;
      releaseDate = tileItem.releaseDate;
      voteAverage = tileItem.voteAverage;
      voidImage = const AssetImage('assets/images/movie_void.png');
      filledImage = Image.asset(
        'assets/images/movie_filled.png',
        width: 24.0,
        height: 24.0,
      );
    } else if (tileItem.mediaType != Products.movie) {
      title = tileItem.name;
      releaseDate = tileItem.firstAirDate;
      voteAverage = tileItem.voteAverage;
      voidImage = const AssetImage('assets/images/tv_void.png');
      filledImage = Image.asset(
        'assets/images/tv_filled.png',
        width: 24.0,
        height: 24.0,
      );
    }
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductInfo(id!, mediaType!)));
      },
      leading: FadeInImage(
        width: 60,
        placeholder: voidImage,
        image: NetworkImage('$imageURL/$posterPath'),
        fit: BoxFit.contain,
        imageErrorBuilder: (context, error, stackTrace) {
          return SizedBox(width: 60, child: filledImage);
        },
      ),
      title: Text(
        "$title (${releaseDate?.split("-")[0]})",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      subtitle: RatingStars(voteAverage != null ? voteAverage.toDouble() : 0.0),
      trailing: filledImage,
    );
  }
}
