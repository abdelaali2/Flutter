import 'package:flutter/material.dart';
import 'package:moviesapp/data/datasource/remote/APIService.dart';
import 'package:moviesapp/data/model/SearchResponse.dart';
import 'package:moviesapp/utilities/CustomAppBar.dart';

import '../data/datasource/local/Products.dart';
import 'SearchTile.dart';

class SearchList extends StatelessWidget {
  SearchList(this.searchQuery, {super.key});

  String searchQuery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context),
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
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
