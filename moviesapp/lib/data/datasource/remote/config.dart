import 'package:dio/dio.dart';

class MovieConfig {
  static Dio getDio() {
    Dio dio = Dio(BaseOptions(baseUrl: "https://api.themoviedb.org/3/movie/"));
    dio.interceptors
        .add(LogInterceptor(responseBody: true, request: true, error: true));
    return dio;
  }
}

class TVConfig {
  static Dio getDio() {
    Dio dio = Dio(BaseOptions(baseUrl: "https://api.themoviedb.org/3/tv/"));
    dio.interceptors
        .add(LogInterceptor(responseBody: true, request: true, error: true));
    return dio;
  }
}

class SearchConfig {
  static Dio getDio() {
    Dio dio =
        Dio(BaseOptions(baseUrl: "https://api.themoviedb.org/3/search/multi"));
    dio.interceptors
        .add(LogInterceptor(responseBody: true, request: true, error: true));
    return dio;
  }
}

class BaseConfig {
  static Dio getDio() {
    Dio dio = Dio(BaseOptions(baseUrl: "https://api.themoviedb.org/3/"));
    dio.interceptors
        .add(LogInterceptor(responseBody: true, request: true, error: true));
    return dio;
  }
}
