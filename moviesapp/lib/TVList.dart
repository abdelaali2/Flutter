import 'package:flutter/material.dart';

import 'data/datasource/remote/constants.dart';
import 'data/model/TVResponse.dart';

class TVList extends StatelessWidget {
  TVList(this.tvShows, this._navigateToTVShow, {super.key});
  List<TVResults> tvShows;
  final void Function(TVResults) _navigateToTVShow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CineGuide'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tvShows.length,
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              _navigateToTVShow(tvShows[index]);
            },
            leading: Image.network(
              "$imageURL${tvShows[index].posterPath}",
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
