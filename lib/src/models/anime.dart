class Anime {
  String id;
  String title;
  String coverUrl;

  Anime({this.id, this.title, this.coverUrl});

  factory Anime.fromKitsuJson(json) {
    return Anime(
      id: json['id'],
      title: json['attributes']['canonicalTitle'],
      coverUrl: json['attributes']['posterImage']['small'],
    );
  }
}
