import 'package:flutter/material.dart';
import 'package:moviesapp/utilities/CustomGridCard.dart';
import '../data/datasource/local/Products.dart';
import '../data/model/MovieCategory.dart';
import '../utilities/ProductInfo.dart';
import 'MovieGridCard.dart';
import 'MoviesList.dart';

class MoviesGrid extends StatelessWidget {
  final List<Movie> movieList;
  const MoviesGrid(this.movieList, {super.key});

  @override
  Widget build(BuildContext context) {
    List<Movie> shortList = movieList.sublist(0, 4);
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MoviesList(movieList)));
              },
              child: const CustomCard(),
            );
          } else {
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductInfo(shortList[index].id!, Products.movie),
                      ));
                },
                child: MovieGridCard(shortList[index]));
          }
        },
      ),
    );
  }
}
