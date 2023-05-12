import 'package:flutter/material.dart';
import 'package:moviesapp/utilities/GridMoreCard.dart';
import '../data/datasource/local/Products.dart';
import '../data/model/MovieCategory.dart';
import '../data/model/TVCategory.dart';
import 'ProductInfo.dart';
import 'ProductGridCard.dart';
import 'CategoryList.dart';

class CategoryGrid<T> extends StatelessWidget {
  dynamic categoryGrid;
  CategoryGrid(this.categoryGrid, {super.key});

  @override
  Widget build(BuildContext context) {
    dynamic shortList;
    late String productType;

    shortList ??= [];

    if (categoryGrid is List<Movie>) {
      categoryGrid = categoryGrid as List<Movie>;
      shortList = <Movie>[];
      shortList.addAll(categoryGrid.sublist(0, 5));
      productType = Products.movie;
    } else if (categoryGrid is List<TVShow>) {
      categoryGrid = categoryGrid as List<TVShow>;
      shortList = <TVShow>[];
      shortList.addAll(categoryGrid.sublist(0, 5));
      productType = Products.tvShow;
    }

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
          childAspectRatio: 2,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          if (index == shortList.length) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MoviesList(categoryGrid)));
              },
              child: const GridMoreCard(),
            );
          } else {
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductInfo(shortList[index].id!, productType),
                      ));
                },
                child: ProductGridCard(shortList[index]));
          }
        },
      ),
    );
  }
}
