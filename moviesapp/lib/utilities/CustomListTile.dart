import 'package:flutter/material.dart';

import '../data/datasource/local/Products.dart';
import '../data/datasource/remote/constants.dart';
import '../data/model/MovieCategory.dart';
import '../data/model/TVCategory.dart';
import 'ProductInfo.dart';
import 'RatingStars.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(this.product, {super.key});

  final dynamic product;

  @override
  Widget build(BuildContext context) {
    int? id = product.id;
    String? title;
    String? posterPath = product.posterPath;
    String? productType;
    dynamic releaseDate;
    dynamic voteAverage = product.voteAverage;

    if (product is Movie) {
      product as Movie;
      title = product.title;
      releaseDate = product.releaseDate;
      productType = Products.movie;
    } else if (product is TVShow) {
      product as TVShow;
      title = product.name;
      releaseDate = product.firstAirDate;
      productType = Products.tvShow;
    }

    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductInfo(id!, productType!),
            ));
      },
      leading: Image.network(
        "$imageURL/$posterPath",
      ),
      title: Text(
        "$title (${releaseDate?.split("-")[0] ?? ""})",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      subtitle: RatingStars(voteAverage != null ? voteAverage.toDouble() : 0.0),
    );
  }
}
