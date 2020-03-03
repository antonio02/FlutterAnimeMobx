import 'dart:convert';

import 'package:dio/dio.dart';

class KitsuApi {
  final String apiURL = 'https://kitsu.io/api/edge';

  Future<List<Map<String, dynamic>>> animes() async {
    try {
      Response response = await Dio().get('$apiURL/anime');
      List<Map<String, dynamic>> data = List.from(
        jsonDecode(response.data)['data'],
      );
      return data;
    } on DioError {
      return null;
    }
  }
}
