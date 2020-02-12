import 'package:mobx/mobx.dart';

import 'package:mobx_teste/src/models/anime.dart';
import 'package:mobx_teste/src/repositories/kitsu_repository.dart';

part 'anime_store.g.dart';

class AnimeStore = AnimeBase with _$AnimeStore;

abstract class AnimeBase with Store {
  @observable
  List<Anime> animes = [];

  @observable
  bool fetching = false;

  @action
  Future<void> fetchFromKitsu() async {
    fetching = true;
    animes = await KitsuRepository().getAnimes();
    fetching = false;
  }
}
