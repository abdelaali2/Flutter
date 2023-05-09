import 'package:flutter/material.dart';
import 'package:moviesapp/data/model/TVCategory.dart';

import '../data/datasource/remote/constants.dart';
import '../data/model/MovieCategory.dart';
import 'RatingStars.dart';

class ProductGridCard extends StatelessWidget {
  ProductGridCard(this.product, {super.key});
  dynamic product;

  @override
  Widget build(BuildContext context) {
    String? title;
    String? posterPath;
    dynamic releaseDate;
    dynamic voteAverage;

    if (product is Movie) {
      product = product as Movie;
      title = product.title;
      posterPath = product.posterPath;
      releaseDate = product.releaseDate;
      voteAverage = product.voteAverage;
    } else if (product is TVShow) {
      product = product as TVShow;
      title = product.name;
      posterPath = product.posterPath;
      releaseDate = product.firstAirDate;
      voteAverage = product.voteAverage;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Image.network(
            "$imageURL/$posterPath",
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "$title (${releaseDate.split("-")[0]})",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              RatingStars(voteAverage.toDouble()),
            ],
          ),
        ),
      ],
    );
  }
}
