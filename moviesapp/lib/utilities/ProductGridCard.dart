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
    String? posterPath = product.posterPath;
    dynamic releaseDate;
    dynamic voteAverage = product.voteAverage;

    if (product is Movie) {
      product as Movie;
      title = product.title;
      releaseDate = product.releaseDate;
    } else if (product is TVShow) {
      product as TVShow;
      title = product.name;
      releaseDate = product.firstAirDate;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Container(
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
        ),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$title (${releaseDate.split("-")[0]})",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 1),
              RatingStars(voteAverage.toDouble()),
            ],
          ),
        ),
      ],
    );
  }
}
