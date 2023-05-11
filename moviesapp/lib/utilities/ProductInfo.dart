import 'package:flutter/material.dart';
import 'package:moviesapp/data/datasource/remote/APIService.dart';
import 'package:moviesapp/data/model/DetailedMovie.dart';
import 'package:moviesapp/movies/MoviePage.dart';
import 'package:moviesapp/utilities/CustomAppBar.dart';

import '../data/datasource/local/Products.dart';
import '../data/model/DetailedTVShow.dart';
import '../tv/TVShowPage.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo(this.productID, this.productMediaType, {super.key});

  final int productID;
  final String productMediaType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomAppBar(context: context),
        ],
        body: SingleChildScrollView(
          child: FutureBuilder(
            future:
                APIService.api.fetchProductInfo(productID, productMediaType),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return productMediaType == Products.movie
                    ? MoviePage(snapshot.data as DetailedMovie)
                    : TVShowPage(snapshot.data as DetailedTVShow);
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
