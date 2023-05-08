import 'package:flutter/material.dart';
import 'package:moviesapp/utilities/CustomAppBar.dart';
import 'package:moviesapp/utilities/ProductInfo.dart';

import '../data/datasource/local/Products.dart';
import '../data/datasource/remote/constants.dart';
import '../data/model/MovieCategory.dart';

class MoviesList extends StatelessWidget {
  final List<Movie> movieList;
  const MoviesList(this.movieList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: SingleChildScrollView(
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: movieList.length,
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductInfo(movieList[index].id!, Products.movie),
                  ));
            },
            leading: Image.network(
              "$imageURL/${movieList[index].posterPath}",
            ),
            title: Text(
              "${movieList[index].title} (${movieList[index].releaseDate?.split("-")[0]})",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            subtitle: Text("Rate: ${movieList[index].voteAverage} ⭐"),
          ),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
