import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio?.get(url, queryParameters: query);
  }

  static Future<Response?> postData(
      {required String url,
      required Map<String, dynamic>? body,
      Map<String, dynamic>? query}) async {
    return dio?.post(url, data: body, queryParameters: query);
  }
}
