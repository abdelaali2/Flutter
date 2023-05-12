import 'package:flutter/material.dart';
import 'package:moviesapp/data/datasource/local/Products.dart';
import 'package:moviesapp/data/model/TVCategory.dart';
import 'package:moviesapp/utilities/NetworkError.dart';
import 'package:moviesapp/utilities/ProductInfo.dart';

import '../data/datasource/remote/APIService.dart';
import '../data/datasource/remote/constants.dart';
import '../data/model/DetailedTVShow.dart';

class SimilarTVShows extends StatelessWidget {
  const SimilarTVShows(this.currentTVShow, {super.key});

  final DetailedTVShow currentTVShow;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIService.api.fetchSimilarTVShows(currentTVShow.id!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          TVCategory similarTVShowsResponse = snapshot.data!;
          return SizedBox(
            width: double.infinity,
            height: 200,
            child: GridView.builder(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: similarTVShowsResponse.results!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (context, index) {
                TVShow similarTVShow = similarTVShowsResponse.results![index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductInfo(similarTVShow.id!, Products.tvShow),
                        ));
                  },
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(150),
                        child: FadeInImage(
                          width: 150,
                          height: 150,
                          placeholder:
                              const AssetImage('assets/images/tv_void.png'),
                          image: NetworkImage(
                              '$imageURL/${similarTVShow.posterPath}'),
                          fit: BoxFit.cover,
                          imageErrorBuilder: (context, error, stackTrace) {
                            return SizedBox(
                                width: 150,
                                height: 150,
                                child:
                                    Image.asset('assets/images/tv_filled.png'));
                          },
                        ),
                      ),
                      Text("${similarTVShow.name}"),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return NetworkError();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
