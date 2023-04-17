import 'package:dio/dio.dart';
import 'package:moviesapp/data/datasource/remote/config.dart';
import 'package:moviesapp/data/datasource/remote/constants.dart';
import 'package:moviesapp/data/model/MovieResponse.dart';

class APIService {
  APIService._();
  static final APIService api = APIService._();

  Future<MovieResponse> fetchMoviesInfo(String category) async {
    String url = category.replaceAll(" ", "_").toLowerCase();
    Dio dio = Config.getDio();
    Map<String, dynamic> params = {"api_key": appid};
    // url is a static String "popular"
    Response response = await dio.get(url, queryParameters: params);
    if (response.statusCode == 200) {
      return MovieResponse.fromJson(response.data);
    } else {
      throw Exception("Unable to get Movies info from DB");
    }
  }
}
