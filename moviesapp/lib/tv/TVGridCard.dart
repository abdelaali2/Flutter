import 'package:flutter/material.dart';
import 'package:moviesapp/data/model/TVResponse.dart';

import '../data/datasource/remote/constants.dart';

class TVGridCard extends StatelessWidget {
  TVResults tvShow;

  TVGridCard(this.tvShow, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
            "$imageURL${tvShow.posterPath}",
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "${tvShow.name} (${tvShow.firstAirDate?.split("-")[0]})",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                "Rate: ${tvShow.voteAverage} ⭐",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
