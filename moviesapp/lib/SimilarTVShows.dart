import 'package:flutter/material.dart';
import 'package:moviesapp/data/model/TVResponse.dart';

import 'TVInfo.dart';
import 'data/datasource/remote/APIService.dart';
import 'data/datasource/remote/constants.dart';

class SimilarTVShows extends StatelessWidget {
  SimilarTVShows(this.currentTVShow, {super.key});

  TVResults currentTVShow;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIService.api.fetchSimilarTVShows(currentTVShow.id!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          TVResponse similarTVShowsResponse = snapshot.data!;
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
                TVResults similarTVShow =
                    similarTVShowsResponse.results![index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TVInfo(similarTVShow),
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
                              const AssetImage('assets/images/tab1.png'),
                          image: NetworkImage(
                              '$imageURL/${similarTVShow.posterPath}'),
                          fit: BoxFit.cover,
                          imageErrorBuilder: (context, error, stackTrace) {
                            return SizedBox(
                                width: 150,
                                height: 150,
                                child: Image.asset('assets/images/tab1.png'));
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
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
