import 'package:flutter/material.dart';
import 'package:moviesapp/data/model/SearchResponse.dart';

import '../data/datasource/remote/constants.dart';
import '../utilities/ProductInfo.dart';

class SearchTVTile extends StatelessWidget {
  const SearchTVTile(this.searchedTVShow, {super.key});

  final SearchResults searchedTVShow;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductInfo(
                    searchedTVShow.id!, searchedTVShow.mediaType!)));
      },
      leading: FadeInImage(
        width: 60,
        placeholder: const AssetImage('assets/images/tv_void.png'),
        image: NetworkImage('$imageURL/${searchedTVShow.posterPath}'),
        fit: BoxFit.contain,
        imageErrorBuilder: (context, error, stackTrace) {
          return SizedBox(
              width: 60, child: Image.asset('assets/images/tv_filled.png'));
        },
      ),
      title: Text(
        "${searchedTVShow.name}",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      subtitle: Text("Rate: ${searchedTVShow.voteAverage} ⭐"),
      trailing: Image.asset(
        'assets/images/tv_filled.png',
        width: 24.0,
        height: 24.0,
      ),
    );
  }
}
