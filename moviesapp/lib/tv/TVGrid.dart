import 'package:flutter/material.dart';
import 'package:moviesapp/data/datasource/local/Products.dart';
import 'package:moviesapp/utilities/CustomGridCard.dart';
import 'package:moviesapp/utilities/ProductInfo.dart';

import '../data/model/TVCategory.dart';
import '../utilities/ProductGridCard.dart';
import 'TVList.dart';

class TVGrid extends StatelessWidget {
  const TVGrid(this.tvShows, {super.key});
  final List<TVShow> tvShows;

  @override
  Widget build(BuildContext context) {
    List<TVShow> shortList = tvShows.sublist(0, 4);
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TVList(tvShows)));
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
                            ProductInfo(shortList[index].id!, Products.tvShow),
                      ));
                },
                child: ProductGridCard(shortList[index]));
          }
        },
      ),
    );
  }
}
