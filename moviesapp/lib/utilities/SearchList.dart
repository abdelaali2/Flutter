import 'package:flutter/material.dart';
import 'package:moviesapp/data/datasource/remote/APIService.dart';
import 'package:moviesapp/data/model/SearchResponse.dart';
import 'package:moviesapp/utilities/CustomAppBar.dart';
import 'package:moviesapp/utilities/NetworkError.dart';

import '../data/datasource/local/Products.dart';
import 'SearchTile.dart';

class SearchList extends StatelessWidget {
  SearchList(this.searchQuery, {super.key});

  String searchQuery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomAppBar(context: context),
        ],
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: APIService.api.search(searchQuery),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                SearchResponse searchPayload = snapshot.data!;
                List<SearchResults> results = searchPayload.results!;
                return SingleChildScrollView(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: results.length,
                    itemBuilder: (context, index) => SearchTile(results[index]),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                );
              } else if (snapshot.hasError) {
                return NetworkError();
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
