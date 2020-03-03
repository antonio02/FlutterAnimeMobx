import 'package:flutter_anime_mobx/src/core/models/anime.dart';
import 'package:flutter_anime_mobx/src/core/services/kitsu_api.dart';

class KitsuRepository {
  final KitsuApi _api = KitsuApi();

  Future<List<Anime>> getAnimes() async {
    var data = await _api.animes();
    if (data != null) {
      return data.map((anime) => Anime.fromKitsu(anime)).toList();
    } else {
      return null;
    }
  }
}
