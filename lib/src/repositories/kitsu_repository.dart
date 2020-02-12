import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobx_teste/src/models/anime.dart';

class KitsuRepository {
  final String apiURL = 'https://kitsu.io/api/edge';

  Future<List<Anime>> getAnimes() async {
    try {
      Response response = await Dio().get('$apiURL/anime');
      List<dynamic> data = List.from(jsonDecode(response.data)['data']);
      List<Anime> animes =
          data.map((anime) => Anime.fromKitsuJson(anime)).toList();
      return animes;
    } on DioError {
      return [];
    }
  }
}
