class Anime {
  String title;
  String coverUrl;

  Anime({this.title, this.coverUrl});

  factory Anime.fromKitsuJson(json) {
    return Anime(
      title: json['attributes']['canonicalTitle'],
      coverUrl: json['attributes']['posterImage']['small'],
    );
  }
}
