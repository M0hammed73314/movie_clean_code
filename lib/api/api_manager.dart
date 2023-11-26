import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/api/api_constant.dart';

import '../model/my_search.dart';

class ApiManager {
/*
https://api.themoviedb.org/3/movie/popular?api_key=c4c3d1e82f8dee40ffdf440f479d937
*/





  static Future<MySearch?> getSearch(String text) async {
    Uri url = Uri.https(
      ApiConstant.BaseUrl,
      ApiConstant.searchService,
      {'api_key': 'c4c3d1e82f8dee40ffdf440f479d9373', 'query': text},
    );

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return MySearch.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
