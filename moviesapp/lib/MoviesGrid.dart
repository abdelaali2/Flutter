import 'package:flutter/material.dart';
import 'package:moviesapp/MoviesList.dart';
import 'CustomGridCard.dart';
import 'MovieGridCard.dart';
import 'MovieInfo.dart';
import 'data/datasource/remote/constants.dart';
import 'data/model/MovieResponse.dart';

class MoviesGrid extends StatelessWidget {
  List<Results> movieList;
  final void Function(Results) _navigateToMovie;

  MoviesGrid(this.movieList, this._navigateToMovie, {super.key});

  @override
  Widget build(BuildContext context) {
    List<Results> shortList = movieList.sublist(0, 4);
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: GridView.builder(
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: shortList.length + 1,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 2 / 0.8,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          if (index == shortList.length) {
            return InkWell(
              onTap: () {
                _showMore(context);
              },
              child: const CustomCard(),
            );
          } else {
            return InkWell(
                onTap: () {
                  _navigateToMovie(shortList[index]);
                },
                child: MovieGridCard(shortList[index]));
          }
        },
      ),
    );
  }

  void _showMore(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MoviesList(movieList, _navigateToMovie)));
  }
}
