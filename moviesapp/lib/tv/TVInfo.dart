import 'package:flutter/material.dart';
import 'package:moviesapp/data/model/TVResponse.dart';
import 'package:moviesapp/utilities/CustomAppBar.dart';

import '../data/datasource/remote/constants.dart';
import 'SimilarTVShows.dart';

class TVInfo extends StatelessWidget {
  TVInfo(this.tvShow, {super.key});

  TVResults tvShow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(
              height: 7,
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.deepOrange.withOpacity(0.30),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3))
              ]),
              child: FadeInImage(
                width: 450,
                placeholder: const AssetImage('assets/images/tab1.png'),
                image: NetworkImage('$imageURL${tvShow.posterPath}'),
                fit: BoxFit.contain,
                imageErrorBuilder: (context, error, stackTrace) {
                  return SizedBox(
                      width: 300,
                      height: 300,
                      child: Image.asset('assets/images/tab1.png'));
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${tvShow.name}\n(${tvShow.firstAirDate})",
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text("${tvShow.voteAverage} ⭐"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${tvShow.overview}",
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "You may also like",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SimilarTVShows(tvShow),
          ]),
        ),
      )),
    );
  }
}
