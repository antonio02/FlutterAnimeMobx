import 'package:flutter/material.dart';

import 'package:mobx_teste/src/models/anime.dart';

class AnimeCard extends StatelessWidget {
  final Anime anime;

  AnimeCard(this.anime);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(anime.coverUrl),
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
    );
  }
}
