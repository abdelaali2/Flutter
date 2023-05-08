import 'package:dio/dio.dart';
import 'package:moviesapp/data/datasource/remote/config.dart';
import 'package:moviesapp/data/datasource/remote/constants.dart';
import 'package:moviesapp/data/model/MovieCategory.dart';

import '../../model/DetailedMovie.dart';
import '../../model/DetailedTVShow.dart';
import '../../model/SearchResponse.dart';
import '../../model/TVCategory.dart';
import '../local/Products.dart';

class APIService {
  APIService._();
  static final APIService api = APIService._();

  Future<MovieCategory> fetchMovies(String category) async {
    String url = category.replaceAll(" ", "_").toLowerCase();
    Dio dio = MovieConfig.getDio();
    Map<String, dynamic> params = {"api_key": api_key};
    Response response = await dio.get(url, queryParameters: params);
    if (response.statusCode == 200) {
      return MovieCategory.fromJson(response.data);
    } else {
      throw Exception("Unable to get Movies info from DB");
    }
  }

  Future<MovieCategory> fetchSimilarMovies(int currentMovieID) async {
    String url = "$currentMovieID/similar";
    Dio dio = MovieConfig.getDio();
    Map<String, dynamic> params = {"api_key": api_key};
    Response response = await dio.get(url, queryParameters: params);
    if (response.statusCode == 200) {
      return MovieCategory.fromJson(response.data);
    } else {
      throw Exception("Unable to get Movies info from DB");
    }
  }

  Future<TVCategory> fetchSimilarTVShows(int currentTVShowID) async {
    String url = "$currentTVShowID/similar";
    Dio dio = TVConfig.getDio();
    Map<String, dynamic> params = {"api_key": api_key};
    Response response = await dio.get(url, queryParameters: params);
    if (response.statusCode == 200) {
      return TVCategory.fromJson(response.data);
    } else {
      throw Exception("Unable to get Movies info from DB");
    }
  }

  Future<TVCategory> fetchTVShows(String category) async {
    String url = category.replaceAll(" ", "_").toLowerCase();
    Dio dio = TVConfig.getDio();
    Map<String, dynamic> params = {"api_key": api_key};
    Response response = await dio.get(url, queryParameters: params);
    if (response.statusCode == 200) {
      return TVCategory.fromJson(response.data);
    } else {
      throw Exception("Unable to get Movies info from DB");
    }
  }

  Future<SearchResponse> search(String searchQuery) async {
    Dio dio = SearchConfig.getDio();
    Map<String, dynamic> params = {"api_key": api_key, "query": searchQuery};
    Response response = await dio.get("", queryParameters: params);
    if (response.statusCode == 200) {
      return SearchResponse.fromJson(response.data);
    } else {
      throw Exception("Unable to get Movies info from DB");
    }
  }

  Future<dynamic> fetchProductInfo(
      int productID, String productMediaType) async {
    String url = "$productMediaType/$productID";
    Dio dio = BaseConfig.getDio();
    Map<String, dynamic> params = {
      "api_key": api_key,
    };
    Response response = await dio.get(url, queryParameters: params);
    if (response.statusCode == 200) {
      return productMediaType == Products.movie
          ? DetailedMovie.fromJson(response.data)
          : DetailedTVShow.fromJson(response.data);
    } else {
      throw Exception("Unable to get Movies info from DB");
    }
  }
}
