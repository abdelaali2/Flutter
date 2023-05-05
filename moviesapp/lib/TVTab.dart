import 'package:flutter/material.dart';
import 'package:moviesapp/TVGrid.dart';
import 'package:moviesapp/TVInfo.dart';

import 'data/datasource/local/ctaegories.dart';
import 'data/datasource/remote/APIService.dart';
import 'data/model/TVResponse.dart';

class TVTab extends StatefulWidget {
  const TVTab({super.key});

  @override
  State<TVTab> createState() => _TVTabState();
}

class _TVTabState extends State<TVTab> {
  void _navigateToTVShow(TVResults response) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TVInfo(response),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Separator Sized Box.
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Airing Today",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Separator Sized Box.
            const SizedBox(
              height: 5,
            ),
            // Main Body
            FutureBuilder(
              future: APIService.api.fetchTVInfo(categories[3]),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  TVResponse tvResponse = snapshot.data!;
                  return TVGrid(tvResponse.results!, _navigateToTVShow);
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Top Rated",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Separator Sized Box.
            const SizedBox(
              height: 5,
            ),
            FutureBuilder(
              future: APIService.api.fetchTVInfo(categories[1]),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  TVResponse tvResponse = snapshot.data!;
                  return TVGrid(tvResponse.results!, _navigateToTVShow);
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Popular",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Separator Sized Box.
            const SizedBox(
              height: 5,
            ),
            FutureBuilder(
              future: APIService.api.fetchTVInfo(categories[2]),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  TVResponse tvResponse = snapshot.data!;
                  return TVGrid(tvResponse.results!, _navigateToTVShow);
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    ));
  }
}
