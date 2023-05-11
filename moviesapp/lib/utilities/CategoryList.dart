import 'package:flutter/material.dart';
import 'package:moviesapp/utilities/CustomAppBar.dart';
import 'package:moviesapp/utilities/ProductInfo.dart';
import 'package:moviesapp/utilities/RatingStars.dart';

import '../data/datasource/local/Products.dart';
import '../data/datasource/remote/constants.dart';
import '../data/model/MovieCategory.dart';
import '../data/model/TVCategory.dart';
import 'CustomListTile.dart';

class MoviesList extends StatelessWidget {
  dynamic categoryList;
  MoviesList(this.categoryList, {super.key});

  @override
  Widget build(BuildContext context) {
    late String productType;

    if (categoryList is List<Movie>) {
      categoryList = categoryList as List<Movie>;
      productType = Products.movie;
    } else if (categoryList is List<TVShow>) {
      categoryList = categoryList as List<TVShow>;
      productType = Products.tvShow;
    }

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomAppBar(context: context),
        ],
        body: SingleChildScrollView(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categoryList.length,
            itemBuilder: (context, index) =>
                CustomListTile(categoryList[index]),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
      ),
    );
  }
}
