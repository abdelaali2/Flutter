import 'package:flutter/material.dart';
import 'package:moviesapp/data/model/TVResponse.dart';

import 'data/datasource/remote/constants.dart';

class TVInfo extends StatelessWidget {
  TVInfo(this.tvShow, {super.key});

  TVResults tvShow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CineGuide'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(
              height: 7,
            ),
            SizedBox(
                width: 280,
                child: Image.network("$imageURL${tvShow.posterPath}")),
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
          ]),
        ),
      )),
    );
  }
}
