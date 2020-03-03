import 'package:flutter_anime_mobx/src/core/models/anime.dart';
import 'package:flutter_anime_mobx/src/core/repositories/kitsu_repository.dart';
import 'package:mobx/mobx.dart';

part 'anime_store.g.dart';

class AnimeStore = AnimeBase with _$AnimeStore;

abstract class AnimeBase with Store {
  @observable
  List<Anime> animes = ObservableList.of([]);

  @observable
  bool fetching = false;

  @action
  Future<void> fetchFromKitsu() async {
    fetching = true;
    animes.addAll(await KitsuRepository().getAnimes());
    fetching = false;
  }
}
