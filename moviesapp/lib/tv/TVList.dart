import 'package:flutter/material.dart';
import 'package:moviesapp/utilities/CustomAppBar.dart';
import 'package:moviesapp/utilities/ProductInfo.dart';

import '../data/datasource/local/Products.dart';
import '../data/datasource/remote/constants.dart';
import '../data/model/TVCategory.dart';

class TVList extends StatelessWidget {
  const TVList(this.tvShows, {super.key});
  final List<TVShow> tvShows;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: SingleChildScrollView(
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tvShows.length,
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductInfo(tvShows[index].id!, Products.tvShow),
                  ));
            },
            leading: Image.network(
              "$imageURL/${tvShows[index].posterPath}",
            ),
            title: Text(
              "${tvShows[index].name} (${tvShows[index].firstAirDate?.split("-")[0]})",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            subtitle: Text("Rate: ${tvShows[index].voteAverage} ⭐"),
          ),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
