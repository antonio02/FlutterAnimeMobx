import 'package:flutter/material.dart';

import 'package:flutter_anime_mobx/src/models/anime.dart';
import 'package:flutter_anime_mobx/src/screens/detail/detail_screen.dart';

class AnimeCard extends StatelessWidget {
  final Anime anime;

  AnimeCard(this.anime);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        DetailScreen.routeName,
        arguments: DetailScreenArguments(anime),
      ),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.all(0),
        child: Stack(
          children: <Widget>[
            Hero(
              tag: 'image${anime.id}',
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(anime.coverUrl),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.transparent, Colors.black],
                ),
              ),
              child: Text(
                anime.title,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
