import 'package:flutter/material.dart';

import 'package:flutter_anime_mobx/src/models/anime.dart';

class DetailScreen extends StatefulWidget {
  final Anime anime;

  DetailScreen(this.anime);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'image${widget.anime.id}',
        child: AspectRatio(
          aspectRatio: 16 / 10,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.anime.coverUrl),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
