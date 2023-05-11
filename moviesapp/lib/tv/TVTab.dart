import 'package:flutter/material.dart';
import 'package:moviesapp/utilities/SearchBar.dart';

import '../data/datasource/local/Categories.dart';
import '../data/datasource/remote/APIService.dart';
import '../data/model/TVCategory.dart';
import '../utilities/CategoryGrid.dart';

class TVTab extends StatefulWidget {
  const TVTab({super.key});

  @override
  State<TVTab> createState() => _TVTabState();
}

class _TVTabState extends State<TVTab> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(const Duration(milliseconds: 1500), () {
          setState(() {});
        });
      },
      child: ListView(
        children: [
          SafeArea(
              child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    future: APIService.api.fetchTVShows(Categories[3]),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        TVCategory tvResponse = snapshot.data!;
                        return CategoryGrid(tvResponse.results);
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
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
                    future: APIService.api.fetchTVShows(Categories[1]),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        TVCategory tvResponse = snapshot.data!;
                        return CategoryGrid(tvResponse.results);
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
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
                    future: APIService.api.fetchTVShows(Categories[2]),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        TVCategory tvResponse = snapshot.data!;
                        return CategoryGrid(tvResponse.results);
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "On The Air",
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
                    future: APIService.api.fetchTVShows(Categories[5]),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        TVCategory tvResponse = snapshot.data!;
                        return CategoryGrid(tvResponse.results);
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
